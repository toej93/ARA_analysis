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
#include "tools_WaveformFns.h"

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

  int numEntries = chain.GetEntries();
  //int numEntries = 1000;
  Int_t run_num=0;
  int stationId=0;

  chain.SetBranchAddress("run",&run_num); //set the branch address
  AraQualCuts *qualCut = AraQualCuts::Instance();
  AraEventCalibrator *calib = AraEventCalibrator::Instance(); //make a calibrator
  vector<int> BadRunList = BuildBadRunList(3);
  if(isBadRun(3, run_num, BadRunList)) return -1;
	if(isSoftwareDominatedRun("/users/PCON0003/cond0068/ARA/AraRoot/analysis/a23_analysis_tools", 3, run_num)) return -1;
  cout << "Number of events is " << numEntries << endl;
  for(int event=0; event<numEntries; event++){//loop over events
    chain.GetEvent(event);
    //if(rawEvPtr->isCalpulserEvent()==false){
    int evt_num = rawEvPtr->eventNumber;//event number
    cout << evt_num << endl;
    // if(evt_num<68000) continue;
    UsefulAtriStationEvent *realAtriEvPtr_fullcalib = new UsefulAtriStationEvent(rawEvPtr, AraCalType::kLatestCalib); //make the event
    vector<TGraph*> spareElecChanGraphs;
  	spareElecChanGraphs.push_back(realAtriEvPtr_fullcalib->getGraphFromElecChan(6));
  	spareElecChanGraphs.push_back(realAtriEvPtr_fullcalib->getGraphFromElecChan(14));
  	spareElecChanGraphs.push_back(realAtriEvPtr_fullcalib->getGraphFromElecChan(22));
  	spareElecChanGraphs.push_back(realAtriEvPtr_fullcalib->getGraphFromElecChan(30));
    int hasBadSpareChanIssue = false;
    int hasBadSpareChanIssue_v2out = false;
    hasBadSpareChanIssue=hasSpareChannelIssue(spareElecChanGraphs);
    hasBadSpareChanIssue_v2out=hasSpareChannelIssue_v2(spareElecChanGraphs,3);
  	// if(hasBadSpareChanIssue || hasBadSpareChanIssue_v2out){
  	// 	cout<<"Has bad spare chan issue! Like, yes, actually"<<endl;
    //   continue;
  	// }
  	deleteGraphVector(spareElecChanGraphs);



    vector<TGraph*> graphs;
    vector<TGraph*> graphs_spectra;
    double interpolation_step = 0.5;
    if(!qualCut->isGoodEvent(realAtriEvPtr_fullcalib)) continue;
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
    //isSpikeyStringEvent(3,0,graphs,2);

    if(!isCliffEvent(graphs)){
      for (int i=0; i < graphs.size(); i++){
        delete graphs[i];
        delete graphs_spectra[i];
      }
      graphs.clear();
      graphs_spectra.clear();
      continue;
    }
    // if(!isSpikeyStringEvent(3,0,graphs,2)){
    //   for (int i=0; i < graphs.size(); i++){
    //     delete graphs[i];
    //     delete graphs_spectra[i];
    //   }
    //   graphs.clear();
    //   graphs_spectra.clear();
    //   continue;
    // }
    // cout << "Here" << endl;


    // else if(isCliffEvent(graphs_spikey)){
    //   cout << run_num << endl;
    //   cout << evt_num << endl;
    //   return 0;
    // }

    vector<TGraph*> dummy;
    for(int i=0; i<16; i++){
      vector<double> thisX;
      vector<double> thisY;
      thisX.push_back(450);
      thisX.push_back(150);
      thisY.push_back(0);
      thisY.push_back(700);
      dummy.push_back(new TGraph(2,&thisX[0], &thisY[0]));
    }

    TCanvas *c2 = new TCanvas("","",2550,2550);
    c2->Divide(4,4);
    for(int i=0; i<16; i++){//canvas loop
      char ch_name[20];
      if(rawEvPtr->isCalpulserEvent()==true) sprintf(ch_name,"chan %d, calpulser",i);
      else sprintf(ch_name,"chan %d",i);
      c2->cd(i+1);
      graphs[i]->SetTitle(ch_name);
      // dummy[i]->SetTitle(ch_name);
      // dummy[i]->Draw("AP");
      // dummy[i]->SetLineColor(kWhite);
      // if(i==0) graphs[i]->GetXaxis()->SetRangeUser(200., 300.);
      // if(i==1) graphs[i]->GetXaxis()->SetRangeUser(200., 300.);
      // if(i==2) graphs[i]->GetXaxis()->SetRangeUser(230., 350.);
      // if(i==3) graphs[i]->GetXaxis()->SetRangeUser(250., 330.);
      // if(i==4) graphs[i]->GetXaxis()->SetRangeUser(300., 410.);
      // if(i==5) graphs[i]->GetXaxis()->SetRangeUser(300., 400.);
      // if(i==6) graphs[i]->GetXaxis()->SetRangeUser(0., 450.);
      // if(i==7) graphs[i]->GetXaxis()->SetRangeUser(200., 300.);
      // if(i==8) graphs[i]->GetXaxis()->SetRangeUser(190., 300.);
      // if(i==9) graphs[i]->GetXaxis()->SetRangeUser(180., 270.);
      // if(i==10) graphs[i]->GetXaxis()->SetRangeUser(220., 300.);
      // if(i==11) graphs[i]->GetXaxis()->SetRangeUser(220., 300.);
      // if(i==12) graphs[i]->GetXaxis()->SetRangeUser(290., 380.);
      // if(i==13) graphs[i]->GetXaxis()->SetRangeUser(290., 380.);
      // if(i==14) graphs[i]->GetXaxis()->SetRangeUser(0., 380.);
      // if(i==15) graphs[i]->GetXaxis()->SetRangeUser(340., 420.);
      graphs[i]->Draw("");

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
    // c3->SaveAs(h3name);
    delete c3;

    TCanvas *c4 = new TCanvas("","",2550,2550);
    c4->Divide(4,4);
    TGraph *corr_graph[16];
    for(int i=0; i<16; i++){//canvas loop
      char ch_name[20];
      if(rawEvPtr->isCalpulserEvent()==true) sprintf(ch_name,"chan %d, calpulser",i);
      else sprintf(ch_name,"chan %d",i);
      c4->cd(i+1);
      // gPad->SetLogy();
      corr_graph[i] = FFTtools::getHilbertEnvelope(graphs[i]);
      corr_graph[i]->SetTitle(ch_name);
      // dummy[i]->SetTitle(ch_name);
      // dummy[i]->Draw("AP");
      // dummy[i]->SetLineColor(kWhite);
      if(i==0) corr_graph[i]->GetXaxis()->SetRangeUser(200., 300.);
      if(i==1) corr_graph[i]->GetXaxis()->SetRangeUser(200., 300.);
      if(i==2) corr_graph[i]->GetXaxis()->SetRangeUser(230., 350.);
      if(i==3) corr_graph[i]->GetXaxis()->SetRangeUser(250., 330.);
      if(i==4) corr_graph[i]->GetXaxis()->SetRangeUser(300., 410.);
      if(i==5) corr_graph[i]->GetXaxis()->SetRangeUser(300., 400.);
      if(i==6) corr_graph[i]->GetXaxis()->SetRangeUser(0., 450.);
      if(i==7) corr_graph[i]->GetXaxis()->SetRangeUser(350., 450.);
      if(i==8) corr_graph[i]->GetXaxis()->SetRangeUser(190., 300.);
      if(i==9) corr_graph[i]->GetXaxis()->SetRangeUser(180., 270.);
      if(i==10) corr_graph[i]->GetXaxis()->SetRangeUser(220., 300.);
      if(i==11) corr_graph[i]->GetXaxis()->SetRangeUser(220., 300.);
      if(i==12) corr_graph[i]->GetXaxis()->SetRangeUser(290., 380.);
      if(i==13) corr_graph[i]->GetXaxis()->SetRangeUser(290., 380.);
      if(i==14) corr_graph[i]->GetXaxis()->SetRangeUser(0., 380.);
      if(i==15) corr_graph[i]->GetXaxis()->SetRangeUser(340., 420.);
      corr_graph[i]->Draw("");

    }//canvas loop

    char h4name[60];
    sprintf(h4name,"./plots/hilbert_env/hilbert_A%i_run%d_event%d.png", station, run_num,evt_num);
    // c4->SaveAs(h4name);
    delete c4;


    TCanvas *c5 = new TCanvas("","",2550,2550);
    c5->Divide(4,4);
    TGraph *cut_graph[16];
    for(int i=0; i<16; i++){//canvas loop
      char ch_name[20];
      if(rawEvPtr->isCalpulserEvent()==true) sprintf(ch_name,"chan %d, calpulser",i);
      else sprintf(ch_name,"chan %d",i);
      c5->cd(i+1);
      // gPad->SetLogy();
      cut_graph[i] = FFTtools::getHilbertEnvelope(graphs[i]);
      cut_graph[i]->SetTitle(ch_name);
      // dummy[i]->SetTitle(ch_name);
      // dummy[i]->Draw("AP");
      // dummy[i]->SetLineColor(kWhite);
      // if(i==0) corr_graph[i]->GetXaxis()->SetRangeUser(200., 300.);
      // if(i==1) corr_graph[i]->GetXaxis()->SetRangeUser(200., 300.);
      // if(i==2) corr_graph[i]->GetXaxis()->SetRangeUser(230., 350.);
      // if(i==3) corr_graph[i]->GetXaxis()->SetRangeUser(250., 330.);
      // if(i==4) corr_graph[i]->GetXaxis()->SetRangeUser(300., 410.);
      // if(i==5) corr_graph[i]->GetXaxis()->SetRangeUser(300., 400.);
      // if(i==6) corr_graph[i]->GetXaxis()->SetRangeUser(0., 450.);
      // if(i==7) corr_graph[i]->GetXaxis()->SetRangeUser(350., 450.);
      // if(i==8) corr_graph[i]->GetXaxis()->SetRangeUser(190., 300.);
      // if(i==9) corr_graph[i]->GetXaxis()->SetRangeUser(180., 270.);
      // if(i==10) corr_graph[i]->GetXaxis()->SetRangeUser(220., 300.);
      // if(i==11) corr_graph[i]->GetXaxis()->SetRangeUser(220., 300.);
      // if(i==12) corr_graph[i]->GetXaxis()->SetRangeUser(290., 380.);
      // if(i==13) corr_graph[i]->GetXaxis()->SetRangeUser(290., 380.);
      // if(i==14) corr_graph[i]->GetXaxis()->SetRangeUser(0., 380.);
      // if(i==15) corr_graph[i]->GetXaxis()->SetRangeUser(340., 420.);
      // corr_graph[i]->Draw("");

    }//canvas loop

    char h5name[60];
    sprintf(h5name,"./plots/hilbert_env/hilbert_A%i_run%d_event%d.png", station, run_num,evt_num);
    // c4->SaveAs(h5name);
    delete c5;

    //    }
    for (int i=0; i < graphs.size(); i++){
      delete graphs[i];
      delete graphs_spectra[i];
      delete corr_graph[i];
    }
    graphs.clear();
    graphs_spectra.clear();
    //}
  }//end loop over events
}//end main
