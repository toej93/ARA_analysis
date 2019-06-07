//Finds the 3rd highest peak square for each polarization and stores it in a root file.
//This works for simulation data only.
#include <iostream>
#include <fstream>
#include <sstream>
#include <math.h>
#include <string>
#include <stdio.h>
#include <stdlib.h>
#include <vector>
#include <time.h>
#include "TTreeIndex.h"
#include "TChain.h"
#include "TH1.h"
#include "TF1.h"
#include "TF2.h"
#include "TFile.h"
#include "TRandom.h"
#include "TRandom2.h"
#include "TRandom3.h" 
#include "TTree.h"
#include "TLegend.h"
#include "TLine.h"
#include "TROOT.h"
#include "TPostScript.h"
#include "TCanvas.h"
#include "TH2F.h"
#include "TText.h"
#include "TProfile.h"
#include "TGraphErrors.h"
#include "TStyle.h"
#include "TMath.h"
#include <unistd.h>
#include "TVector3.h"
#include "TRotation.h"
#include "TSpline.h"
#include "TPaveStats.h"
#include "WaveformFns.h"
//$(FFTWSYS) -llibRootFftwxWrapper
//#include <fftw3.h>

using namespace std;

#include "RawIcrrStationEvent.h"  
#include "UsefulIcrrStationEvent.h"
#include "RawAraStationEvent.h"
#include "RawAtriStationEvent.h"
#include "UsefulAtriStationEvent.h"
#include "AraEventCalibrator.h"
//#include "FFTtools.h"
#include "PlottingFns.h"
#include "Constants.h"
#include "CalibUtil.h"
#include "AraQualCuts.h"



class EarthModel; //class


RawAtriStationEvent *rawAtriEvPtr;
UsefulAtriStationEvent *realAtriEvPtr;



//int main() {
int main(int argc, char **argv) {    // this is for manual power threshold value


  TChain chain("eventTree"); //this for the events for the exterior loop     
  for(int file=2; file<argc; file++){
    // int runNum = eventTree.run;
    TString fileKey(argv[file]); //a file key
    //   if (file.IsZombie()) continue;
    chain.Add(fileKey); //add files to the chain                             
  }
  double threshold = atof(argv[1]);
  char name[50];
  // sprintf(name, "hist_from_data_3rd_%0.1f.root", threshold);
  sprintf(name, "hist_from_sim_3rd_diode_%0.1f.root", threshold);
  
  chain.SetBranchAddress("UsefulAtriStationEvent", &realAtriEvPtr);
  chain.GetEvent(0);
 

  int numEntries = chain.GetEntries();
  cout << numEntries <<endl;
  TH1F *h1[16];
  TH1F *h_rms[16];
  
  char hname[20];
  char hname2[20];


  for(int j = 0; j<15; j++){
    sprintf(hname,"sim_channel %d",j);
    sprintf(hname2,"rms_sim_channel %d",j);

    h1[j] = new TH1F(hname,hname,200,-10,0);
    h_rms[j] = new TH1F(hname2,hname2,200,0,100);

  }
  ///*
  double rms_diode_avg[16];
  double rms_diode_sum[16];

  for(Long64_t event=0;event<100;event++) {
    chain.GetEvent(event);
    for(int channel = 0; channel<15; channel++){
      TGraph *waveform = realAtriEvPtr->getGraphFromRFChan(channel);//channel.
      
      TGraph *waveform_Interpolated = FFTtools::getInterpolatedGraph(waveform,0.5);
      delete waveform;
      TGraph *waveform_Padded = FFTtools::padWaveToLength(waveform_Interpolated, 1024);
      delete waveform_Interpolated;
      TGraph *diode_wf = doConvolve(waveform_Padded);
      rms_diode_sum[channel] += getRMS(diode_wf, getBinsforRMS(waveform_Padded));      
      delete waveform_Padded;      
      delete diode_wf;
    }

  }
  
  for(int i=0; i<15;i++){
	rms_diode_avg[i]=rms_diode_sum[i]/100;
	//	cout << rms_diode_avg[i] << endl;
  }
  //  */
  
    
  for(Long64_t event=0;event<numEntries;event++) {
    chain.GetEvent(event);
    double vsquared[16];
    double rms[16];

    AraQualCuts *qualCut = AraQualCuts::Instance();
    bool isGoodEvent=false;

    bool hasTimingError = qualCut->hasTimingError(realAtriEvPtr);
    bool hasTooFewBlocks = qualCut->hasTooFewBlocks(realAtriEvPtr);
    bool hasOffsetBlocks = qualCut->hasOffsetBlocks(realAtriEvPtr);
    //cout << "here!!!!!!!!!!!!!" << endl;
			    

    if(!hasTimingError && !hasTooFewBlocks && !hasOffsetBlocks)
      isGoodEvent=true;
    if(!isGoodEvent) continue;
    //cout << "good event" << endl;
    for(int channel = 0; channel<15; channel++){
      TGraph *waveform = realAtriEvPtr->getGraphFromRFChan(channel);//channel.
      //bool isGoodEvent_ = IsGoodForCalib_sim(threshold);//first 3 args don't matter
      //  if(!isGoodEvent_) cout << "BAAAAAAAD!!!!" << endl;
      TGraph *waveform_Interpolated = FFTtools::getInterpolatedGraph(waveform,0.5);
      delete waveform;
      TGraph *waveform_Padded = FFTtools::padWaveToLength(waveform_Interpolated, 2048);
      delete waveform_Interpolated;
      //TGraph *waveform_cropped = FFTtools::cropWave(waveform_Interpolated, -160, 10);//Crop waveform and look back in the trigger window

      rms[channel] = getRMS(waveform_Padded, getBinsforRMS(waveform_Padded));
      h_rms[channel]->Fill(rms[channel]);
    
      TGraph *diode_wf = doConvolve(waveform_Padded);
      delete waveform_Padded;

      for(int samp=0; samp<diode_wf->GetN(); samp++) diode_wf->GetY()[samp]/=rms_diode_avg[channel];
      TGraph *waveform_cropped_diode = FFTtools::cropWave(diode_wf, -1, 1);//Crop waveform and look back in the trigger window
      //TGraph *waveform_sum_sq = makeSummedVsquaredWForm(waveform_Interpolated, 5);
     
      vsquared[channel] = getNegativePeak(diode_wf);

      // cout <<  vsquared[channel] << endl;
      //vsquared[channel] = sqrt(FFTtools::getPeakSqVal(integrated_wf));      
      // delete waveform_cropped;
      delete diode_wf;
      // delete integrated_wf;
      //delete waveform_cropped;
      // delete waveform_sum_sq;
    }//channel loop
    int whichCh=0;
    double thePeak = getMostNegative(vsquared, whichCh);
    //printf("Peak: %f, Ch: %d\n", thePeak, whichCh);
    if(thePeak>threshold){
      printf("Event is: %d, peak is %d \n", event, thePeak);
    }
    h1[whichCh]->Fill(thePeak);

   
  }
 

  //  /*
  TH1F *h2[16];
  char h2name[20];
  for(int j = 0; j<15; j++){
    sprintf(h2name,"h2_channel %d",j);
    h2[j] = new TH1F(h2name,"test",200,-10,0);
    
  }
  TFile *f1 = new TFile(name, "RECREATE");
  for(int channel = 0; channel<15; channel++){
    h1[channel]->Write();
    h_rms[channel]->Write();
  }
  f1->Write("",TObject::kOverwrite);
  f1->Close();
}





