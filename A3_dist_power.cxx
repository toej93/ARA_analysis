#include <iostream>
#include <cstdlib>
#include <sstream>
#include <fstream>
#include <stdio.h>
#include <memory>
#include <boost/scoped_ptr.hpp>
#include <vector>
#include <cmath>
#include <algorithm>
#include <fftw3.h>
#include <ctime>
#include "time.h" // for time convert

//ROOT Includes
#include "TTreeIndex.h"
#include "TTree.h"
#include "TFile.h"
#include "TGraph.h"
#include "TCanvas.h"
#include "TText.h"
#include "TStyle.h"
#include "TGaxis.h"
#include "TPaveStats.h"
#include "TH2F.h"
#include "TH2D.h"
#include "TMath.h"
#include "TF1.h"
#include "TH1D.h"
#include "TChain.h"
#include "TString.h"
#include "TVector3.h"
#include "TLegend.h"
#include "TStyle.h"


//AraSim Includes
#ifndef ___CINT___ //shielded from CINT
#include "Settings.h"
#endif

#include "RawIcrrStationEvent.h"  
#include "UsefulIcrrStationEvent.h"
#include "RawAraStationEvent.h"
#include "RawAtriStationEvent.h"
#include "UsefulAtriStationEvent.h"
#include "AraEventCalibrator.h"
#include "AraGeomTool.h"
#include "FFTtools.h"
#include "AraStationInfo.h"
#include "TPaletteAxis.h"
TStyle* RootStyle();

using namespace std;

int main(int argc, char **argv)
{ //start main

  TChain chain("eventTree"); //this for the events for the exterior loop     
  for(int file=1; file<argc; file++){
    TString fileKey(argv[file]); //a file key                                
    chain.Add(fileKey); //add files to the chain                             
  }
  // int channel = atof(argv[1]);
  RawAtriStationEvent *rawEvPtr=0;
  chain.SetBranchAddress("event",&rawEvPtr);
  int numEntries = chain.GetEntries();
  Int_t run_num=0;
  int stationId=0;
  
  stationId = rawEvPtr->stationId; //assign the statio id number
  
  chain.SetBranchAddress("run",&run_num); //set the branch address

  AraEventCalibrator *calib = AraEventCalibrator::Instance(); //make a calibrator
  cout << "Number of events is " << numEntries << endl;

  TH1F *h2[20];
  char h2name[50];
  for(int j = 0; j<20; j++){
    sprintf(h2name,"Fraction of power below 150 MHz, channel %d",j);
    h2[j] = new TH1F(h2name,h2name,100,0,1);
  }
  
  for(int event=0; event<numEntries; event++){//loop over events
    chain.GetEvent(event);
    //  if(rawEvPtr->isCalpulserEvent()==false){
      int evt_num = rawEvPtr->eventNumber;//event number
      UsefulAtriStationEvent *realAtriEvPtr_fullcalib = new UsefulAtriStationEvent(rawEvPtr, AraCalType::kLatestCalib); //make the event
      vector<TGraph*> graphs;
      vector<TGraph*> graphs_spectra;
      double interpolation_step = 0.5;

      for (int i = 0; i < 20; i++){
	TGraph* gr = realAtriEvPtr_fullcalib->getGraphFromRFChan(i);
	TGraph *Waveform_Interpolated = FFTtools::getInterpolatedGraph(gr,interpolation_step);
	delete gr;
	TGraph *Waveform_Padded = FFTtools::padWaveToLength(Waveform_Interpolated, Waveform_Interpolated->GetN()+6000);
	delete Waveform_Interpolated;
	TGraph *Waveform_Cropped=FFTtools::cropWave(Waveform_Padded,-300.,300.);
	delete Waveform_Padded;
	TGraph* spectra = FFTtools::makePowerSpectrumMilliVoltsNanoSeconds(Waveform_Cropped);
	double pow_bins[20];
	double integral[20];
	double frac_pow[20];
	//	if (i == 0 || i == 3 || i == 7 || i == 11 || i == 15){
	  int num_bins = spectra->GetN();
	  //	cout << "number of bins is " << num_bins << endl;
	  double integral_tmp = 0;
	  for(int samp=0; samp<num_bins; samp++){
	    integral_tmp+=spectra->GetY()[samp];
	  }
	  integral[i]=integral_tmp;
	  //	cout << "The integral is " << integral_tmp << endl;
	  double power = 0;
	  for(int j = 0; j < 91; j++){
	    double freq_bin = spectra->GetX()[j];
	    double magnitude = spectra->GetY()[j];

	    power+=magnitude;
	    //	  cout << "Power is " << power << endl;
	  }
	  pow_bins[i]=power;
	  power = 0;
	  frac_pow[i] = pow_bins[i]/integral[i];
	  //	  if(frac_pow[i]>0.15){
	    h2[i]->Fill(frac_pow[i]);
	    
	    //	  }//If glitch
	    //	}//If in affected channels

      }
      delete realAtriEvPtr_fullcalib;

      //Need to check channels 3, 7, 11.

    
      for (int i=0; i < graphs.size(); i++){
	delete graphs[i];
	delete graphs_spectra[i];
      }
      graphs.clear();
      graphs_spectra.clear();
      // }
  }//end loop over events
  
  TCanvas *c3 = new TCanvas("","",850,850);
  gStyle->SetOptStat(0);
  for(int i=0; i<15; i+=1){//canvas loop
    h2[i]->SetLineColor(i-1);
    if (i == 11){
      h2[i]->SetLineColor(4);
    }
    h2[i]->Draw("SAME");	  
  }//canvas loop
  h2[0]->Draw("SAME");
  TLegend *legend = new TLegend(0.7,0.7,0.98,0.9);
  legend->AddEntry(h2[0],"Channel 0","l");  
  legend->AddEntry(h2[3],"Channel 3","l");
  legend->AddEntry(h2[7],"Channel 7","l");
  legend->AddEntry(h2[11],"Channel 11","l");
  legend->AddEntry(h2[15],"Channel 15","l");
  legend->Draw();
  c3->Update();
  char h3name[100];
  sprintf(h3name,"./pow_dist_run%d.png",run_num);
  c3->SaveAs(h3name);    
  delete c3;
   
    
  
}//finish main
