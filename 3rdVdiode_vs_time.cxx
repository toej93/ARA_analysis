//Finds the 3rd highest peak square for each polarization and stores it in a root file.
//This works for data only.
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
#include "CalibUtil.h"
#include "AraQualCuts.h"
#include "PlottingFns.h"
#include "WaveformFns.h"


TStyle* RootStyle();

using namespace std;

int main(int argc, char **argv)

{ //start main
  FILE *fout = fopen("time_vs_3rdpeak.csv", "w+");//open file
  fprintf(fout, "unixtime,thirdpeak\n");
  stringstream ss;

  if(argc<3){
    cout<< "Usage\n" << argv[0] << " <station> <year> <run_number_1> <run_number_2> ..."<<endl;
    return 0;
  }
  int station = atoi(argv[1]);
  int year = atoi(argv[2]);


  for(int arg=3; arg<argc; arg++){

    int runNum = atoi(argv[arg]);
    //   printf("I'm at run %d\n", runNum);
    if(isBadRun(station,runNum)){
      cout <<"Bad run"<<endl;
      continue;
    }
    char run_file_name[400];
    //  if(year!=2013){
    sprintf(run_file_name,"/fs/scratch/PAS0654/ara/10pct/RawData/A%d/%d/sym_links/event%d.root",station,year,runNum);
    //}
    /* else{
       sprintf(run_file_name,"/fs/scratch/PAS0654/ara/10pct/RawData/A%d/%d/sym_links/event%d.root",station,year,runNum);
       }
    */
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
    int numEntries = eventTree->GetEntries();
    Int_t run_num=0;
    int stationId=0;

    stationId = rawEvPtr->stationId; //assign the statio id number

    AraEventCalibrator *calib = AraEventCalibrator::Instance(); //make a calibrator
    AraGeomTool * geomTool = new AraGeomTool();

      char summary_file_name[400];
      sprintf(summary_file_name,"/fs/scratch/PAS0654/ara/10pct/CWID/A%d/%d/CWID_station_%d_run_%d.root",station,year,station,runNum);
      TFile *NewCWFile = TFile::Open(summary_file_name);
      if(!NewCWFile) {
      std::cerr << "Can't open new CW file\n";
      return -1;
      }
      TTree* NewCWTree = (TTree*) NewCWFile->Get("NewCWTree");
      if(!NewCWTree) {
      std::cerr << "Can't find NewCWTree\n";
      return -1;
      }
      vector<vector<double> > *badFreqs_fwd =0;
      vector<vector<double> > *badFreqs_back=0;
      vector<vector<double> > *badSigmas_fwd=0;
      vector<vector<double> > *badSigmas_back=0;
      vector<vector<double> > *badFreqs_baseline=0;

      // inside, there are five trees
      // 2 x bad frequencies identified with the Carl's phase variance (forward and backwards running)
      // 2 x how bad they are (the sigmas)
      // 1 x bad frequencies identified with Eugene's "baseline violation" technique from Testbed

      NewCWTree->SetBranchAddress("badFreqs_fwd",&badFreqs_fwd);
      NewCWTree->SetBranchAddress("badSigmas_fwd",&badSigmas_fwd);
      NewCWTree->SetBranchAddress("badFreqs_back",&badFreqs_back);
      NewCWTree->SetBranchAddress("badSigmas_back",&badSigmas_back);
      NewCWTree->SetBranchAddress("badFreqs_baseline",&badFreqs_baseline);

     // int numEntries = NewCWTree->GetEntries();
      Long64_t starEvery=numEntries/200;
      // if(starEvery%100=1) starEvery++;

      double rms_diode_avg[16]={2.6151e-08,4.32888e-08,1.11285e-07,3.27972e-08,6.99447e-08,2.9024e-08,1.09953e-07,9.29294e-08,8.80812e-08,2.70219e-08,3.79519e-08,5.86235e-08,3.96218e-08,4.65889e-08,4.70606e-08,1.46844e-13};
      eventTree->GetEvent(0);
      int unixtime_0=rawEvPtr->unixTime;//Unix time of fisrst event.
      double cable_delay[16]={230,230,330,230,300,300,400,300,220,220,320,220,290,290,390,290};

    for(int event=0; event<numEntries; event++){//loop over events
      eventTree->GetEvent(event);
      int unixtime;
      unixtime = rawEvPtr->unixTime;
      //cout << unixtime << endl;
      //if((unixtime-unixtime_0)<=1200)continue;//Want to throw away first 20 min, so triggers are stable.
      int evt_num = rawEvPtr->eventNumber;//event number
      bool is_RF_trig = rawEvPtr->isRFTrigger();
      if(!is_RF_trig) continue;
      UsefulAtriStationEvent *realAtriEvPtr_fullcalib = new UsefulAtriStationEvent(rawEvPtr, AraCalType::kLatestCalib); //make the event

      // bool isGoodEvent = IsGoodForCalib(station, year, runNum, 0);// This function is in CalibUtil.h
      bool isGoodEvent;
      bool isCutonCW_fwd[2]; isCutonCW_fwd[0]=false; isCutonCW_fwd[1]=false;
      bool isCutonCW_back[2]; isCutonCW_back[0]=false; isCutonCW_back[1]=false;
      bool isCutonCW_baseline[2]; isCutonCW_baseline[0]=false; isCutonCW_baseline[1]=false;

      //first, check the baseline technique
      for(int pol=0; pol<badFreqs_baseline->size(); pol++){
	vector<double> badFreqListLocal_baseline = badFreqs_baseline->at(pol);
	if(badFreqListLocal_baseline.size()>0) isCutonCW_baseline[pol]=true;
      }

      //second, check the "forward" looking phase variance list
      double threshCW = 1.0;
      vector<double> badFreqList_fwd;
      vector<double> badSigmaList_fwd;
      for(int pol=0; pol<badFreqs_fwd->size(); pol++){
	badFreqList_fwd=badFreqs_fwd->at(pol);
	badSigmaList_fwd=badSigmas_fwd->at(pol);
	for(int iCW=0; iCW<badFreqList_fwd.size(); iCW++){
	  if(
	     badSigmaList_fwd[iCW] > threshCW
	     &&
	     abs(300. - badFreqList_fwd[iCW]) > 2.
	     &&
	     abs(500. - badFreqList_fwd[iCW]) > 2.
	     &&
	     abs(125. - badFreqList_fwd[iCW]) > 2.
	     ){
	    isCutonCW_fwd[pol] = true;
	  }
	}
      }

      //third (and finally), check the "backwards" looking phase variance list
      vector<double> badFreqList_back;
      vector<double> badSigmaList_back;
      for(int pol=0; pol<badFreqs_back->size(); pol++){
	badFreqList_back=badFreqs_back->at(pol);
	badSigmaList_back=badSigmas_back->at(pol);
	for(int iCW=0; iCW<badFreqList_back.size(); iCW++){
	  if(
	     badSigmaList_back[iCW] > threshCW
	     &&
	     abs(300. - badFreqList_back[iCW]) > 2.
	     &&
	     abs(500. - badFreqList_back[iCW]) > 2.
	     &&
	     abs(125. - badFreqList_back[iCW]) > 2.
	     ){
	    isCutonCW_back[pol] = true;
	  }
	}
      }

      for(int pol=0; pol<2; pol++){

	//if it's not contaminated by *any* CW, do whatever you want
	if(/*!isCutonCW_fwd[pol] && !isCutonCW_back[pol] && */!isCutonCW_baseline[pol]){
	  //printf("Event %d is clean\n", event);
	  isGoodEvent = true;
	}

      }
      AraQualCuts *qual = AraQualCuts::Instance();
      bool isGood = qual->isGoodEvent(realAtriEvPtr_fullcalib);//From Brian's QCuts library

      if(isGoodEvent && isGood && rawEvPtr->isCalpulserEvent()==false){//If RF triggered event but non calpul

	double vsquared[16];
	double vsquared_time[16];
	for(int channel = 0; channel<15; channel++){
	  TGraph *waveform = realAtriEvPtr_fullcalib->getGraphFromRFChan(channel);//channel 2
	  bool isAGlitch = isGlitch(waveform); // This function is in CalibUtil.h
	  if(isAGlitch){
	    continue;
	  }
	  Double_t delay=geomTool->getStationInfo(station)->getCableDelay(channel);
	  for(int samp=0; samp<waveform->GetN(); samp++) waveform->GetX()[samp]+=delay;
	  TGraph *waveform_Interpolated = FFTtools::getInterpolatedGraph(waveform,0.5);
	  delete waveform;
	  TGraph *waveform_Padded = FFTtools::padWaveToLength(waveform_Interpolated, 2048);
	  delete waveform_Interpolated;

	  TGraph *diode_wf = doConvolve(waveform_Padded);
	  delete waveform_Padded;

	  for(int samp=0; samp<diode_wf->GetN(); samp++) diode_wf->GetY()[samp]/=rms_diode_avg[channel];
	  //double time_window = waveform_Padded->GetX()[waveform_Padded->GetN()/2];

	  TGraph *waveform_cropped_diode = FFTtools::cropWave(diode_wf, cable_delay[channel]-170, cable_delay[channel]+20);//looking during trigger window. Say trigger occured at center of wf.

	  vsquared[channel] = getNegativePeak(diode_wf);
	  delete diode_wf;
	  delete waveform_cropped_diode;

	}//channel loop

	vector<double> peak;
	//peak.resize(2);
	//peak.clear();
	//	get3rdPeakSqValSamePol(vsquared, peak);// This function is in CalibUtil.h
	get3rdsmallest(vsquared, peak);
	double thirdsmallest;
	if(abs(peak[0])<abs(peak[1])) thirdsmallest=peak[1];
	else thirdsmallest=peak[0];

fprintf(fout,"%i,%0.2f \n",unixtime,thirdsmallest);
//cout << unixtime << thirdsmallest << endl;

      }//close if RF triggered event
      delete realAtriEvPtr_fullcalib;
    }//end loop over events
    delete calib;
  }
  fclose(fout);
}//end main
