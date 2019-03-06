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

;


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

    h1[j] = new TH1F(hname,hname,200,0,120000);
    h_rms[j] = new TH1F(hname2,hname2,200,1,1);

  }
  for(Long64_t event=0;event<numEntries;event++) {
    chain.GetEvent(event);

    double vsquared[16];
    for(int channel = 0; channel<15; channel++){
      TGraph *waveform = realAtriEvPtr->getGraphFromRFChan(channel);//channel 2.
      /*
      //	if(channel == 0){
	 char name[40];
	 sprintf(name, "./wforms/wf_%0.1f_ch%d_ev%d.png", threshold, channel, event);
	 TCanvas *cc = new TCanvas("","",850*2,850);
	 cc->Divide(2,1);
	 cc->cd(1);
	 waveform->Draw();
	 cc->cd(2);
	 FFTtools::makePowerSpectrumMilliVoltsNanoSeconds(waveform)->Draw();
	 //	 cc->SaveAs(name);
	 delete cc;
	 //	 }
	 */
      TGraph *waveform_cropped = FFTtools::cropWave(waveform, -170, 0);
      double rms = getRMS(waveform, waveform->GetN());
      h_rms[channel]->Fill(sqrt(2)*rms);
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
      vsquared[channel] = FFTtools::getPeakSqVal(waveform_cropped);//no need to square again
      delete waveform;
      delete waveform_cropped;
      
    }//channel loop
    vector<double> peak;
    peak.resize(2);
    peak.clear();
    get3rdPeakSqValSamePol(vsquared, peak);
    //cout << peak[0] << endl;
    //  printf("peak v: %f, peak h:%f \n", peak[0], peak[1]);
    for(int ii = 0; ii<7; ii++){//loop over maxvsquared values
      if(vsquared[ii]==peak[0]){
	h1[ii]->Fill(2*vsquared[ii]);//Fill hist of respective channel in which 3rdv2 was located
      }
    }//loop over maxvsquared values

    for(int ii = 8; ii<15; ii++){//loop over maxvsquared values
      if(vsquared[ii]==peak[1]){
	h1[ii]->Fill(2*vsquared[ii]);//Fill hist of respective channel in which 3rdv2 was located
      }
    }//loop over maxvsquared values
    
  }

  //  /*
  TH1F *h2[16];
  char h2name[20];
  for(int j = 0; j<15; j++){
    sprintf(h2name,"h2_channel %d",j);
    h2[j] = new TH1F(h2name,"test",200,0,120000);
  }
  TFile *f1 = new TFile(name, "UPDATE");
  for(int channel = 0; channel<15; channel++){
    h1[channel]->Write();
    h_rms[channel]->Write();
  }
  f1->Write("",TObject::kOverwrite);
  f1->Close();
  //  */
  /*
  //  h1->Scale(scale);
  // h1->Scale(norm, "width");
  TCanvas *c2 = new TCanvas("","",850,850);
  TFile *f = new TFile("hist_from_data_3rd_4.5.root");//This is for the 3rd highest peak. The highest peak one is "_highest"
  Double_t norm = 1000.;
  c2->Divide(4,4);
  char hname_2[16];
  for(int i=0; i<16; i++){//canvas loop
    c2->cd(i+1);
    sprintf(hname_2,"h1_channel%d",i);
    h2[i] = (TH1F*)f->Get(hname_2);
    Double_t scale2 = norm/(h2[i]->Integral("width"));
    h2[i]->Scale(scale2);
    h2[i]->SetLineColor(8);
    h2[i]->Draw("");
    Double_t scale = norm/(h1[i]->Integral("width"));
    h1[i]->Scale(scale);
    h1[i]->Draw("SAMES");
    gStyle->SetStatW(.19);
    c2->Update();
    TPaveStats *st = (TPaveStats*)h2[i]->FindObject("stats");
    st->SetX1NDC(0.2);
    st->SetX2NDC(0.02);
    //  delete h1[i];
    // delete h2[i];
  }//canvas loop
  

  c2->SaveAs("vsquared_sim_3rd_4.5.png");
  */
}





