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

  if(argc<5){
    cout<< "Usage\n" << argv[0] << " <station> <year> <channel> <run_number_1> <run_number_2> ..."<<endl;
    return 0;
  }
  int station = atoi(argv[1]);
  int year = atoi(argv[2]);
  int channel = atof(argv[3]);

  TH1F *h1[513];
  TH1F *h2[513];
  
  char hname[20];
  char h2name[20];

  char title_file[200];
  sprintf(title_file,"sigmavsfreq_ch%d.txt",channel);
  FILE *fout = fopen(title_file, "w");
  for(int j = 0; j<513; j++){
    sprintf(hname,"h_%d",j);
    sprintf(h2name,"h2_%d",j);
    h1[j] = new TH1F(hname,"test",500,0,4.);
    h2[j] = new TH1F(h2name,"test",500,0,0.5);
  }
  
  int counter =0;
  vector <double> freqs;

  
  for(int arg=4; arg<argc; arg++){//loop over files

    int runNum = atoi(argv[arg]);
    printf("I'm at run %d\n", runNum);
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
    
    TTree* eventTree = (TTree*) RunFile->Get("eventTree");
  
    RawAtriStationEvent *rawEvPtr=0;
    eventTree->SetBranchAddress("event",&rawEvPtr);
    int numEntries = eventTree->GetEntries();
    Int_t run_num=0;
    int stationId=0;

    stationId = rawEvPtr->stationId; //assign the statio id number

    eventTree->SetBranchAddress("run",&run_num); //set the branch address
    
    AraEventCalibrator *calib = AraEventCalibrator::Instance(); //make a calibrator

    for(int event=0; event<numEntries; event++){
      eventTree->GetEvent(event);
      int evt_num = rawEvPtr->eventNumber;//event number
      UsefulAtriStationEvent *realAtriEvPtr_fullcalib = new UsefulAtriStationEvent(rawEvPtr, AraCalType::kLatestCalib); //make the event
      
      bool is_soft_trig = rawEvPtr->isSoftwareTrigger();
      bool isGoodEvent = IsGoodForCalib(station, year, runNum, 0);
      AraQualCuts *qual = AraQualCuts::Instance();
      bool isGood = qual->isGoodEvent(realAtriEvPtr_fullcalib);//From Brian's QCuts library

      if(is_soft_trig && isGoodEvent && isGood && rawEvPtr->isCalpulserEvent()==false){//If RF triggered event
	counter++;

	// cout<<"Soft trigger event!"<<endl;
	double interpolation_step = 0.5;
	//Get Waveforms and spectra, plot and save them too.
	TGraph *waveform = realAtriEvPtr_fullcalib->getGraphFromRFChan(channel);//channel 2.
	bool isAGlitch = isGlitch(waveform);
	if(isAGlitch){
	  //printf("A glitch in channel %d \n" , channel);
	  continue;
	}
	//	cout<< "Met all conditions"<< endl;

	TGraph *Waveform_Interpolated = FFTtools::getInterpolatedGraph(waveform,interpolation_step);
	delete waveform;
	TGraph *Waveform_Padded = FFTtools::padWaveToLength(Waveform_Interpolated, Waveform_Interpolated->GetN()+6000);
	delete Waveform_Interpolated;
	TGraph *Waveform_Cropped=FFTtools::cropWave(Waveform_Padded,-256.,256.);

	TGraph *spectrum = makeFFTPlot(Waveform_Cropped);
	//  cout<< "Num bins of wf "<<Waveform_Cropped->GetN()<<endl;
	/*
	  TCanvas *cc = new TCanvas("","",550*3,650);
	  cc->Divide(3,1);
	  cc->cd(1);
	  Waveform_Cropped->SetTitle("cropped and padded waveform");
	  Waveform_Cropped->GetYaxis()->SetTitleOffset(1.4);
	  Waveform_Cropped->GetYaxis()->SetTitle("Voltage [mV]");
	  Waveform_Cropped->GetYaxis()->SetLabelSize(0.03);
	  Waveform_Cropped->GetXaxis()->SetTitleOffset(1.1);
	  Waveform_Cropped->GetXaxis()->SetLabelSize(0.03);
	  Waveform_Cropped->GetXaxis()->SetTitle("Time [ns]");
	  Waveform_Cropped->Draw();
	  cc->cd(2);
	  spectrum->SetTitle("Spectrum");
	  spectrum->GetYaxis()->SetTitleOffset(1.4);
	  spectrum->GetYaxis()->SetTitle("Magnitude [V/MHz]");
	  spectrum->GetYaxis()->SetLabelSize(0.03);
	  spectrum->GetXaxis()->SetTitleOffset(1.1);
	  spectrum->GetXaxis()->SetLabelSize(0.03);
	  spectrum->GetXaxis()->SetTitle("Frequency [MHz]");
	  spectrum->Draw();
	  cc->cd(3);
	  spectrum2->Draw();
	  cc->SaveAs("spectrum_wf.png");
	*/
	//  cout<< "Num bins is "<<spectrum->GetN()<<endl;
	for(int j = 0; j<spectrum->GetN();j++){
	  double y_value = spectrum->GetY()[j];
	  h1[j]->Fill(y_value);
	  h2[j]->Fill(y_value);
	  if(counter==1){
	    freqs.push_back(spectrum->GetX()[j]);
	  }
	}
      
      
	delete Waveform_Padded;
	delete spectrum;
	delete Waveform_Cropped;
	//   break;
      }//if soft trigger event
    
      delete realAtriEvPtr_fullcalib;
    }//end loop over events
  
  }//end loop over files
  for(int jj=0; jj<freqs.size();jj++){//loop over freq bins
   
      int index=jj;
      Double_t scale1 = 1/h1[index]->Integral("width");
      h1[index]->Scale(scale1);
      h1[index]->Sumw2();
      //f1->SetParameters(8.16779e-03,1.12821e-02);
      int binmax = h1[index]->GetMaximumBin();//Get bin of max value
      double y_max = h1[index]->GetBinContent(binmax); //get value of that bin
      double x_max = h1[index]->GetXaxis()->GetBinCenter(binmax);
      Double_t p0, p1, chi2;

      // cout <<"x_max "<< x_max<<endl;
  
      if(x_max<=0.15){
	int binmax2 = h2[index]->GetMaximumBin();//Get bin of max value
	TF1 *f1 = new TF1("f1","([0]*x)/([1]*[1])*exp(-[0]*[0]*x*x/(2.*[1]*[1]))",0,h2[index]->GetXaxis()->GetBinCenter(binmax2));
	f1->SetParameters(h2[index]->GetMaximum(),h2[index]->GetRMS());
	gStyle->SetOptFit(1111);
	Double_t scale2 = 1/h2[index]->Integral("width");
	h2[index]->Sumw2();
	h2[index]->Scale(scale2);
	f1->SetParameters(h2[index]->GetMaximum(),h2[index]->GetRMS());
	gStyle->SetOptFit(1111);
	h2[index]->Fit("f1","ELQM");
	p0 = f1->GetParameter(0);
	p1 = f1->GetParameter(1);
	chi2 = f1->GetChisquare()/f1->GetNDF(); //Reduced
	delete f1;
      }

      else if(x_max>0.15){
	TF1 *f1 = new TF1("f1","([0]*x)/([1]*[1])*exp(-[0]*[0]*x*x/(2.*[1]*[1]))",0,h1[index]->GetXaxis()->GetBinCenter(binmax));
	f1->SetParameters(h1[index]->GetMaximum(),h1[index]->GetRMS());
	gStyle->SetOptFit(1111);
	f1->SetParameters(h1[index]->GetMaximum(),h1[index]->GetRMS());
	gStyle->SetOptFit(1111);
	h1[index]->Fit("f1","ELQM");
	p0 = f1->GetParameter(0);
	p1 = f1->GetParameter(1);
	chi2 = f1->GetChisquare()/f1->GetNDF(); //Reduced
    	delete f1;

      }


      //cout<<"mean is "<<p0<<endl;
      //cout<<"sigma is "<<p1<<endl;
      //h1[index]->Fit("f1");
      // /*
      if(index==303){
	char title_hist[200];
	sprintf(title_hist,"Dist. at 200 MHz, Channel %d",channel);
	TCanvas *c2 = new TCanvas(title_hist,title_hist,650,650);
	c2->Divide(2,1);
	c2->cd(1);
	h2[index]->SetTitle(title_hist);
	h2[index]->GetYaxis()->SetTitleOffset(1.4);
	h2[index]->GetYaxis()->SetTitle("Events (Normalized)");
	h2[index]->GetYaxis()->SetLabelSize(0.03);
	h2[index]->GetXaxis()->SetTitleOffset(1.1);
	h2[index]->GetXaxis()->SetLabelSize(0.03);
	h2[index]->GetXaxis()->SetTitle("Spectrum Magnitude [mV/Hz]");
	// f1->SetLineColor(8);
	//f1->SetLineWidth(2);
	/*
	  TLegend *legend = new TLegend(0.1,0.85,0.48,0.9);
	  legend->AddEntry("h2","Distribution");
	  legend->AddEntry("f1","Rayleigh Distribution Fit");
	  legend->Draw();*/
	h2[index]->Draw("same");
      
	char title[200];
	sprintf(title,"dist_Rayleigh_%d_200MHz.png",channel);
	c2->cd(2);
	h1[index]->SetTitle(title_hist);
	h1[index]->GetYaxis()->SetTitleOffset(1.4);
	h1[index]->GetYaxis()->SetTitle("Events (Normalized)");
	h1[index]->GetYaxis()->SetLabelSize(0.03);
	h1[index]->GetXaxis()->SetTitleOffset(1.1);
	h1[index]->GetXaxis()->SetLabelSize(0.03);
	h1[index]->GetXaxis()->SetTitle("Spectrum Magnitude [mV/Hz]");
	//  f1->SetLineColor(8);
	//f1->SetLineWidth(2);
	h1[index]->Draw("same");
	c2->SaveAs(title);
	delete c2;
      }

      if(index==512){
	char title_hist[200];
	sprintf(title_hist,"Dist. at 1000 MHz, Channel %d",channel);
	TCanvas *c2 = new TCanvas(title_hist,title_hist,650,650);
	c2->Divide(2,1);
	c2->cd(1);
	h2[index]->SetTitle(title_hist);
	h2[index]->GetYaxis()->SetTitleOffset(1.4);
	h2[index]->GetYaxis()->SetTitle("Events (Normalized)");
	h2[index]->GetYaxis()->SetLabelSize(0.03);
	h2[index]->GetXaxis()->SetTitleOffset(1.1);
	h2[index]->GetXaxis()->SetLabelSize(0.03);
	h2[index]->GetXaxis()->SetTitle("Spectrum Magnitude [mV/Hz]");
	// f1->SetLineColor(8);
	//f1->SetLineWidth(2);
	/*
	  TLegend *legend = new TLegend(0.1,0.85,0.48,0.9);
	  legend->AddEntry("h2","Distribution");
	  legend->AddEntry("f1","Rayleigh Distribution Fit");
	  legend->Draw();*/
	h2[index]->Draw("same");
      
	char title[200];
	sprintf(title,"dist_Rayleigh_%d_1000MHz.png",channel);
	c2->cd(2);
	h1[index]->SetTitle(title_hist);
	h1[index]->GetYaxis()->SetTitleOffset(1.4);
	h1[index]->GetYaxis()->SetTitle("Events (Normalized)");
	h1[index]->GetYaxis()->SetLabelSize(0.03);
	h1[index]->GetXaxis()->SetTitleOffset(1.1);
	h1[index]->GetXaxis()->SetLabelSize(0.03);
	h1[index]->GetXaxis()->SetTitle("Spectrum Magnitude [mV/Hz]");
	//    f1->SetLineColor(8);
	//f1->SetLineWidth(2);
	h1[index]->Draw("same");
	c2->SaveAs(title);
	delete c2;
      }
    

      // gStyle->SetOptStat(0);                                         
      //  */
    
      fprintf(fout,"%2.4f,%d,%2.4f,%2.4f  \n",freqs[jj],channel,p1,chi2);
  }//end loop over freq bins
    fclose(fout);//close sigmavsfreq.txt file
}//end main
