#include <iostream>
#include <cstdlib>
#include <sstream>
#include <stdio.h>
#include <vector>
#include <complex>
#include <algorithm>

#include "TGraph.h"
#include "tools_Cuts.h"

using namespace std;

bool IsGoodForCalib(int station, int year, int runNum){

  //this function is from tools_Cuts (https://github.com/clark2668/a23_analysis_tools/blob/master/tools_Cuts.h)
  //so you'll need to download and #include that


  //we need to open the CW file

  char summary_file_name[400];
  sprintf(summary_file_name,"/fs/scratch/PAS0654/ara/10pct/CWID/A%d/%d/CWID_station_%d_run_%d.root",station,year,station,runNum);
  TFile *NewCWFile = TFile::Open(summary_file_name);
  if(!NewCWFile) {
    std::cerr << "Can't open new CW file\n";
    return -1;
  }
  TTree* NewCWTree = (TTree*) NewCWFile->Get("NewCWTree");   
  if(!NewCWTree) {
    std::cerr << "Can't find NewCWTree\n";
    return -1;
  }
  vector<vector<double> > *badFreqs_fwd =0;
  vector<vector<double> > *badFreqs_back=0;
  vector<vector<double> > *badSigmas_fwd=0;
  vector<vector<double> > *badSigmas_back=0;
  vector<vector<double> > *badFreqs_baseline=0;

  // inside, there are five trees
  // 2 x bad frequencies identified with the Carl's phase variance (forward and backwards running)
  // 2 x how bad they are (the sigmas)
  // 1 x bad frequencies identified with Eugene's "baseline violation" technique from Testbed

  NewCWTree->SetBranchAddress("badFreqs_fwd",&badFreqs_fwd);
  NewCWTree->SetBranchAddress("badSigmas_fwd",&badSigmas_fwd);
  NewCWTree->SetBranchAddress("badFreqs_back",&badFreqs_back);
  NewCWTree->SetBranchAddress("badSigmas_back",&badSigmas_back);
  NewCWTree->SetBranchAddress("badFreqs_baseline",&badFreqs_baseline);

  int numEntries = NewCWTree->GetEntries();
  Long64_t starEvery=numEntries/200;
  if(starEvery==0) starEvery++;

  //now to loop over events
  for(int event=0; event<numEntries; event++){

    //this function is from tools_Cuts (https://github.com/clark2668/a23_analysis_tools/blob/master/tools_Cuts.h)
    //so you'll need to download and #include that
    
    if(isBadEvent(station, year, runNum, event)){
      //     cout << "Is bad event!!!!" << endl;
      continue;
    }
    //    cout << "Is good event!!!!" << endl;

    NewCWTree->GetEntry(event);

    bool isCutonCW_fwd[2]; isCutonCW_fwd[0]=false; isCutonCW_fwd[1]=false;
    bool isCutonCW_back[2]; isCutonCW_back[0]=false; isCutonCW_back[1]=false;
    bool isCutonCW_baseline[2]; isCutonCW_baseline[0]=false; isCutonCW_baseline[1]=false;
			
    //first, check the baseline technique
    for(int pol=0; pol<badFreqs_baseline->size(); pol++){
      vector<double> badFreqListLocal_baseline = badFreqs_baseline->at(pol);
      if(badFreqListLocal_baseline.size()>0) isCutonCW_baseline[pol]=true;
    }

    //second, check the "forward" looking phase variance list
    double threshCW = 1.0;
    vector<double> badFreqList_fwd;
    vector<double> badSigmaList_fwd;
    for(int pol=0; pol<badFreqs_fwd->size(); pol++){
      badFreqList_fwd=badFreqs_fwd->at(pol);
      badSigmaList_fwd=badSigmas_fwd->at(pol);
      for(int iCW=0; iCW<badFreqList_fwd.size(); iCW++){
	if(
	   badSigmaList_fwd[iCW] > threshCW 
	   && 
	   abs(300. - badFreqList_fwd[iCW]) > 2.
	   &&
	   abs(500. - badFreqList_fwd[iCW]) > 2.
	   &&
	   abs(125. - badFreqList_fwd[iCW]) > 2.
	   ){
	  isCutonCW_fwd[pol] = true;
	}
      }
    }

    //third (and finally), check the "backwards" looking phase variance list
    vector<double> badFreqList_back;
    vector<double> badSigmaList_back;
    for(int pol=0; pol<badFreqs_back->size(); pol++){
      badFreqList_back=badFreqs_back->at(pol);
      badSigmaList_back=badSigmas_back->at(pol);
      for(int iCW=0; iCW<badFreqList_back.size(); iCW++){
	if(
	   badSigmaList_back[iCW] > threshCW 
	   && 
	   abs(300. - badFreqList_back[iCW]) > 2.
	   &&
	   abs(500. - badFreqList_back[iCW]) > 2.
	   &&
	   abs(125. - badFreqList_back[iCW]) > 2.
	   ){
	  isCutonCW_back[pol] = true;
	}
      }
    }
    badFreqs_fwd->clear();
    badFreqs_back->clear();
    badSigmas_fwd->clear();
    badSigmas_back->clear();
    badFreqs_baseline->clear();
    NewCWFile->Close();
    delete NewCWFile;
    for(int pol=0; pol<2; pol++){
      //   cout << "got here!!!!" << endl;
      //if it's not contaminated by *any* CW, do whatever you want
      //    if(isCutonCW_fwd[pol]==false && isCutonCW_back[pol]==false && isCutonCW_baseline[pol]==false){
      if(/*!isCutonCW_fwd[pol] && !isCutonCW_back[pol] && */!isCutonCW_baseline[pol]){
	//	cout << "Is good event!!!!" << endl;
	
	return true;
      }
      else{
	//	cout << "Is bad event!!!!" << endl;
	return false;
      }
			
    } //cal pulser
		
  } //loop over events
 
}

Double_t get3rdPeakSqVal(double *vsquared) //get 3rd highest v^2
{
  vector <double> peakVal;
  for(int i = 0; i<16; i++){
    peakVal.push_back(vsquared[i]);
  }
  std::nth_element(peakVal.begin(), peakVal.begin()+2, peakVal.end(), std::greater<int>());
  return peakVal[2];
}


int getPeakBin(TGraph *gr) 
{
  double x,y;
  gr->GetPoint(0,x,y);
  double peakVal=y;
  int peakBin=0;
  for(int i=1;i<gr->GetN();i++) {
    gr->GetPoint(i,x,y);
    if(peakVal<y) {
      peakVal=y;
      peakBin=i;
    }      
  }
  return peakBin;
}

double getPeak(TGraph *gr)
{
  double x,y;
  gr->GetPoint(0,x,y);
  double peakVal=y*y;
  int peakBin=0;
  for(int i=1;i<gr->GetN();i++) {
    gr->GetPoint(i,x,y);
    if( peakVal<(y*y) ) {
      peakVal=(y*y);
      peakBin=i;
    }      
  }
  //return peakBin;
  return peakVal;
}


Double_t get3rdPeakSqValSamePol(double *vsquared) //get 3rd highest v^2 for the same polarization
{
  vector <double> peakValVpol;
  vector <double> peakValHpol;
  for(int i = 0; i<8; i++){
    peakValVpol.push_back(vsquared[i]);
  }
  
  for(int i = 8; i<15; i++){
    peakValHpol.push_back(vsquared[i]);
  }
  std::nth_element(peakValVpol.begin(), peakValVpol.begin()+2, peakValVpol.end(), std::greater<int>());
  std::nth_element(peakValHpol.begin(), peakValHpol.begin()+2, peakValHpol.end(), std::greater<int>());
  if(peakValHpol[2]>peakValVpol[2]){
    return peakValHpol[2];
  }
  else return peakValVpol[2];
}

TGraph *makeSummedVsquaredWForm(TGraph *grWave) {
 
  double *volts = grWave->GetY();
  double *time = grWave->GetX();
  int length=grWave->GetN();
  vector <double> integral;
  for(int i=0; i<=length; i++){
    double sum=0;
    for(int j=i; j<=i+20; j++){//loop over 10 ns. dt=0.5, then need 20 bins
      sum+=volts[j]*volts[j];
    }//loop over 10 ns
    
    if(i>length-20)
      {
	integral.push_back(0);
	  }
    else{
      integral.push_back(sum);
    }
    
  }//loop over number of bins
 
  TGraph *grInvInv = new TGraph(length,time,&integral[0]);
  //     for(int i=0;i<length;i++) {
  //      cout << oldX[i] << "\t" << invInvSpectrum[i] << endl;
  //     }
  return grInvInv;
 
}
