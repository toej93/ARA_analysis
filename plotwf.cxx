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
#include "AraQualCuts.h"
// #include "PlottingFns.h"
#include "tools_WaveformFns.h"
#include "tools_PlottingFns.h"




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
#include "CalibUtil.h"
#include "AraGeomTool.h"
#include "SNR_defs.h"

TStyle* RootStyle();

using namespace std;


int main(int argc, char **argv)
{ //start main

  stringstream ss;

  if(argc<3){
    cout<< "Usage\n" << argv[0] << " <station> <year> <run_number_1> <run_number_2> ..."<<endl;
    return 0;
  }
  int station = atoi(argv[1]);
  int year = atoi(argv[2]);

  for(int arg=3; arg<argc; arg++){

    int runNum = atoi(argv[arg]);
    char run_file_name[400];
    sprintf(run_file_name,"/fs/scratch/PAS0654/ara/10pct/RawData/A%d/%d/sym_links/event%d.root",station,year,runNum);

    TFile *RunFile = TFile::Open(run_file_name);

    if(!RunFile) {
      std::cerr << "Root file doesn't exist!\n";
      continue;
    }

    if (RunFile->IsZombie()) {
      continue;
    }
    TTree* eventTree = (TTree*) RunFile->Get("eventTree");

    RawAtriStationEvent *rawEvPtr=0;
    eventTree->SetBranchAddress("event",&rawEvPtr);

    int numEntries = eventTree -> GetEntries(); //get the number of entries in this file

    AraQualCuts *qual = AraQualCuts::Instance();

    AraGeomTool * geomTool = new AraGeomTool();

    bool found=false;
    for(int event=30; event<100; event++){ //loop over those entries
      if(found) break;
      eventTree->GetEntry(event); //get the event
      bool isCalpulser = rawEvPtr->isCalpulserEvent();
      bool isSoftwareTrigger = rawEvPtr->isSoftwareTrigger();
      bool isRFTrigger = rawEvPtr->isRFTrigger();

      // if(isRFTrigger) continue;
      if(isCalpulser){
        UsefulAtriStationEvent *realAtriEvPtr = new UsefulAtriStationEvent(rawEvPtr, AraCalType::kLatestCalib);
        found=true;

        int nGraphs=16;
        stringstream ss;
    		string xLabel, yLabel;
    		xLabel = "Time (ns)"; yLabel = "Voltage (mV)";
    		vector<string> titlesForGraphs;
    		for (int i = 0; i < nGraphs; i++){
    			ss.str("");
    			ss << "Channel " << i;
    			titlesForGraphs.push_back(ss.str());
    		}
    		vector<TGraph*> grWaveformsRaw = makeGraphsFromRF(realAtriEvPtr, 16, xLabel, yLabel, titlesForGraphs);

        TCanvas *c2 = new TCanvas("","",1550,1550);
        c2->Divide(4,4);
        for(int i=0; i<16; i++){//canvas loop
          char ch_name[20];
          sprintf(ch_name,"chan %d",i);
          c2->cd(i+1);
          // temp_phs[i]->SetTitle(ch_name);
          grWaveformsRaw[i]->Draw("AL");
        }//canvas loop
        char h3name[60];
        sprintf(h3name,"./plots/wforms/wf_A%d_%d_event%d_run%d.png",station, year, event, runNum);
        c2->SaveAs(h3name);
        delete c2;

        TCanvas *c4 = new TCanvas("","",1550,1550);
        c4->Divide(4,4);
        for(int i=0; i<16; i++){//canvas loop
          char ch_name[20];
          sprintf(ch_name,"chan %d",i);
          c4->cd(i+1);
          // temp_phs[i]->SetTitle(ch_name);
          TGraph *sumV2 = getSqrtVoltageSquaredSummedWaveform(grWaveformsRaw[i],1);
          sumV2->Draw("AL");
        }//canvas loop
        char h4name[60];
        sprintf(h4name,"./plots/summedV2/summedV2_A%d_%d_event%d_run%d.png",station, year, event, runNum);
        c4->SaveAs(h4name);
        delete c4;

        float v2SNRArray[16];
        getChannelSlidingV2SNR_UW(grWaveformsRaw, 1, 1, v2SNRArray);
        for(int k=0;k<grWaveformsRaw.size();k++){
          cout << v2SNRArray[k] << endl;
        }
        bool isSimulation=0;
        vector<int> chan_exclusion_list;
        if(station==2){
          // hpol channel 15
          chan_exclusion_list.push_back(15);
          printf("Station 2: Dropping ch 15\n");
        }
        else if(station==3){
          if(
            (!isSimulation && runNum>getA3BadRunBoundary())
          ){
            printf("Station 3: Dropping ch 3, 7, 11, 15\n");
            chan_exclusion_list.push_back(3);
            chan_exclusion_list.push_back(7);
            chan_exclusion_list.push_back(11);
            chan_exclusion_list.push_back(15);
          }
        }

        float OSUSNRArray[16];

        vector<int> polarizations;
      	vector<int> antenna_numbers;
      	polarizations.resize(16);
      	antenna_numbers.resize(16);
        double RMS_SoftTrigger[16];
        double RMS_RFTrigger[16];
      	vector< vector <double> > ant_loc;
      	ant_loc.resize(16);
      	for (int i = 0; i < 16; i++){
      		polarizations[i] = (int)geomTool->getStationInfo(station)->getAntennaInfo(i)->polType;
      		antenna_numbers[i]=i;
          RMS_SoftTrigger[i]=30.;
          RMS_RFTrigger[i]=30.;
      	}
        vector<double> ThirdVpeakOverRms;
        getThirdVPeakOverRMS_OSU(grWaveformsRaw, polarizations, antenna_numbers, chan_exclusion_list, RMS_SoftTrigger, RMS_RFTrigger, ThirdVpeakOverRms);
        // cout << "\033[1;31mHERE!\033[0m\n";

        // TCanvas *c3 = new TCanvas("","",1550,1550);
        // c3->Divide(4,4);
        // for(int i=0; i<16; i++){//canvas loop
        //   char ch_name[20];
        //   sprintf(ch_name,"chan %d",i);
        //   c3->cd(i+1);
        //   // temp_phs[i]->SetTitle(ch_name);
        //   TGraph *fft = FFTtools::makePowerSpectrumMilliVoltsNanoSeconds(grWaveformsRaw[i]);
        //   fft->Draw("AL");
        //   fft->GetYaxis()->SetRangeUser(1,1e5);
        //   gPad->SetLogy();
        // }//canvas loop
        // char h4name[60];
        // sprintf(h4name,"./plots/spectra/spectra_A%d_%d_event%d_run%d.png",station, year, event, runNum);
        // // c3->SaveAs(h4name);
        // delete c3;


        cout << "\033[1;31mDONE\033[0m\n";

        /*
        vector<TGraph*> dummy;
        for(int i=0; i<15; i++){
        vector<double> thisX;
        vector<double> thisY;
        thisX.push_back(-200);
        thisX.push_back(520);
        thisY.push_back(-900);
        thisY.push_back(900);
        dummy.push_back(new TGraph(2,&thisX[0], &thisY[0]));
      }
      // */
      delete realAtriEvPtr;
    }
  }
}
}//end main
