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
#include<bits/stdc++.h>


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

double GetP2P(double Earray[64]){
//int size = sizeof(Earray);
//cout << size << endl;
sort(Earray, Earray+64);
  // for(int i=0;i<64;i++){
  //   cout << Earray[i] << " ";
  // }
  double P2P = abs(Earray[0]-Earray[63]);
  return P2P;
}

//int main() {
int main(int argc, char **argv) {    // this is for manual power threshold value
  Settings *settings1 = new Settings();
  string setupfile = "./setup.txt";
  settings1->ReadFile(setupfile);
  cout<<"EXPONENT : "<<settings1->EXPONENT<<endl;
  double const ch_angle=56*(PI/180);//radians
  //double angle[7]={0,2,5,10,20,30,40};//degrees

  //signal->Initialize();
  cout<<"finish calling secondaries and signal"<<endl;
  Primaries *primary1 = new Primaries();
  cout<<"called Primaries"<<endl;
  IceModel *icemodel=new IceModel(settings1->ICE_MODEL + settings1->NOFZ*10,settings1->CONSTANTICETHICKNESS * 1000 + settings1->CONSTANTCRUST * 100 + settings1->FIXEDELEVATION * 10 + 0,settings1->MOOREBAY);// creates Antarctica ice model
  Detector *detector=new Detector(settings1, icemodel, setupfile ); // builds antenna array, 0 for testbed
  Spectra *spectra=new Spectra(settings1->EXPONENT);
  Secondaries *sec1 = new Secondaries (settings1);
  Event *event = new Event();
  Signal *signal = new Signal (settings1);
  signal->SetParameterization(0);//Eugene's
  signal->SetMedium(0);   // set medium as ice
  event = new Event ( settings1, spectra, primary1, icemodel, detector, signal, sec1, 1 );
  settings1->SHOWER_MODE = 2;
  //event->Nu_Interaction[0].emfrac=1;
  //event->Nu_Interaction[0].hadfrac=0;
//  cout << event->Nu_Interaction[0].HAD_LQ << endl;
  //event->Nu_Interaction[0].primary_shower =1;

  // event->Nu_Interaction[0].HAD_LQ=0;
  // event->Nu_Interaction[0].EM_LQ=3.66057e+20;
  printf("EMLQ:%e, HADLQ:%f\n", event->Nu_Interaction[0].EM_LQ, event->Nu_Interaction[0].HAD_LQ);
  int skip_bins;
  double E_shower = event->pnu*event->Nu_Interaction[0].emfrac;
  double atten_factor = 1. / 10000.;//* IceAttenFactor * mag * fresnel;  // assume whichray = 0, now vmmhz1m_tmp has all factors except for the detector properties (antenna gain, etc)
  double Tarray[64];
  double Earray[64];
  /*
  FILE *fout = fopen("Askaryan_angles_P2P_Alvarez2011_HAD.csv", "w+");//open file
  fprintf(fout, "angle,P2P\n");
  for (double angle=-5; angle<=5; angle+=0.1){
  double Tarray[64];
  double Earray[64];
  // double angle = 10;
  signal->GetVm_FarField_Tarray(event, settings1, ch_angle+angle*(PI/180), atten_factor, 64, Tarray, Earray, skip_bins );
  double P2P = GetP2P(Earray);
  fprintf(fout, "%0.2f,%0.2e\n",angle,P2P);
  }
  fclose(fout);
 */


  //Get waveform into file
  FILE *fout_wf = fopen("Askaryan_wform_Alvarez2011_EM_10deg.csv", "w+");//open file
  fprintf(fout_wf, "time,voltage\n");
  //Tarray[64]={0};
  //Earray[64]={0};
  signal->GetVm_FarField_Tarray(event, settings1, ch_angle+10*(PI/180), atten_factor, 64, Tarray, Earray, skip_bins );
  for(int j=0;j<64;j++){
    fprintf(fout_wf,"%0.3f,%0.3e \n",Tarray[j],Earray[j]);
  }
  // //plot the thing
  // TGraph *gr = new TGraph(64, Tarray, Earray);
  // TCanvas *cc = new TCanvas("","",800,800);
  // cout << GetP2P(Earray) << endl;
  //
  // // gr->GetXaxis()->SetRangeUser(10., 1.e3);
  // // gr->GetYaxis()->SetRangeUser(1.e-4, 1);
  // gr->Draw("AC");
  // cc->SaveAs("Askaryan_signal.png");
}
