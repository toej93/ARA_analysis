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

  char *PedDirPath(getenv("PED_DIR"));
  if (PedDirPath == NULL){
    std::cout << "Warning! $PED_DIR is not set!" << endl;
    return -1;
  }

  int station = atoi(argv[1]);
  RawAtriStationEvent *rawEvPtr=0;
  chain.SetBranchAddress("event",&rawEvPtr);
  int numEntries = chain.GetEntries();
  //int numEntries = 1000;
  Int_t run_num=0;
  int stationId=0;

  chain.SetBranchAddress("run",&run_num); //set the branch address
  // cout << run_num << endl;
  chain.GetEntry(0);
  AraEventCalibrator *calib = AraEventCalibrator::Instance(); //make a calibrator
  char ped_file_name[400];
  sprintf(ped_file_name,"%s/run_specific_peds/A%d/all_peds/event%d_specificPeds.dat",PedDirPath,station,run_num);
  calib->setAtriPedFile(ped_file_name,station); //because someone had a brain (!!), this will error handle itself if the pedestal doesn't exist

  vector<int> BadRunList = BuildBadRunList(3);
  if(isBadRun(3, run_num, BadRunList)) return -1;
	if(isSoftwareDominatedRun("/users/PCON0003/cond0068/ARA/AraRoot/analysis/a23_analysis_tools", 3, run_num)) return -1;
  cout << "Number of events is " << numEntries << endl;
  for(int event=133600; event<numEntries; event++){//loop over events
    chain.GetEvent(event);
    //if(rawEvPtr->isCalpulserEvent()==false){
    int evt_num = rawEvPtr->eventNumber;//event number
    if(evt_num!=133861) continue;
    // cout << evt_num << endl;

    UsefulAtriStationEvent *realAtriEvPtr_fullcalib = new UsefulAtriStationEvent(rawEvPtr, AraCalType::kLatestCalib); //make the event
    AraQualCuts *qualCut = AraQualCuts::Instance();
    vector<TGraph*> spareElecChanGraphs;
  	spareElecChanGraphs.push_back(realAtriEvPtr_fullcalib->getGraphFromElecChan(6));
  	spareElecChanGraphs.push_back(realAtriEvPtr_fullcalib->getGraphFromElecChan(14));
  	spareElecChanGraphs.push_back(realAtriEvPtr_fullcalib->getGraphFromElecChan(22));
  	spareElecChanGraphs.push_back(realAtriEvPtr_fullcalib->getGraphFromElecChan(30));
    int hasBadSpareChanIssue = false;
    int hasBadSpareChanIssue_v2out = false;
    hasBadSpareChanIssue=hasSpareChannelIssue(spareElecChanGraphs);
    hasBadSpareChanIssue_v2out=hasSpareChannelIssue_v2(spareElecChanGraphs,3);
    deleteGraphVector(spareElecChanGraphs);
  	if(hasBadSpareChanIssue || hasBadSpareChanIssue_v2out){
  		// cout<<"Has bad spare chan issue! Like, yes, actually"<<endl;
      continue;
  	}


    double time1[16]={210,200,250,250,300,300,100,360,190,180,220,240,300,200,100,340};
    double time2[16]={240,240,300,305,360,340,200,400,220,220,260,270,320,325,200,370};
    double time3[16]={260,265,1000,1000,370,375,1000,405,1000,240,1000,275,1000,360,1000,1000};
    double time4[16]={260,265,1000,1000,370,375,1000,405,1000,240,1000,275,1000,360,1000,1000};

    // peak2
    // double time1[16]={210,200,230,250,300,300,0,200,190,180,220,220,290,290,0,340};
    // double time2[16]={240,300,350,330,410,400,450,300,300,270,300,300,380,380,380,420};

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
      TGraph *Waveform_Cropped=FFTtools::cropWave(Waveform_Padded,-300.,700.);
      delete Waveform_Padded;
      int nSamp=Waveform_Cropped->GetN();
      double newY[nSamp];
      double newX[nSamp];
      for(int jj=0;jj<nSamp;jj++){
        newX[jj]=Waveform_Cropped->GetX()[jj];
        if(Waveform_Cropped->GetX()[jj]<time3[i]){
          newY[jj]=0.;
        }
        else newY[jj]=Waveform_Cropped->GetY()[jj];
      }
      TGraph *grPadded = new TGraph(nSamp,newX,newY);
      TGraph* spectra = FFTtools::makePowerSpectrumMilliVoltsNanoSeconds(Waveform_Cropped);
      graphs.push_back(gr);
      graphs_spectra.push_back(spectra);
    }
    // if(realAtriEvPtr_fullcalib->isCalpulserEvent()==false){
    //   delete realAtriEvPtr_fullcalib;
    //   continue;
    // }
    delete realAtriEvPtr_fullcalib;



    vector<TGraph*> dummy;
    for(int i=0; i<16; i++){
      vector<double> thisX;
      vector<double> thisY;
      thisX.push_back(0);
      thisX.push_back(1000);
      thisY.push_back(1);
      thisY.push_back(1E6);
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
      // graphs[i]->GetXaxis()->SetRangeUser(0., 100.);
      // dummy[i]->SetTitle(ch_name);
      // dummy[i]->Draw("AP");
      // dummy[i]->SetLineColor(kWhite);
      // dummy[i]->GetYaxis()->SetRangeUser(-1500,1500);
      graphs[i]->SetLineColor(kBlue);
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
      dummy[i]->SetTitle(ch_name);
      dummy[i]->Draw("AP");
      dummy[i]->SetLineColor(kWhite);
      dummy[i]->GetXaxis()->SetRangeUser(0.,1000.);
      dummy[i]->GetYaxis()->SetRangeUser(1.,1E6);
      graphs_spectra[i]->SetTitle(ch_name);
      graphs_spectra[i]->SetLineColor(kBlue);
      graphs_spectra[i]->SetLineWidth(2);
      graphs_spectra[i]->Draw("SAMEL");
    }//canvas loop
    char h3name[100];
    sprintf(h3name,"./plots/spectra/spectrum_A%i_run%d_event%d.png", station, run_num,evt_num);
    c3->SaveAs(h3name);
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

    // TFile *fAmy = new TFile("for_Amy.root", "recreate");
    // fAmy->cd();
    // char forAmyTitle[20];
    // for(int i=0; i<16; i++){
    //   sprintf(forAmyTitle,"gr%i",i);
    //   corr_graph[i]->SetName(forAmyTitle);
    //   corr_graph[i]->Write();
    // }

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
