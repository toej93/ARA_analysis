////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////  spectrograms.cxx
////
//// Jorge Torres
////////////////////////////////////////////////////////////////////////////////

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

//AraRoot Includes
#include "RawIcrrStationEvent.h"
#include "RawAtriStationEvent.h"
#include "UsefulAraStationEvent.h"
#include "UsefulIcrrStationEvent.h"
#include "UsefulAtriStationEvent.h"
#include "RawAraStationEvent.h"
#include "AraAntennaInfo.h"
#include "AraGeomTool.h"
#include "FFTtools.h"
#include "AraStationInfo.h"
#include "AraAntennaInfo.h"

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
#include "TPaletteAxis.h"

int main(int argc, char **argv)
{
  RawIcrrStationEvent *rawIcrrEvPtr=0;
  int a=2;

  if(argc<2) {
    std::cout << "Usage\n" << argv[0] << " <input file>\n";
    return 0;
  }


  TChain chain("eventTree"); //this for the events for the exterior loop
  for(int file=1; file<argc; file++){
    TString fileKey(argv[file]); //a file key
    chain.Add(fileKey); //add files to the chain
  }
  chain.SetBranchAddress("event", &rawIcrrEvPtr);
  std::cerr << "Set Branch address to Icrr\n";

  //Now we set up out run list
  int numEntries=chain.GetEntries();

  //we need to delcare what time of day we want our spectrogram to start
  //and also declare when we want it to end
  TDatime normal_start(2011, 01, 25, 12, 00,0);
  int start_time_bin = normal_start.Convert();
  TDatime normal_stop(2011, 01, 25, 12, 15,0);
  int stop_time_bin = normal_stop.Convert();

  int num_freq_bins = 256;
  int start_freq_bin = 0;
  int stop_freq_bin = 1000;//In MHz
  int num_time_bins = 3600;//In seconds

  //declare the spectrogram to be plotted
  TH2D* signal = new TH2D("","",num_time_bins,start_time_bin,stop_time_bin,num_freq_bins,start_freq_bin,stop_freq_bin);
  signal->GetXaxis()->SetTimeDisplay(1); //turn on a time axis
  signal->GetXaxis()->SetTimeFormat("%I:%M");

  //to appropriately normalize the spectrograms, we need to know how many events there are per time bin
  //that's what these do
  TH1D* number_of_entries  = new TH1D("","",num_time_bins, start_time_bin, stop_time_bin);
  number_of_entries->GetXaxis()->SetTimeDisplay(1);

  for(int event=0;event<numEntries;event++) {//Loop over events in file

    //This line gets the RawIcrr or RawAtri Event
    chain.GetEntry(event);
    UsefulIcrrStationEvent *realIcrrEvPtr = new UsefulIcrrStationEvent(rawIcrrEvPtr, AraCalType::kLatestCalib);

    int unixtime = rawIcrrEvPtr->head.unixTime;
    time_t test_time = unixtime;
    tm *time = gmtime( &test_time );
    int year = time->tm_year+1900;
    int month = time->tm_mon+1;
    int day = time->tm_mday;
    int hour = time->tm_hour;
    int min = time->tm_min;
    int sec = time->tm_sec;

    if(realIcrrEvPtr->isCalPulserEvent() != true){//no calpulser event
	TGraph *waveform = realIcrrEvPtr->getGraphFromRFChan(0);//Get waveform from channel 0
	TGraph *spectrum = FFTtools::makePowerSpectrumMilliVoltsNanoSeconds(waveform); //get spectrum
  delete waveform;
  for(int i=0; i<spectrum->GetN(); i++){
	  double freq =0.;
	  double power = 0.;
	  spectrum->GetPoint(i,freq,power);//Get spectrum value for each frequency bin
	  signal->Fill(unixtime+18000,freq,power);//fill spectrum value for a given time and frequency
    delete spectrum;
	}
	number_of_entries->Fill(unixtime+18000);//unixtime shift
      }
      }

  for(int i=0; i<num_time_bins; i++){
    for(int j=0; j<num_freq_bins; j++){
      //adjust the signal spectrogram for the number of events per bin
      double temporary = signal->GetBinContent(i,j); //get the current value of the bin
      if(number_of_entries->GetBinContent(i) >0.) temporary/=double(number_of_entries->GetBinContent(i)); //divide by the number of entries
      else temporary =0.; //unless there was nothing in that bin, in which case, we should just put a zero there
      signal->SetBinContent(i,j,temporary); //set the bin content over again
		}
  }

  //std::cout << "here" << std::endl;
  //save it out, and label some axes
  TCanvas *canvas = new TCanvas("","",1100,850);
  signal->Draw("colz");

  signal->GetYaxis()->SetTitleOffset(1.1);
  signal->GetYaxis()->SetTitle("Frequency (MHz)");
  signal->GetYaxis()->SetLabelSize(0.03);
  signal->GetXaxis()->SetTitle("UTC Time on Jan 20");
  signal->GetXaxis()->SetLabelSize(0.03);
  signal->GetZaxis()->SetTitle("Average Power Spectrum (dB(mV^{2}/MHz))");
  signal->GetZaxis()->SetLabelSize(0.03);
  signal->GetZaxis()->SetTitleOffset(1.1);
  gPad->SetLogz();
  gStyle->SetOptStat(0);
  signal->GetYaxis()->SetTitle("Frequency (MHz)");
  /*gPad->SetLeftMargin(0.14);
  gPad->SetRightMargin(0.08);
  gPad->SetBottomMargin(0.15);
  gPad->SetTopMargin(0.10);*/
  gPad->SetLeftMargin(0.15);
  gPad->SetRightMargin(0.15);
  gPad->SetFrameLineColor(0);
  TPaletteAxis *palette = (TPaletteAxis*)signal->GetListOfFunctions()->FindObject("palette");

  // the following lines move the paletter. Choose the values you need for the position.
  palette->SetX1NDC(0.85);
  palette->SetX2NDC(0.9);
  palette->SetY1NDC(0.1);
  palette->SetY2NDC(0.9);
  gPad->Update();

  canvas->SaveAs("spectrogram.png");

  //clean up
  delete canvas;
  delete signal;
  delete number_of_entries;
  // delete palette;

}
