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

  /*
    TChain chain("eventTree"); //this for the events for the exterior loop     
    for(int file=1; file<argc; file++){
    TString fileKey(argv[file]); //a file key                                
    chain.Add(fileKey); //add files to the chain                             
    }
  */
  stringstream ss;

  if(argc<3){
    cout<< "Usage\n" << argv[0] << " <station> <year> <run_number_1> <run_number_2> ..."<<endl;
    return 0;
  }
  int station = atoi(argv[1]);
  int year = atoi(argv[2]);
  
  TH1F *h1[16];
  TH1F *h_rms[16];

  
  char hname[20];
  char hname2[20];


  for(int j = 0; j<15; j++){
    sprintf(hname,"h1_channel%d",j);
    sprintf(hname2,"rms_h1_channel%d",j);

    h1[j] = new TH1F(hname,hname,2000,0,100);
    h_rms[j] = new TH1F(hname2,hname2,200,0.,60.);

  }
  for(int arg=3; arg<argc; arg++){

    int runNum = atoi(argv[arg]);
    //   printf("I'm at run %d\n", runNum);
    if(isBadRun(station,year,runNum)){
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
  
    //  eventTree->SetBranchAddress("run",&run_num); //set the branch address

    // TH1* h1 = new TH1I("h1", "h1 title", 500, 0.0, 15000);
    /*
    char runconfig_file_name[400];
    sprintf(runconfig_file_name,"/users/PCON0003/cond0068/ARA/AraRoot/analysis/config_files/A%d/%d/configFile.run00%d.dat",station,year,runNum);
    string line, label;
    int PreTrigBlock;
    ifstream file;
    file.open(runconfig_file_name);
    if ( file.is_open() ) {
      while (file.good() ) {
	getline (file,line);
	label = line.substr(0, line.find_first_of("="));
	if (label == "numRF0PreTriggerBlocks#1") {
	  PreTrigBlock  = atof( line.substr(line.find_first_of("=") + 1).c_str() );
	}
      }
    }
    file.close();
    printf("PreTrigBlock is %d\n", PreTrigBlock);
    */
    AraEventCalibrator *calib = AraEventCalibrator::Instance(); //make a calibrator
    AraGeomTool * geomTool = new AraGeomTool();

    //  /*
    double rms_diode_sum[16];
    int counter = 0;
    for(Long64_t event=0;event<numEntries;event++) {
      eventTree->GetEvent(event);
      int evt_num = rawEvPtr->eventNumber;//event number
      bool is_RF_trig = rawEvPtr->isRFTrigger();
      if(!is_RF_trig) continue;
      UsefulAtriStationEvent *realAtriEvPtr_fullcalib = new UsefulAtriStationEvent(rawEvPtr, AraCalType::kLatestCalib); //make the event
    
      bool isGoodEvent = IsGoodForCalib(station, year, runNum, 0);// This function is in CalibUtil.h
      AraQualCuts *qual = AraQualCuts::Instance();
      bool isGood = qual->isGoodEvent(realAtriEvPtr_fullcalib);//From Brian's QCuts library
      if(isGoodEvent && isGood && rawEvPtr->isCalpulserEvent()==false){
	//cout << event << endl;
	for(int channel = 0; channel<15; channel++){
	  TGraph *waveform = realAtriEvPtr_fullcalib->getGraphFromRFChan(channel);//channel.
	  //  if(channel==0) cout<<waveform->GetN()<< endl;
	  TGraph *waveform_Interpolated = FFTtools::getInterpolatedGraph(waveform,0.5);
	  delete waveform;
	  TGraph *waveform_Padded = FFTtools::padWaveToLength(waveform_Interpolated, 2048);
	  delete waveform_Interpolated;
	  // TGraph *diode_wf = doConvolve(waveform_Padded);
	  rms_diode_sum[channel] += getRMS(waveform_Padded, getBinsforRMS(waveform_Padded));      
	  delete waveform_Padded;      
	  // delete diode_wf;
	}
	counter++;    
      }
      if(counter>100) break;
      delete realAtriEvPtr_fullcalib;
    }//loop pver events
    double rms_diode_avg[16];
    for(int i=0; i<15;i++){
      rms_diode_avg[i]=rms_diode_sum[i]/100;
      // cout << rms_diode_avg[i] << endl;
    }
    //   */
    eventTree->GetEvent(0);
    int unixtime_0=rawEvPtr->unixTime;//Unix time of fisrst event.
    double cable_delay[16]={230,230,330,230,300,300,400,300,220,220,320,220,290,290,390,290};
  
    for(int event=0; event<numEntries; event++){//loop over events
      eventTree->GetEvent(event);
      int unixtime;
      unixtime = rawEvPtr->unixTime;
      if((unixtime-unixtime_0)<=1200)continue;//Want to throw away first 20 min, so triggers are stable.
      int evt_num = rawEvPtr->eventNumber;//event number
      bool is_RF_trig = rawEvPtr->isRFTrigger();
      if(!is_RF_trig) continue;
      UsefulAtriStationEvent *realAtriEvPtr_fullcalib = new UsefulAtriStationEvent(rawEvPtr, AraCalType::kLatestCalib); //make the event

      bool isGoodEvent = IsGoodForCalib(station, year, runNum, 0);// This function is in CalibUtil.h
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
	  double rms = getRMS(waveform_Padded, getBinsforRMS(waveform_Padded));
	  //TGraph *spectrum = makeFreqV_MilliVoltsNanoSeconds(waveform_Padded);
	 
	  h_rms[channel]->Fill(rms);
	  // TGraph *waveform_sum_sq = makeSummedVsquaredWForm(waveform_Interpolated, 5);
	  TGraph *waveform_cropped = FFTtools::cropWave(waveform_Padded, cable_delay[channel]-170, cable_delay[channel]+20);//looking during trigger window. Say trigger occured at center of wf.
	  
	  vsquared[channel] = FFTtools::getPeakSqVal(waveform_cropped);
	  int peakBin=getPeakBin(waveform_cropped);
	  vsquared_time[channel]=waveform_cropped->GetX()[peakBin];
	  

	  // vsquared_vec[channel][1]=0;
	  //TGraph *diode_wf = doConvolve(waveform_Padded);
	  delete waveform_Padded;
	  //  printf("vector %d is: (%f,%f) \n", channel,vsquared_vec[channel][0],vsquared_vec[channel][1]);
	  //for(int samp=0; samp<diode_wf->GetN(); samp++) diode_wf->GetY()[samp]/=rms_diode_avg[channel];
	  //double time_window = waveform_Padded->GetX()[waveform_Padded->GetN()/2];
	  
	  //TGraph *waveform_cropped_diode = FFTtools::cropWave(diode_wf, cable_delay[channel]-190, cable_delay[channel]+20);//looking during trigger window. Say trigger occured at center of wf.
	  /*
	  if(channel == 5){
	  char name[40];
	  sprintf(name, "./wforms/wf_%0.1f_ch%d_ev%d.png", 4, channel, event);
	  TCanvas *cc = new TCanvas("","",850,850);
	  //	cc->Divide(2,1);
	  //	cc->cd(1);
	  diode_wf->Draw();
	  //	cc->cd(2);
	  //FFTtools::makePowerSpectrumMilliVoltsNanoSeconds(waveform)->Draw();
	  cc->SaveAs(name);
	  delete cc;
	  }
	  */
	  //  vsquared[channel] = getNegativePeak(waveform_cropped);
	  // delete diode_wf;
	  //delete waveform_sum_sq;
	  delete waveform_cropped;
	}//channel loop

	//vector<double> peak;
	//peak.resize(2);
	//peak.clear();
	//get3rdPeakSqValSamePol(vsquared, peak);// This function is in CalibUtil.h
	//double thirdsmallest;
	double thirdsmallest=get3rdPeakSqValSamePol_timeordered(vsquared_time, vsquared);// This function is in CalibUtil.h
	//	cout << thirdsmallest << endl;
	if (thirdsmallest<0) continue;
	//	if(abs(peak[0])<abs(peak[1])) thirdsmallest=peak[1];
	//	else thirdsmallest=peak[0];
	  /*
	bool Triggered;
	double thirdHighest_pol;
	for(double thres=-6.5; thres<=-4.5; thres+=0.1){
	  thirdHighest_pol=0;
	  Triggered = isTriggered(thres, vsquared, thirdHighest_pol);
	  if(Triggered){
	    //    printf("Threshold is %f, 3rdpeak is %f \n", thres, thirdHighest_pol);
	    break;
	  }
	}
	  */

	// This function is in CalibUtil.h
	//	printf("peak v: %d, peak h:%d \n", peak[0], peak[1]);
	//if(Triggered){
	  for(int ii = 0; ii<15; ii++){//loop over maxvsquared values
	    if(abs(vsquared[ii]-thirdsmallest) < 1e-4){
	      //    cout<< thirdsmallest<< endl;
	      //   cout << ii << endl;
	      //printf("Highest 3rd is : %f\n",thirdHighest_pol);
	      // cout <<vsquared[ii]<<endl;
	      cout << vsquared[ii]/pow(rms_diode_avg[ii],2) << endl;
	      h1[ii]->Fill(vsquared[ii]/pow(rms_diode_avg[ii],2));//Fill hist of respective channel in which 3rdv2 was located
	    }
	  }//loop over maxvsquared values
	  //	}//If triggered
      }//close if RF triggered event
      delete realAtriEvPtr_fullcalib;
    }//end loop over events
    delete calib;
 
    // delete realAtriEvPtr_fullcalib;
    char filename[100];
    sprintf(filename, "./files_3rdhighest/hist_from_data_3rdhighest_vsquared_run%d_fullwindow_timeord_ratio0.8.root", runNum);
    TFile *f = new TFile(filename, "RECREATE");
  
    for(int channel = 0; channel<15; channel++){
      h1[channel]->Write("");
      h_rms[channel]->Write();

    }
    f->Write("");
    f->Close();
  }//end looping over runs
}//end main

