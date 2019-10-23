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
#include <numeric>


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

//AraRoot includes
#include "RawAtriStationEvent.h"
#include "UsefulAtriStationEvent.h"
#include "Settings.h"
#include "Detector.h"
#include "Report.h"
#include "tools_PlottingFns.h"
#include "tools_RecoFns.h"
#include "tools_inputParameters.h"
#include "tools_outputObjects.h"
#include "tools_Cuts.h"
#include "tools_CommandLine.h"

using namespace std;

using namespace std;

int main(int argc, char **argv)
{ //start main
  int config = atoi(argv[1]);
  TChain chain("eventTree"); //this for the events for the exterior loop
  for(int file=2; file<argc; file++){
    TString fileKey(argv[file]); //a file key
    chain.Add(fileKey); //add files to the chain
  }

  // int channel = atof(argv[1]);
  RawAtriStationEvent *rawEvPtr=0;
  chain.SetBranchAddress("event",&rawEvPtr);
  int numEntries = chain.GetEntries();
  Int_t run_num=0;
  int stationId=0;
  chain.SetBranchAddress("run",&run_num); //set the branch address
  vector<int> BadRunList = BuildBadRunList(3);
  if(isBadRun(3, run_num, BadRunList)) return 0;
  AraEventCalibrator *calib = AraEventCalibrator::Instance(); //make a calibrator
  // double rms[20];
  vector <double> rms[16];

  cout << "Number of events is " << numEntries << endl;
  for(int event=0; event<numEntries; event++){//loop over events
    chain.GetEvent(event);
    //  if(rawEvPtr->isCalpulserEvent()==false){
    int evt_num = rawEvPtr->eventNumber;//event number
    UsefulAtriStationEvent *realAtriEvPtr_fullcalib = new UsefulAtriStationEvent(rawEvPtr, AraCalType::kLatestCalib); //make the event
    //delete rawEvPtr;

    for (int i = 0; i < 16; i++){
      TGraph* gr = realAtriEvPtr_fullcalib->getGraphFromRFChan(i);
      double rms_tmp = 0;
      double peak_tmp = 0;
      FFTtools::getPeakRmsRectified(gr, peak_tmp, rms_tmp);
      // cout << "Here" << endl;
      rms[i].push_back(rms_tmp);
      delete gr;
    }

    delete realAtriEvPtr_fullcalib;
    //  }//If no calpul
  }//end loop over events

  char filename[50];
  sprintf(filename,"rms_A3_c%i.txt", config);
  FILE * fout = std::fopen(filename, "a+");
  fprintf(fout, "%d", run_num);
  for(int ii=0;ii<16;ii++){
    double sum = std::accumulate(rms[ii].begin(), rms[ii].end(), 0.0);
    double mean = sum / rms[ii].size();

    double sq_sum = std::inner_product(rms[ii].begin(), rms[ii].end(), rms[ii].begin(), 0.0);
    double stdev = std::sqrt(sq_sum / rms[ii].size() - mean * mean);
    fprintf(fout, ",%.2f,%.2f",mean,stdev);
  }
  fprintf(fout, "\n");

  fclose(fout);

}//finish main
