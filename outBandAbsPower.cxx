//outOfBandAbsPower.cxx
//Jorge Torres, Nov 2019.

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
#include <TSystem.h>



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
  2: config
  3 : input file
  */
    bool flag=true;
    TChain chain("eventTree"); //this for the events for the exterior loop
    for(int file=3; file<argc; file++){

      if(gSystem->AccessPathName(argv[file])){
			std::cout << "file does not exist" << std::endl;
			return -1;
		}

      TString fileKey(argv[file]); //a file key
      chain.Add(fileKey); //add files to the chain
    }

    int station = atoi(argv[1]);
    int config = atoi(argv[2]);
    bool dropDDA4;
    if(config>2) dropDDA4=true;
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
    vector<int> BadRunList = BuildBadRunList(3);
    if(isBadRun(3, run_num, BadRunList)) return -1;
  	if(isSoftwareDominatedRun("/users/PCON0003/cond0068/ARA/AraRoot/analysis/a23_analysis_tools", 3, run_num)) return -1;
    if(hasUntaggedCalpul("/users/PCON0003/cond0068/ARA/AraRoot/analysis/a23_analysis_tools", station, config, run_num)) return -1;

    char rootName[100];
    sprintf(rootName,"/fs/scratch/PAS0654/jorge/absPower/c%i_run%i.root", config, run_num);
    TFile *f = TFile::Open(rootName,"RECREATE");
    TTree *t = new TTree("absPower","abspower");
    vector <double> absPower150;
    vector <double> absPower100;
    vector <double> absPower70;

    t->Branch("absPower150",&absPower150);
    t->Branch("absPower100",&absPower100);
    t->Branch("absPower70",&absPower70);
    AraQualCuts *qualCut = AraQualCuts::Instance();

    cout << "Number of events is " << numEntries << endl;
    for(int event=0; event<numEntries; event++){//loop over events
      // cout << event << endl;

      chain.GetEvent(event);
      int unixtime = rawEvPtr->unixTime;
      if(isBadLivetime(station,unixtime)) continue;
      int evt_num = rawEvPtr->eventNumber;//event number
      UsefulAtriStationEvent *realAtriEvPtr_fullcalib = new UsefulAtriStationEvent(rawEvPtr, AraCalType::kLatestCalib); //make the event

      isCalpulser = realAtriEvPtr_fullcalib->isCalpulserEvent();
      isSoftTrigger = realAtriEvPtr_fullcalib->isSoftwareTrigger();
      if(isCalpulser || isSoftTrigger){
        delete realAtriEvPtr_fullcalib;
        continue;
      }
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
        delete realAtriEvPtr_fullcalib;
        continue;
    	}
      vector<TGraph*> graphs;
      double interpolation_step = 0.5;
      if(!qualCut->isGoodEvent(realAtriEvPtr_fullcalib)){
        delete realAtriEvPtr_fullcalib;
        continue;
      }

      for (int i = 0; i < 16; i++){
        // TGraph* gr = realAtriEvPtr_fullcalib->getGraphFromRFChan(i);
        graphs.push_back(realAtriEvPtr_fullcalib->getGraphFromRFChan(i));
      }

      delete realAtriEvPtr_fullcalib;
      outOfBandAbsPower(graphs, dropDDA4, 150, absPower150);
      outOfBandAbsPower(graphs, dropDDA4, 100, absPower100);
      outOfBandAbsPower(graphs, dropDDA4, 70, absPower70);

    t->Fill();
    for (int i=0; i < graphs.size(); i++){
      delete graphs[i];
    }
    graphs.clear();
    absPower150.clear();
    absPower100.clear();
    absPower70.clear();
    std::vector<double>().swap(absPower150);
    std::vector<double>().swap(absPower100);
    std::vector<double>().swap(absPower70);


  }//end loop over events
cout << "Got to the end, flushing baskets" << endl;
f->cd();
f->Write();
f->Close();
delete f;
}//end main
