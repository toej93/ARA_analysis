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
#include "TGraph.h"

//$(FFTWSYS) -llibRootFftwWrapper
//#include <fftw3.h>

//#include "FFTtools.h"

class EarthModel; //class
using namespace std;

#include "Tools.h"
#include "Constants.h"
#include "Vector.h"
#include "Position.h"
#include "EarthModel.h"
#include "IceModel.h"
#include "Efficiencies.h"
#include "Spectra.h"
#include "Event.h"
#include "Trigger.h"
#include "Detector.h"
#include "Settings.h"
#include "counting.hh"
#include "Primaries.h"
#include "signal.hh"
#include "secondaries.hh"

#include "Ray.h"
#include "RaySolver.h"
#include "Report.h"

RawAtriStationEvent *rawAtriEvPtr;
UsefulAtriStationEvent *realAtriEvPtr;

//int main() {
int main(int argc, char **argv) {    // this is for manual power threshold value
  Settings *settings1 = new Settings();
  double const ch_angle=56*(PI/180);//radians
  double angle[7]={0,1,2,3,5,7.5,10};//degrees
  Signal *signal = new Signal (settings1);
  signal->SetParameterization(0);//Eugene's
  signal->SetMedium(0);   // set medium as ice
  //signal->Initialize();
  cout<<"finish calling secondaries and signal"<<endl;
  double shower_E=1E18;
  double emfrac=0.;
  double hadfrac=1.;
  std::vector<double> freqs;
  std::vector<double> VmMHz;
  FILE *fout = fopen("Askaryan_angles.csv", "w+");//open file
  fprintf(fout, "freqs,0deg,1deg,2deg,3deg,5deg,7.5deg,10deg\n");
  for(int freq=0;freq<5000;freq++){
    double deltheta_em_max;
	  double deltheta_had_max;
    signal->GetSpread(shower_E, emfrac, hadfrac, freq*1.e6, deltheta_em_max, deltheta_had_max);
    //printf("delta_em is: %f, delta_had is: %f \n", deltheta_em_max, deltheta_had_max);
    double GetVmMHz1m_tappered[7];
    for(int i=0;i<7;i++){
      double GetVmMHz1m=signal->GetVmMHz1m(shower_E,freq*1.e6);//Convert to Hz
      signal->TaperVmMHz(ch_angle+angle[i]*(PI/180),  // viewangle in radians,
      deltheta_em_max,   //spread_EM
      deltheta_had_max,  //spread_HAD
    	emfrac,        //Fraction of EM shower
    	hadfrac,       //Fraction of HAD shower
    	GetVmMHz1m,    //Input signal
    	GetVmMHz1m_tappered[i]  //output signal
      );
    }
    fprintf(fout,"%i,%.3e,%.3e,%.3e,%.3e,%.3e,%.3e,%.3e\n",freq, GetVmMHz1m_tappered[0],
    GetVmMHz1m_tappered[1],GetVmMHz1m_tappered[2],GetVmMHz1m_tappered[3],
    GetVmMHz1m_tappered[4],GetVmMHz1m_tappered[5],GetVmMHz1m_tappered[6]);
  }
  fclose(fout);

  // //plot the thing
  // TGraph *gr = new TGraph(freqs.size(), &freqs[0], &VmMHz[0]);
  // TCanvas *cc = new TCanvas("","",800,800);
  // gr->GetXaxis()->SetRangeUser(10., 1.e3);
  // gr->GetYaxis()->SetRangeUser(1.e-4, 1);
  // gr->Draw("AC");
  // gPad->SetLogy();
  // gPad->SetLogx();
  // cc->SaveAs("Askaryan_signal.png");
}
