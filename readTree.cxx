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
  sprintf(name, "hist_from_data_3rd_rms_%0.1f.root", threshold);
  
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

    h1[j] = new TH1F(hname,hname,200,0,-10);
    h_rms[j] = new TH1F(hname2,hname2,200,0,-10);

  }
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
      rms_diode_sum[channel] += getRMS(diode_wf, getBinsforRMS(diode_wf));      
      delete waveform_Padded;      
      delete diode_wf;
    }

  }
  
  for(int i=0; i<15;i++){
	rms_diode_avg[i]=rms_diode_sum[i]/100;
	//	cout << rms_diode_avg[i] << endl;
  }
  
      
  for(Long64_t event=0;event<numEntries;event++) {
    chain.GetEvent(event);
    double vsquared[16];
    double rms[16];
    for(int channel = 0; channel<15; channel++){
      TGraph *waveform = realAtriEvPtr->getGraphFromRFChan(channel);//channel.
 
      TGraph *waveform_Interpolated = FFTtools::getInterpolatedGraph(waveform,0.5);
      delete waveform;
      TGraph *waveform_Padded = FFTtools::padWaveToLength(waveform_Interpolated, 1024);
      delete waveform_Interpolated;
      //TGraph *waveform_cropped = FFTtools::cropWave(waveform_Interpolated, -160, 10);//Crop waveform and look back in the trigger window

      rms[channel] = getRMS(waveform_Padded, getBinsforRMS(waveform_Padded));
      h_rms[channel]->Fill(rms[channel]);
     
      /* //TGraph *waveform_cropped = FFTtools::cropWave(waveform, -85, 85);//looking during trigger window
	 TGraph *Waveform_Interpolated = FFTtools::getInterpolatedGraph(waveform,0.5);
	 delete waveform;
	 TGraph *Waveform_Padded = FFTtools::padWaveToLength(Waveform_Interpolated, Waveform_Interpolated->GetN()+6000);
	 delete Waveform_Interpolated;
	 TGraph *Waveform_Cropped=FFTtools::cropWave(Waveform_Padded,-150.,350.);
	 delete Waveform_Padded;
	 TGraph *integrated_wf = makeSummedVsquaredWForm(Waveform_Cropped);//retrurns v^2
	 delete Waveform_Cropped;
	 vsquared[channel] = sqrt(FFTtools::getPeakSqVal(integrated_wf));//no need to square again
	 delete integrated_wf;
      */
      
     
      TGraph *diode_wf = doConvolve(waveform_Padded);
      // double mean[16];
      //double mean_new[16];
      //double sum=0;
      //double sum2=0;
      //double rms_diode[16];
      //  for(int kk=0;kk<diode_wf->GetN();kk++) sum+=diode_wf->GetY()[kk];
      // mean[channel]=sum/getBinsforRMS(diode_wf);
      // cout << sum<< endl;
      // for(int samp=0; samp<diode_wf->GetN(); samp++) diode_wf->GetY()[samp]-=mean[channel];
      //  for(int kk=0;kk<diode_wf->GetN();kk++) sum2+=diode_wf->GetY()[kk];
      // mean_new[channel]=sum2/getBinsforRMS(diode_wf);
      //cout << mean_new[channel]<<endl;
      //  for(int kk=0; kk<diode_wf->GetN(); kk++) cout << diode_wf->GetY()[kk] << endl;
      // printf("Nbins: %d, Nbins_norm: %d\n", diode_wf->GetN(),getBinsforRMS(diode_wf));
      //rms_diode[channel] = getRMS(diode_wf, getBinsforRMS(diode_wf));
      for(int samp=0; samp<diode_wf->GetN(); samp++) diode_wf->GetY()[samp]/=rms_diode_avg[channel];
      TGraph *waveform_cropped = FFTtools::cropWave(diode_wf, -10, 10);//Crop waveform and look back in the trigger window
      
      
      /*
      // cout << channel << endl;
      if(channel == 5){
	char name[40];
	sprintf(name, "./wforms/wf_%0.1f_ch%d_ev%d.png", threshold, channel, event);
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
     

      delete waveform_Padded;
      //  TGraph *integrated_wf = makeSummedVsquaredWForm(waveform_cropped, 5);//retrurns v^2
      vsquared[channel] = getNegativePeak(waveform_cropped);//no need to square again
      // cout <<  vsquared[channel] << endl;
      //vsquared[channel] = sqrt(FFTtools::getPeakSqVal(integrated_wf));      
      delete waveform_cropped;
      delete diode_wf;
      // delete integrated_wf;
      //delete waveform_cropped;
    }//channel loop
    int whichCh=0;
    double thePeak = getMostNegative(vsquared, whichCh);
    //printf("Peak: %f, Ch: %d\n", thePeak, whichCh);
    if(thePeak<=threshold*-1 && thePeak>-20 ) h1[whichCh]->Fill(thePeak);
    /*
      vector<double> peak;
      peak.resize(2);
      peak.clear();
      get3rdsmallest(vsquared, peak);// This function is in CalibUtil.h
      printf("Vpol3rdhighest: %f,Hpol3rdhighest: %f \n", peak[0], peak[1]);
      //cout << peak[0] << endl;
      //  printf("peak v: %f, peak h:%f \n", peak[0], peak[1]);
      for(int ii = 0; ii<15; ii++){//loop over maxvsquared values
      cout << vsquared[ii]<< endl;

      //cout << vsquared[ii]-peak[0] <<endl;
      if(abs(vsquared[ii]-peak[0]) < 1e-8){
      h1[ii]->Fill(vsquared[ii]);//Fill hist of respective channel in which 3rdv2 was located
      }
      }//loop over maxvsquared values
   
      for(int ii = 8; ii<15; ii++){//loop over maxvsquared values
      if(abs(vsquared[ii]-peak[1]) < 1e-8){
      h1[ii]->Fill(vsquared[ii]);//Fill hist of respective channel in which 3rdv2 was located. Mysterious factor of 2
      }
      }//loop over maxvsquared values
    */
  }
 

  //  /*
  TH1F *h2[16];
  char h2name[20];
  for(int j = 0; j<15; j++){
    sprintf(h2name,"h2_channel %d",j);
    h2[j] = new TH1F(h2name,"test",200,0,-10);
  }
  TFile *f1 = new TFile(name, "RECREATE");
  for(int channel = 0; channel<15; channel++){
    h1[channel]->Write();
    h_rms[channel]->Write();
  }
  f1->Write("",TObject::kOverwrite);
  f1->Close();
}





