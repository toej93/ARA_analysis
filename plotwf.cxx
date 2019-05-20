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
#include "PlottingFns.h"




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
  
  char hname[20];
  char hname2[20];
  double cable_delay[16]={230,230,330,230,300,300,400,300,220,220,320,220,290,290,390,290};
  
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
    //sprintf(run_file_name,"/users/PCON0003/cond0068/ARA/AraRoot/analysis/data_A2/event003053.root",station,year,runNum);
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
    /*
      char runconfig_file_name[400];
      sprintf(runconfig_file_name,"/users/PCON0003/cond0068/ARA/AraRoot/analysis/config_files/A2/2015/configFile.run005326.dat");
      string line, label;
      int TrigBlock;
      int PreTrigBlock;
      ifstream file;
      file.open(runconfig_file_name);
      if ( file.is_open() ) {
      while (file.good() ) {
      getline (file,line);
      label = line.substr(0, line.find_first_of("="));
      
      if (label == "numRF0TriggerBlocks#1") {
      TrigBlock  = atof( line.substr(line.find_first_of("=") + 1).c_str() );
      }
      
      if (label == "numRF0PreTriggerBlocks#1") {
      PreTrigBlock  = atof( line.substr(line.find_first_of("=") + 1).c_str() );
      }
      }
      }
      file.close();
      printf("TrigBlock is: %d, PreTrigBlock is %d\n", TrigBlock, PreTrigBlock);
    */


    
  
    RawAtriStationEvent *rawEvPtr=0;
    eventTree->SetBranchAddress("event",&rawEvPtr);
	
    int numEntries = eventTree -> GetEntries(); //get the number of entries in this file

    AraQualCuts *qual = AraQualCuts::Instance();

    AraGeomTool * geomTool = new AraGeomTool();

    //double rms_diode_sum[16];
    double rms_diode_avg[16]={2.81253e-08, 5.617e-08, 1.43428e-07, 3.77426e-08, 9.48115e-08, 3.58519e-08, 1.36662e-07, 7.57174e-08, 1.16811e-07, 3.65596e-08, 4.64161e-08, 4.24696e-08, 5.57945e-08, 6.31254e-08, 6.31254e8};
     /*
     int counter = 0;
    int rms_events = 1000;
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
	 
	  // cout << delay << endl;
	  TGraph *diode_wf = doConvolve(waveform_Padded);
	  rms_diode_sum[channel] += getRMS(diode_wf, getBinsforRMS(diode_wf));      
	  delete waveform_Padded;      
	  delete diode_wf;
	}
	counter++;    
      }
      if(counter>rms_events) break;
      delete realAtriEvPtr_fullcalib;
    }//loop pver events
    double rms_diode_avg[16];
    for(int i=0; i<15;i++){
      rms_diode_avg[i]=rms_diode_sum[i]/rms_events;
      cout << rms_diode_avg[i] << endl;
    }
     */    
    bool found=false;
    for(int event=30; event<numEntries; event++){ //loop over those entries
      if(found) break;
      eventTree->GetEntry(event); //get the event
      bool isCalpulser = rawEvPtr->isCalpulserEvent();
      bool isSoftwareTrigger = rawEvPtr->isSoftwareTrigger();
      bool isRFTrigger = rawEvPtr->isRFTrigger();

      // if(isRFTrigger) continue;
      if(isRFTrigger && !isCalpulser){
	//	cout<< "ISCSCSCSCS CALPULLLLLLLLLLLL" << endl;
      UsefulAtriStationEvent *realAtriEvPtr = new UsefulAtriStationEvent(rawEvPtr, AraCalType::kLatestCalib);
      bool this_qual = qual->isGoodEvent(realAtriEvPtr); //get the quality
      if(!this_qual){
	delete realAtriEvPtr;
	continue;
      }
      double TriggerRatePerCh[16];
      vector <TGraph*> padded_waveform_gr;
      vector <TGraph*> padded_waveform_diode_gr;
      double mean[16];
      double mean_new[16];
      double rms[16];
      double vsquared[16];
      double vsquared_time[16];
      // vector <double> vsquared_vec[16];
      std::pair <double,double> time_vmax[16];

      //now, we'll get the waveform from channel 2
      for(int i=0; i<15; i++){//canvas loop
	//	printf("channel is %d, bool is %d \n", i, realAtriEvPtr->isTriggerChanHigh(i));
	// cout << realAtriEvPtr->isTriggerChanHigh(i)<<endl;
	TGraph *waveform = realAtriEvPtr->getGraphFromRFChan(i);
	Double_t delay=geomTool->getStationInfo(station)->getCableDelay(i);
    	for(int samp=0; samp<waveform->GetN(); samp++) waveform->GetX()[samp]+=delay;	
	TGraph *interpolated_waveform = FFTtools::getInterpolatedGraph(waveform, 0.5); //get an interpolated waveform with 0.5 ns interpolation
	
	TGraph *padded_waveform = FFTtools::padWaveToLength(interpolated_waveform,2048);
	//cout<<waveform->GetN()<< endl;
	padded_waveform_gr.push_back(waveform);
	TGraph *grOut = doConvolve(padded_waveform);
	// TGraph *interpolated_waveform_diode = FFTtools::getInterpolatedGraph(grOut, 0.5); //get an interpolated waveform with 0.5 ns interpolation
	// TGraph *padded_waveform_diode = FFTtools::padWaveToLength(grOut,1024);
	//for(int samp=0; samp<grOut->GetN(); samp++) grOut->GetY()[samp]/=rms_diode_avg[i];
	//TriggerRatePerCh[i]=getTriggerRate(grOut,-3);
	padded_waveform_diode_gr.push_back(grOut);
	///cout << grOut->GetX()[0]<<endl;
	TGraph *waveform_cropped = FFTtools::cropWave(waveform, cable_delay[i]-170, cable_delay[i]+20);//looking during trigger window. Say trigger occured at center of wf.
		//vsquared[i] = getNegativePeak(grOut);
	vsquared[i] = FFTtools::getPeakSqVal(waveform_cropped);
	  int peakBin=getPeakBin(waveform_cropped);
	  vsquared_time[i]=waveform_cropped->GetX()[peakBin];
	  //vsquared_vec[i].push_back(vsquared_time[i]);
	  //vsquared_vec[i].push_back(vsquared[i]);
	  time_vmax[i] = std::make_pair (vsquared_time[i],vsquared[i]);
	  //printf("vector %d is: (%f,%f) \n", i,vsquared_vec[i][0],sqrt(vsquared_vec[i][1]));
	  printf("Pairs %d are is: (%f,%f) \n" ,i,time_vmax[i].first,sqrt(time_vmax[i].second));

	// printf("For ch %d delay is %f \n", i, delay);
      }

      TGraph *time_vs_vmax = new TGraph(15,&vsquared_time[0],&vsquared[0]);
      TCanvas *ccc = new TCanvas("","",850,850);
      time_vs_vmax->Draw("A*");
      ccc->SaveAs("time_vs_vmax.png");
      delete ccc;
      
      
      //vector<double> peak;
      //peak.resize(2);
      //peak.clear();
      double thirdsmallest=get3rdPeakSqValSamePol_timeordered(vsquared_time, vsquared);// This function is in CalibUtil.h
      
      //if(abs(peak[0])<abs(peak[1])) thirdsmallest=peak[1];
      // else thirdsmallest=peak[0];
      //  if(abs(thirdsmallest)>4) continue;
      found=true;
      //cout << event <<endl;
      for(int ii = 0; ii<15; ii++){//loop over maxvsquared values
	if(abs(vsquared[ii]-thirdsmallest) < 1e-4){
	  cout<< thirdsmallest<< endl;
	  cout << ii << endl;
	  //printf("Highest 3rd is : %f\n",thirdHighest_pol);
	  // cout <<vsquared[ii]<<endl;
	}
      }//loop over maxvsquared values
      
      //  /* 
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
       TLine *line[16];
       TLine *line2[16];
       
       TCanvas *c3 = new TCanvas("","",1550,1550);
       c3->Divide(4,4);
       for(int i=0; i<15; i++){//canvas loop
	 char ch_name[20];
	 sprintf(ch_name,"chan %d",i);
	 c3->cd(i+1);
	 padded_waveform_gr[i]->SetTitle(ch_name);
	 //if(i==0) padded_waveform_gr[i]->GetXaxis()->SetRangeUser(-100, 500);
	 
	 dummy[i]->Draw("ALP");
	 dummy[i]->GetXaxis()->SetRangeUser(0, 600);
	 dummy[i]->GetYaxis()->SetRangeUser(-200,200);
	 dummy[i]->SetTitle(ch_name);
	 dummy[i]->SetLineColor(0);
	 
	 line[i] = new TLine(cable_delay[i]+20,-300,cable_delay[i]+20,300);
	 line2[i] = new TLine(cable_delay[i]-170,-300,cable_delay[i]-170,300);
	 padded_waveform_gr[i]->Draw("SAME");    
		 
	 line[i]->SetLineColor(kRed);
	 line[i]->SetLineWidth(2);
	 line[i]->Draw("AL");
	 line2[i]->SetLineColor(kRed);
	 line2[i]->SetLineWidth(2);
	 line2[i]->Draw("AL same");
	 
	 }//canvas loop
	 c3->SaveAs("wf_padded_16.png");
	 delete c3;
   
    
  

	 //  */
	
      TCanvas *c4 = new TCanvas("","",840*4,840*4);
      c4->Divide(4,4);
      for(int i=0; i<15; i++){//canvas loop
	char ch_name[20];
	sprintf(ch_name,"chan %d",i);
	c4->cd(i+1);      
	padded_waveform_diode_gr[i]->SetTitle(ch_name);
	padded_waveform_diode_gr[i]->GetXaxis()->SetRangeUser(0, 600);
	padded_waveform_diode_gr[i]->GetYaxis()->SetRangeUser(-8, 5);
	padded_waveform_diode_gr[i]->SetLineWidth(3);
	padded_waveform_diode_gr[i]->Draw("al PLC");
	//gPad->DrawFrame(0,1e-9,1,1);
	line[i] = new TLine(cable_delay[i]+20,-10,cable_delay[i]+20,5);
	line2[i] = new TLine(cable_delay[i]-20,-10,cable_delay[i]-20,5);
	
	line[i]->SetLineColor(kRed);
	line[i]->SetLineWidth(5);
	line[i]->Draw("AL");
	line2[i]->SetLineColor(kRed);
	line2[i]->SetLineWidth(5);
	line2[i]->Draw("AL same");
	  //	cout<<TriggerRatePerCh[i]<<endl;
      }//canvas loop
      // c4->SaveAs("wf_diode_padded_16.png");
      delete c4;
 
      double thirdHighest_pol;
      for(double thres=-6.5; thres<=-4.5; thres+=0.1){
	bool Triggered=false;
        Triggered = isTriggered(thres, vsquared, thirdHighest_pol);
	//	printf("Threshold is %f, 3rdpeak is %f \n", thres, thirdHighest_pol);

	if(Triggered){
	  //	  printf("Threshold is %f, 3rdpeak is %f \n", thres, thirdHighest_pol);
	  break;
		  
	}
      }
      delete realAtriEvPtr;
      
	}
    }
  }
}//end main
