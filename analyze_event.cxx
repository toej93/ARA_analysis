//analyze_event.cxx
//Jorge Torres, Oct 2019.

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
#include "AraQualCuts.h"
#include "tools_PlottingFns.h"
#include "tools_RecoFns.h"
#include "tools_inputParameters.h"
#include "tools_outputObjects.h"
#include "tools_Cuts.h"
TStyle* RootStyle();

using namespace std;

int main(int argc, char **argv)
{ //start main
  /*
  arguments
  0: exec
  1: station num (2/3)
  2 : input file
  */

  TChain chain("eventTree"); //this for the events for the exterior loop
  for(int file=2; file<argc; file++){
    TString fileKey(argv[file]); //a file key
    chain.Add(fileKey); //add files to the chain
  }
  int station = atoi(argv[1]);
  RawAtriStationEvent *rawEvPtr=0;
  chain.SetBranchAddress("event",&rawEvPtr);

  // int numEntries = chain.GetEntries();
  int numEntries = 1000;
  Int_t run_num=0;
  int stationId=0;

  chain.SetBranchAddress("run",&run_num); //set the branch address
  AraQualCuts *qualCut = AraQualCuts::Instance();
  AraEventCalibrator *calib = AraEventCalibrator::Instance(); //make a calibrator

  cout << "Number of events is " << numEntries << endl;
  for(int event=0; event<numEntries; event++){//loop over events
    chain.GetEvent(event);
    //if(rawEvPtr->isCalpulserEvent()==false){
      int evt_num = rawEvPtr->eventNumber;//event number
      UsefulAtriStationEvent *realAtriEvPtr_fullcalib = new UsefulAtriStationEvent(rawEvPtr, AraCalType::kLatestCalib); //make the event
      vector<TGraph*> graphs;
      vector<TGraph*> graphs_spectra;
      double interpolation_step = 0.5;
      if(!qualCut->isGoodEvent(realAtriEvPtr_fullcalib)) cout << evt_num << endl;

      for (int i = 0; i < 16; i++){
        TGraph* gr = realAtriEvPtr_fullcalib->getGraphFromRFChan(i);
        TGraph *Waveform_Interpolated = FFTtools::getInterpolatedGraph(gr,interpolation_step);
        //	delete gr;
        TGraph *Waveform_Padded = FFTtools::padWaveToLength(Waveform_Interpolated, Waveform_Interpolated->GetN()+6000);
        delete Waveform_Interpolated;
        TGraph *Waveform_Cropped=FFTtools::cropWave(Waveform_Padded,-300.,300.);
        delete Waveform_Padded;
        TGraph* spectra = FFTtools::makePowerSpectrumMilliVoltsNanoSeconds(Waveform_Cropped);
        graphs.push_back(gr);
        graphs_spectra.push_back(spectra);
      }
      delete realAtriEvPtr_fullcalib;

      vector<TGraph*> dummy;
      for(int i=0; i<16; i++){
        vector<double> thisX;
        vector<double> thisY;
        thisX.push_back(-250);
        thisX.push_back(800);
        thisY.push_back(-700);
        thisY.push_back(700);
        dummy.push_back(new TGraph(2,&thisX[0], &thisY[0]));
      }

      TCanvas *c2 = new TCanvas("","",1550,1550);
      c2->Divide(4,4);
      for(int i=0; i<16; i++){//canvas loop
        char ch_name[20];
        if(rawEvPtr->isCalpulserEvent()==true) sprintf(ch_name,"chan %d, calpulser",i);
        else sprintf(ch_name,"chan %d",i);
        c2->cd(i+1);
        graphs[i]->SetTitle(ch_name);
        dummy[i]->SetTitle(ch_name);
        dummy[i]->Draw("AP");
        dummy[i]->SetLineColor(kWhite);
        graphs[i]->Draw("SAMEL");

      }//canvas loop

      char h2name[60];
      sprintf(h2name,"./plots/wforms/wf_A%i_run%d_event%d.png", station, run_num,evt_num);
      c2->SaveAs(h2name);
      delete c2;

      TCanvas *c3 = new TCanvas("","",1550,1550);
      c3->Divide(4,4);
      for(int i=0; i<16; i++){//canvas loop
        char ch_name[20];
        if(rawEvPtr->isCalpulserEvent()==true) sprintf(ch_name,"chan %d, calpulser",i);
        else sprintf(ch_name,"chan %d",i);
        c3->cd(i+1);
        gPad->SetLogy();
        graphs_spectra[i]->SetTitle(ch_name);
        graphs_spectra[i]->Draw("AL");
      }//canvas loop
      char h3name[100];
      sprintf(h3name,"./plots/spectra/spectrum_A%i_run%d_event%d.png", station, run_num,evt_num);
      c3->SaveAs(h3name);
      delete c3;

      //    }
      for (int i=0; i < graphs.size(); i++){
        delete graphs[i];
        delete graphs_spectra[i];
      }
      graphs.clear();
      graphs_spectra.clear();
    //}
  }//end loop over events
}//end main
