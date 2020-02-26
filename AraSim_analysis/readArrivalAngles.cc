/////////////////////////////////////
//To calculate various veff and aeff
//Run as ./veff_aeff2 $RADIUS $DEPTH $FILE
//For example ./veff_aeff2 8000 3000 /data/user/ypan/bin/AraSim/trunk/outputs/AraOut.setup_single_station_2_energy_20.run0.root
//
/////////////////////////////////////


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
//#include "TObject.h"
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

using namespace std;
class EarthModel;

int main(int argc, char **argv){
  //string readfile;
  //readfile = string(argv[1]);
  //readfile = "/data/user/ypan/bin/AraSim/branches/new_geom/outputs/AraOut20.0.root";

  int ifile = 0;
  double totweightsq;
  double totweight;
  double totweight_thrown=0;

  int totnthrown;
  int typetotnthrown[12];
  double tottrigeff;
  double sigma[12];
  double typetotweight[12];
  double typetotweightsq[12];
  double totsigmaweight;
  double totsigmaweightsq;
  double volradius;
  double voldepth;
  const int nstrings = 9;
  const int nantennas = 1;
  double veff1 = 0.0;
  double veff2 = 0.0;
  double veff3 = 0.0;
  double weight1 = 0.0;
  double weight2 = 0.0;
  double weight3 = 0.0;
  double pnu;
  double numNus; //Number of passing neutrinos

  Detector *detector = 0;
  //Settings *settings = 0;
  //IceModel *icemodel = 0;
  Event *event = 0;
  Report *report = 0;
  cout<<"construct detector"<<endl;

  //TFile *AraFile=new TFile(readfile.c_str());
  //TFile *AraFile=new TFile((outputdir+"/AraOut.root").c_str());
  TChain *AraTree = new TChain("AraTree");
  TChain *AraTree2 = new TChain("AraTree2");
  TChain *eventTree = new TChain("eventTree");
  //AraTree->SetBranchAddress("detector",&detector);
  //AraTree->SetBranchAddress("settings",&settings);
  //AraTree->SetBranchAddress("icemodel",&icemodel);
  cout << "trees set" << endl;
  for(ifile = 0; ifile < (argc - 1); ifile++){
    AraTree->Add(string(argv[ifile + 1]).c_str());
    AraTree2->Add(string(argv[ifile + 1]).c_str());
    eventTree->Add(string(argv[ifile + 1]).c_str());
  }
  AraTree2->SetBranchAddress("event",&event);
  AraTree2->SetBranchAddress("report",&report);
  cout<<"branch detector"<<endl;

  for(int i=0; i<12; i++) {
    typetotweight[i] = 0.0;
    typetotweightsq[i] = 0.0;
    typetotnthrown[i] = 0;
  }

  totweightsq = 0.0;
  totweight = 0.0;
  totsigmaweight = 0.0;
  totsigmaweightsq = 0.0;
  totnthrown = AraTree2->GetEntries();
  cout << "Total number of events: " << totnthrown << endl;
  //totnthrown = settings->NNU;
  //volradius = settings->POSNU_RADIUS;
  AraTree2->GetEntry(0);
  pnu = event->pnu;
  cout << "Energy " << pnu << endl;
  char fileName[50];
  sprintf(fileName, "./outputs/arrivalAngles_%0.1f.root",log10(pnu));
  TFile *hfile = new TFile(fileName,"RECREATE","arrivalAngles");
  char treeName[50];
  int pnu_int = (int) 2*log10(pnu);
  sprintf(treeName, "arrivalAngles_%i_tree",pnu_int);
  TTree *tree = new TTree(treeName,treeName);
  double theta;
  double weight;
  TBranch *theta_arrival = tree->Branch ("theta",&theta);
  TBranch *weight_arrival = tree->Branch ("weight",&weight);

  for(int iEvt2=0; iEvt2<totnthrown; iEvt2++) {//loop over events

    AraTree2->GetEntry(iEvt2);

    double sigm = event->Nu_Interaction[0].sigma;
    int iflavor = (event->nuflavorint)-1;
    int inu = event->nu_nubar;
    int icurr = event->Nu_Interaction[0].currentint;
    totweight_thrown+=event->Nu_Interaction[0].weight;
    sigma[inu+2*icurr+4*iflavor] = sigm;
    typetotnthrown[inu+2*icurr+4*iflavor]++;

    if( (iEvt2 % 10000 ) == 0 ) cout << "*";
    if(report->stations[0].Global_Pass<=0) continue;
    double rec_angle_avg = 0;
    for ( int chID=0; chID<4; chID++) {
      rec_angle_avg+=report->stations[0].strings[1].antennas[chID].rec_ang[0];
    }
    rec_angle_avg/=4;//Average over number of channels
    theta=rec_angle_avg;
    weight = event->Nu_Interaction[0].weight;
    tree->Fill();
  }//loop over events
  hfile->Write();
  return 0;
}
