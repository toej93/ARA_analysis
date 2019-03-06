//Make noise waveforms from data
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

    h1[j] = new TH1F(hname,hname,200,0,120000);
    h_rms[j] = new TH1F(hname2,hname2,200,1,1);

  }
  for(int arg=3; arg<argc; arg++){

    int runNum = atoi(argv[arg]);
    //   printf("I'm at run %d\n", runNum);
    if(isBadRun(station,year,runNum)) continue;
    char run_file_name[400];
    if(year!=2013){
      sprintf(run_file_name,"/fs/scratch/PAS0654/ara/10pct/RawData/A%d/%d/sym_links/event00%d.root",station,year,runNum);
    }
    else{
      sprintf(run_file_name,"/fs/scratch/PAS0654/ara/10pct/RawData/A%d/%d/sym_links/event%d.root",station,year,runNum);
    }
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

   
    AraEventCalibrator *calib = AraEventCalibrator::Instance(); //make a calibrator

    for(int event=0; event<numEntries; event++){//loop over events
      eventTree->GetEvent(event);
      int evt_num = rawEvPtr->eventNumber;//event number

      UsefulAtriStationEvent *realAtriEvPtr_fullcalib = new UsefulAtriStationEvent(rawEvPtr, AraCalType::kLatestCalib); //make the event

      bool is_soft_trig = rawEvPtr->isSoftwareTrigger();
      bool isGoodEvent = IsGoodForCalib(station, year, runNum);
      AraQualCuts *qual = AraQualCuts::Instance();
      bool isGood = qual->isGoodEvent(realAtriEvPtr_fullcalib);//From Brian's QCuts library

      if(is_soft_trig && isGoodEvent && isGood && rawEvPtr->isCalpulserEvent()==false){//If RF triggered event
	//cout<<"Good for calibration!"<<endl;
	int eventId=rawEvPtr->eventId;
	int numReadoutBlocks=rawEvPtr->numReadoutBlocks;
	uint32_t triggerInfo[MAX_TRIG_BLOCKS];
	uint8_t triggerBlock[MAX_TRIG_BLOCKS];
	for(int trig=0;trig<MAX_TRIG_BLOCKS;trig++) {
	  // triggerInfo[trig]=rawEvPtr->triggerInfo[trig];
	  triggerBlock[trig]=rawEvPtr->triggerBlock[trig];
	  //cout << "Trigger info: " << triggerInfo[trig] << endl;
	  //cout << "Trigger block: " << triggerBlock[trig] << endl;
	}
	double vsquared[16];
	for(int channel = 0; channel<15; channel++){
	  TGraph *waveform = realAtriEvPtr_fullcalib->getGraphFromRFChan(channel);//channel 2
	  ///*
	    char name[40];
	    sprintf(name, "./wforms/wf_ch%d_ev%d.png", channel, event);
	    TCanvas *cc = new TCanvas("","",850*2,850);
	    cc->Divide(2,1);
	    cc->cd(1);
	    waveform->Draw();
	    cc->cd(2);
	    FFTtools::makePowerSpectrumMilliVoltsNanoSeconds(waveform)->Draw();
	    cc->SaveAs(name);
	    delete cc;
	    //printf("A glitch in channel %d \n" , channel);
	    //	    */
	  bool isAGlitch = isGlitch(waveform);
	  if(isAGlitch){
	    
	    continue;
	  }
	  double time_window = waveform->GetX()[waveform->GetN()/2];
	  TGraph *waveform_cropped = FFTtools::cropWave(waveform, time_window-170, time_window);//looking during trigger window
	  /*  TGraph *Waveform_Interpolated = FFTtools::getInterpolatedGraph(waveform,0.5);
	  delete waveform;
	  TGraph *Waveform_Padded = FFTtools::padWaveToLength(Waveform_Interpolated, Waveform_Interpolated->GetN()+6000);
	  delete Waveform_Interpolated;
	  TGraph *Waveform_Cropped=FFTtools::cropWave(Waveform_Padded,-150.,350.);
	  delete Waveform_Padded;
	  TGraph *integrated_wf = makeSummedVsquaredWForm(Waveform_Cropped);//retrurns v^2
	  delete Waveform_Cropped;
	  vsquared[channel] = sqrt(FFTtools::getPeakSqVal(integrated_wf));//no need to square again
	  delete integrated_wf;
	  // TGraph *Waveform_Interpolated = FFTtools::getInterpolatedGraph(waveform_cropped,0.5);
	  */

	  double rms = getRMS(waveform, waveform->GetN());
	  h_rms[channel]->Fill(rms);
	  vsquared[channel] = FFTtools::getPeakSqVal(waveform_cropped);//no need to square again
	  delete waveform;
	  delete waveform_cropped;

	  //	  delete waveform_cropped;
	}//channel loop
	
	vector<double> peak;
	peak.resize(2);
	peak.clear();
	get3rdPeakSqValSamePol(vsquared, peak);
	//	printf("peak v: %d, peak h:%d \n", peak[0], peak[1]);
	for(int ii = 0; ii<7; ii++){//loop over maxvsquared values
	  if(vsquared[ii]==peak[0]){
	    h1[ii]->Fill(sqrt(2)*vsquared[ii]);//Fill hist of respective channel in which 3rdv2 was located
	  }
	}//loop over maxvsquared values
	
	for(int ii = 8; ii<15; ii++){//loop over maxvsquared values
	  if(vsquared[ii]==peak[1]){
	    h1[ii]->Fill(sqrt(2)*vsquared[ii]);//Fill hist of respective channel in which 3rdv2 was located
	  }
	}//loop over maxvsquared values
	
      }//close if RF triggered event
      delete realAtriEvPtr_fullcalib;
    }//end loop over events
    delete calib;
    /*
    TCanvas *c2 = new TCanvas("","",1850,1850);
    Double_t norm = 100000.;
    c2->Divide(4,4);
    char hname_2[20];
    for(int i=0; i<16; i++){//canvas loop
      c2->cd(i+1);
      Double_t scale = norm/(h1[i]->Integral("width"));
      h1[i]->Scale(scale);
      h1[i]->Draw("");
      c2->Update();
      //  delete h1[i];
    }//canvas loop
  

    c2->SaveAs("vsquared.png");
    */
    //   delete calib;
  char filename[100];
  sprintf(filename, "./files_3rdhighest/hist_from_data_3rdhighest_rms_run%d.root", runNum);
  TFile *f = new TFile(filename, "RECREATE");
  
  for(int channel = 0; channel<15; channel++){
    h1[channel]->Write("");
    h_rms[channel]->Write();

  }
  f->Write("");
  f->Close();
  }//end looping over runs
}//end main
