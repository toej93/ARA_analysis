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
  for(int file=1; file<argc; file++){
    // int runNum = eventTree.run;
    TString fileKey(argv[file]); //a file key                                
    chain.Add(fileKey); //add files to the chain                             
  }
  TTree *myTree[16];
  double magnitude[16][513];

  
  char title_file[200];
  sprintf(title_file,"./crosscheck_AraSim/Rayleigh_spectral_dist_AraSim.root");
  TFile *f = new TFile(title_file,"RECREATE");
  
  for(int channel=0;channel<16;channel++){//channel loop
    char treeName[50];
    sprintf(treeName,"Spectral_Dist%d",channel);
    myTree[channel] = new TTree(treeName, treeName);
    char hname[20];
    for(int j = 0; j<513; j++){
      sprintf(hname,"magnitudes_%d",j);
      myTree[channel]->Branch(hname, &magnitude[channel][j]);
    }
  }//end channel loop
  // */
    chain.SetBranchAddress("UsefulAtriStationEvent", &realAtriEvPtr);
  chain.GetEvent(0);
 
  int numEntries = chain.GetEntries();
  cout <<numEntries << endl;
 
  
  for(Long64_t event=0; event<numEntries; event++){//loop over events
    chain.GetEvent(event);
    int evt_num = realAtriEvPtr->eventNumber;//event number
    double interpolation_step = 0.5;
      
    for(int channel=0;channel<15;channel++){//channel loop2
      //Get Waveforms and spectra, plot and save them too.
      TGraph *waveform = realAtriEvPtr->getGraphFromRFChan(channel);//channel 2.
      //   /*
      //   printf("Waveform N is %d \n", waveform->GetN());
      ///*
      
      //printf("A glitch in channel %d \n" , channel);
      //*/
	TGraph *Waveform_Interpolated = FFTtools::getInterpolatedGraph(waveform,interpolation_step);
	//delete waveform;
	//printf("Waveform_interp N is %d \n ", Waveform_Interpolated->GetN());
	     
	TGraph *Waveform_Padded = FFTtools::padWaveToLength(Waveform_Interpolated, 1024);
	//	printf("Waveform_padded N is %d \n", Waveform_Padded->GetN());
	
	delete Waveform_Interpolated;
	
	//	printf("Waveform_cropped N is %d \n", Waveform_Cropped->GetN());

	//	TGraph *spectrum = makeFreqV_MilliVoltsNanoSeconds(Waveform_Padded);
	TGraph *spectrum = makeFFTPlot(Waveform_Padded);

	delete Waveform_Padded;
	for(int j = 0; j<spectrum->GetN();j++){//loop over bins
	  //	  cout <<spectrum->GetN()<<endl;
	double y_value = spectrum->GetY()[j];
	magnitude[channel][j]=y_value;
	}//end loop over bins
	/*
	char name[40];
	sprintf(name, "./wforms/wf_ch%d_ev%d_AraSim.png", channel, event);
	TCanvas *cc = new TCanvas("","",850,850);
	cc->Divide(2,1);
	cc->cd(1);
	waveform->Draw();
	cc->cd(2);
	spectrum->Draw();
	cc->SaveAs(name);
	delete cc;
	delete spectrum;
	delete waveform;
	*/
	//	  myTree[channel]->Write();
	myTree[channel]->Fill();
	//    */
      
    }//channel loop2

    
    //  delete realAtriEvPtr;
      
  }//end loop over events
  /*  for(int channel=0; channel<16; channel++){
      myTree[channel]->Write();
      }
  */
  f->Write("",TObject::kOverwrite);
  f->Close();
  //   RunFile->Close();
  //    delete f;
  //   delete RunFile;

  /* 

   */
 
}//end main







