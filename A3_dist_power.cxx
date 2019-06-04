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
  for(int j = 0; j<16; j++){
    sprintf(h2name,"Fraction of power below 75 MHz");
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

      for (int i = 0; i < 16; i++){
	TGraph* gr = realAtriEvPtr_fullcalib->getGraphFromRFChan(i);
	TGraph *Waveform_Interpolated = FFTtools::getInterpolatedGraph(gr,interpolation_step);
	delete gr;
	TGraph *Waveform_Padded = FFTtools::padWaveToLength(Waveform_Interpolated, Waveform_Interpolated->GetN()+6000);
	delete Waveform_Interpolated;
	TGraph *Waveform_Cropped=FFTtools::cropWave(Waveform_Padded,-300.,300.);
	delete Waveform_Padded;
	TGraph* spectra = FFTtools::makePowerSpectrumMilliVoltsNanoSeconds(Waveform_Cropped);
	delete Waveform_Cropped;
	double pow_bins[16];
	double integral[16];
	double frac_pow[16];
	//	if (i == 0 || i == 3 || i == 7 || i == 11 || i == 15){
	  int num_bins = spectra->GetN();
	  //  cout << "number of bins is " << num_bins << endl;
	  double integral_tmp = 0;
	  for(int samp=0; samp<num_bins; samp++){
	    integral_tmp+=spectra->GetY()[samp];
	  }
	  integral[i]=integral_tmp;
	  //	cout << "The integral is " << integral_tmp << endl;
	  double power = 0;
	  for(int j = 0; j < 45; j++){
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
	    delete spectra;
      }
      delete realAtriEvPtr_fullcalib;
  }//end loop over events
  
  TCanvas *c3 = new TCanvas("","",850*4,850*4);
  c3->Divide(4,4);
  for(int i=0; i<15; i++){//canvas loop
    char ch_name[20];
    sprintf(ch_name,"Fraction of power below 75 MHz");
    c3->cd(i+1);
    h2[i]->SetTitle(ch_name);
    h2[i]->Draw("");
	 
  }//canvas loop
  char ch_name_[50];
  sprintf(ch_name_,"power_below_75MHz_16_run%d.png",run_num);

  c3->SaveAs(ch_name_);
  delete c3;
   
    
  
}//finish main
