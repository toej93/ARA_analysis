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
#include "TRandom.h"
#include "TRandom2.h"
#include "TRandom3.h"


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
#include "AraQualCuts.h"


#include "Math/Minimizer.h"
#include "CalibUtil.h"

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

  if(argc<4){
    cout<< "Usage\n" << argv[0] << " <station> <year> <run_number_1> <run_number_2> ..."<<endl;
    return 0;
  }
  int station = atoi(argv[1]);
  int year = atoi(argv[2]);
  // int runNum = atof(argv[3]);

 
  int counter=0;
  vector <double> freqs;

  // /*

 
  //  for(int arg=3; arg<argc; arg++){//loop over files
  int arg=3;
    int runNum = atoi(argv[arg]);
    //   printf("I'm at run %d\n", runNum);
    if(isBadRun(station,year,runNum)) return -1;//continue to loop over files
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
      return -1;
    }
    
    TTree* eventTree = (TTree*) RunFile->Get("eventTree");
  
    RawAtriStationEvent *rawEvPtr=0;
    eventTree->SetBranchAddress("event",&rawEvPtr);
    int numEntries = eventTree->GetEntries();
    Int_t run_num=0;
    int stationId=0;

    stationId = rawEvPtr->stationId; //assign the statio id number

    eventTree->SetBranchAddress("run",&run_num); //set the branch address
    
    AraEventCalibrator *calib = AraEventCalibrator::Instance(); //make a calibrator
    
    //See if the tree is empty
    char title_file[200];
    sprintf(title_file,"./files_distributions/2014/Rayleigh_spectral_dist_run%d.root", runNum);
    TFile *f = new TFile(title_file,"RECREATE");

    TTree *myTree[16];
    double magnitude[16][513];
    
    for(int channel=0;channel<16;channel++){//channel loop
      char treeName[50];
      sprintf(treeName,"Spectral_Dist%d",channel);
      bool treeExists =  f->GetListOfKeys()->Contains(treeName);
      // /*
      if(!treeExists){
	//	cout << "Doesn't exist"<< endl;
	myTree[channel] = new TTree(treeName, treeName);
	char hname[20];
	for(int j = 0; j<513; j++){
	  sprintf(hname,"magnitudes_%d",j);
	  myTree[channel]->Branch(hname, &magnitude[channel][j]);
	}
	}
      //     */
      else{
	//	cout << "Does exist"<< endl;
	myTree[channel] = (TTree*) f->Get(treeName);
	myTree[channel]->SetDirectory(f);
	char hname[20];
	for(int j = 0; j<513; j++){
	  sprintf(hname,"magnitudes_%d",j);
	  myTree[channel]->SetBranchAddress(hname, &magnitude[channel][j]);
	}
      }
    }//end channel loop

    // /*
    for(int event=0; event<numEntries; event++){//loop over events
      eventTree->GetEvent(event);
      int evt_num = rawEvPtr->eventNumber;//event number
      bool is_soft_trig = rawEvPtr->isSoftwareTrigger();
      if(!is_soft_trig) continue;
      UsefulAtriStationEvent *realAtriEvPtr_fullcalib = new UsefulAtriStationEvent(rawEvPtr, AraCalType::kLatestCalib); //make the event
      
      bool isGoodEvent = IsGoodForCalib(station, year, runNum);
      AraQualCuts *qual = AraQualCuts::Instance();
      bool isGood = qual->isGoodEvent(realAtriEvPtr_fullcalib);//From Brian's QCuts library

      if(isGoodEvent && isGood && rawEvPtr->isCalpulserEvent()==false){//If RF triggered event
	counter++;

	double interpolation_step = 0.5;

	for(int channel=0;channel<16;channel++){//channel loop2
	  //Get Waveforms and spectra, plot and save them too.
	  TGraph *waveform = realAtriEvPtr_fullcalib->getGraphFromRFChan(channel);//channel 2.
	  bool isAGlitch = isGlitch(waveform);
	  if(isAGlitch){
	    //printf("A glitch in channel %d \n" , channel);
	    continue;
	  }

	  TGraph *Waveform_Interpolated = FFTtools::getInterpolatedGraph(waveform,interpolation_step);
	  delete waveform;
       
	  TGraph *Waveform_Padded = FFTtools::padWaveToLength(Waveform_Interpolated, 1024);
	  delete Waveform_Interpolated;
	
	  //  TGraph *Waveform_Cropped=FFTtools::cropWave(Waveform_Padded,-255.5.,256.);
	  //  TGraph *spectrum = makeFreqV_MilliVoltsNanoSeconds(Waveform_Padded);
	  TGraph *spectrum = makeFFTPlot(Waveform_Padded);

	  delete Waveform_Padded;	    
	  //delete Waveform_Cropped;
	  /*
	  char name[40];
	  sprintf(name, "./wforms/wf_ch%d_ev%d_AraSim.png", channel, event);
	  TCanvas *cc = new TCanvas("","",850*2,850);
	  cc->Divide(2,1);
	  cc->cd(1);
	  makeFFTPlot(Waveform_Padded)->Draw();
	  cc->cd(2);
	  spectrum->Draw();
	  cc->SaveAs(name);
	  delete cc;
	  */
	  //  delete spectrum;
	  //	  delete waveform;
	  for(int j = 0; j<spectrum->GetN();j++){//loop ober bins
	    //cout <<spectrum->GetN()<<endl;
	    double y_value = spectrum->GetY()[j];
	    magnitude[channel][j]=y_value;
	  }//end loop over bins
	  delete spectrum;
	  //	  myTree[channel]->Write();
	  	myTree[channel]->Fill();

	}//channel loop2

      }//if soft trigger event
    
      delete realAtriEvPtr_fullcalib;
      
    }//end loop over events
    // */
    /*  for(int channel=0; channel<16; channel++){
      myTree[channel]->Write();
    }
    */
    delete calib;
    f->Write("",TObject::kOverwrite);
    f->Close();
    //   RunFile->Close();
    //    delete f;
    //   delete RunFile;

    //  }//end loop over files
   /* 

   */
 
}//end main







