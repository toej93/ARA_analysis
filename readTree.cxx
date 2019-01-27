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
//$(FFTWSYS) -llibRootFftwWrapper
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
//#include "tools_Cuts.h"


class EarthModel; //class

/*
Double_t get3rdPeakSqVal(double *vsquared) //get 3rd highest v^2
{
  vector <double> peakVal;
  for(int i = 0; i<16; i++){
    peakVal.push_back(vsquared[i]);
  }
  std::nth_element(peakVal.begin(), peakVal.begin()+2, peakVal.end(), std::greater<int>());
  return peakVal[2];
}

*/

RawAtriStationEvent *rawAtriEvPtr;
UsefulAtriStationEvent *realAtriEvPtr;

//int getPeakBin(TGraph *gr);

//double getPeak(TGraph *gr);


//int main() {
int main(int argc, char **argv) {    // this is for manual power threshold value


  TChain chain("eventTree"); //this for the events for the exterior loop     
  for(int file=2; file<argc; file++){
    // int runNum = eventTree.run;
    TString fileKey(argv[file]); //a file key                                
    chain.Add(fileKey); //add files to the chain                             
  }
  int channel = atof(argv[1]);

  
  chain.SetBranchAddress("UsefulAtriStationEvent", &realAtriEvPtr);
  chain.GetEvent(0);
 

  int numEntries = chain.GetEntries();
  cout << numEntries <<endl;
  TH1F *h1[16];
  
  char hname[20];

  for(int j = 0; j<16; j++){
    sprintf(hname,"sim_channel %d",j);
    h1[j] = new TH1F(hname,hname,200,0,60000);
  }
  for(Long64_t event=0;event<numEntries;event++) {
    chain.GetEvent(event);

    double vsquared[16];
    for(int channel = 0; channel<16; channel++){
      TGraph *waveform = realAtriEvPtr->getGraphFromRFChan(channel);//channel 2.
      vsquared[channel] = FFTtools::getPeakSqVal(waveform);
      delete waveform;
    }//channel loop
    //    double thirdvsquared = get3rdPeakSqVal(vsquared);
    for(int ii = 0; ii<16; ii++){//loop over maxvsquared values
      //      if(vsquared[ii]==thirdvsquared){
      h1[ii]->Fill(sqrt(2)*vsquared[ii]);//Fill hist of respective channel in which 3rdv2 was located
      // }
    }//loop over maxvsquared values
    
  }
  TH1F *h2[16];
  char h2name[20];
  for(int j = 0; j<16; j++){
    sprintf(h2name,"h2_channel %d",j);
    h2[j] = new TH1F(h2name,"test",200,0,60000);
  }
  TFile *f1 = new TFile("hist_from_data_5.8.root", "UPDATE");
  for(int channel = 0; channel<16; channel++){
    h1[channel]->Write();
  }
  f1->Write();
  f1->Close();
  
  //  h1->Scale(scale);
  // h1->Scale(norm, "width");
  TCanvas *c2 = new TCanvas("","",850,850);
  TFile *f = new TFile("hist_from_data_5.8.root");//This is for the 3rd highest peak. The highest peak one is "_highest"
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
  

  c2->SaveAs("vsquared_sim_5.8.png");
  // c2->SaveAs("vsquared_sim.pdf");

  
}





