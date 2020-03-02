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
  double veffT[6], vefferrT[6], aeffT[6], aefferrT[6];
  double veffF[3], vefferrF[3], aeffF[3], aefferrF[3];
  double veffNu[2], vefferrNu[2], aeffNu[2], aefferrNu[2];
  double veff, vefferr, aeff, aefferr, aeff2;
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
  for(ifile = 3; ifile < (argc - 1); ifile++){
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
  volradius = atof(argv[1]);
  voldepth = atof(argv[2]);
  AraTree2->GetEntry(0);
  pnu = event->pnu;
  cout << "Energy " << pnu << endl;
  for(int iEvt2=0; iEvt2<totnthrown; iEvt2++) {

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

    double weight = event->Nu_Interaction[0].weight;
    if(weight > 1.0){
        cout << weight << "; " << iEvt2 << endl;
        continue;
    }
    numNus+=weight;
//    cout << weight << endl;
    totweightsq += pow(weight,2);
    totweight += weight;
    typetotweight[inu+2*icurr+4*iflavor] += weight;
    typetotweightsq[inu+2*icurr+4*iflavor] += pow(weight,2);
    totsigmaweight += weight*sigm;
    totsigmaweightsq += pow(weight*sigm,2);
    /*
    int trig1 = 0;
    int trig2 = 0;
    int trig3 = 0;
    for (int i = 0; i < nstrings; i++){
        if (i == 0 && report->stations[0].strings[i].antennas[0].Trig_Pass > 0) trig1++;
        if (i > 0 && i < 5 && report->stations[0].strings[i].antennas[0].Trig_Pass > 0) trig2++;
        if (i > 4 && i < 9 && report->stations[0].strings[i].antennas[0].Trig_Pass > 0) trig3++;
    }
    if ( trig1 > 0)//phase array
        weight1 += event->Nu_Interaction[0].weight;
    if ( trig2 > 1)//lpda
        weight2 += event->Nu_Interaction[0].weight;
    if (trig3 > 3)//bicone
        weight3 += event->Nu_Interaction[0].weight;
    */

  }

  tottrigeff = totweight / double(totnthrown);
  double nnucleon = 5.54e29; //units here are 1/m^3
  double vtot = PI * double(volradius) * double(volradius) * double(voldepth) / 1e9;
  veff = vtot * totweight / double(totnthrown) * 4.0 * PI;
  //vefferr = sqrt(SQ(sqrt(double(totnthrown))/double(totnthrown))+SQ(sqrt(totweightsq)/totweight));
  vefferr = sqrt(totweightsq) / totweight * veff;
  aeff = vtot * (1e3) * nnucleon * totsigmaweight / double(totnthrown);
  // aefferr = sqrt(totweightsq) / totweight * aeff;
  double sigmaave = 0.0;

  for(int iflavor=0; iflavor<3; iflavor++) {
    double flavorweight = 0.0;
    double flavorweightsq = 0.0;
    double flavorsigmaave = 0.0;
    int flavortotthrown = 0;
    double temptotweightnu[2] = {0};
    double tempsignu[2] = {0};
    double temptotweight = 0.0;
    for(int inu=0; inu<2; inu++) {
      double tempsig = 0.0;
      double tempweight = 0.0;
      for(int icurr=0; icurr<2; icurr++) {
	tempsig += sigma[inu+2*icurr+4*iflavor];
	tempsignu[inu] += sigma[inu+2*icurr+4*iflavor];
	tempweight += typetotweight[inu+2*icurr+4*iflavor];
	flavorweight += typetotweight[inu+2*icurr+4*iflavor];
	flavorweightsq += typetotweightsq[inu+2*icurr+4*iflavor];
	temptotweight += typetotweight[inu+2*icurr+4*iflavor];
	temptotweightnu[inu] += typetotweight[inu+2*icurr+4*iflavor];
	flavortotthrown += typetotnthrown[inu+2*icurr+4*iflavor];
      }
      //printf("Temp Sigma: "); cout << tempsig << "\n";
      sigmaave += tempsig*(tempweight/totweight);
    }

    flavorsigmaave += tempsignu[0]*(temptotweightnu[0]/temptotweight)+tempsignu[1]*(temptotweightnu[1]/temptotweight);
    veffF[iflavor] = vtot*flavorweight/double(flavortotthrown);
    vefferrF[iflavor] = sqrt(flavorweightsq)/flavorweight;
    //printf("Volume: %.9f*%.9f/%.9f \n",vtot,flavorweight,double(totnthrown));
    aeffF[iflavor] = veffF[iflavor]*(1e3)*nnucleon*flavorsigmaave;
    aefferrF[iflavor] = sqrt(flavorweightsq)/flavorweight;

  }



  for(int inu=0; inu<2; inu++) {
    double tempsig = 0.0;
    double tempweight = 0.0;
    double tempweightsq = 0.0;
    int nutotthrown = 0;
    for(int iflavor=0; iflavor<3; iflavor++) {
      for(int icurr=0; icurr<2; icurr++) {
	tempweight += typetotweight[inu+2*icurr+4*iflavor];
	tempweightsq += typetotweightsq[inu+2*icurr+4*iflavor];
	nutotthrown += typetotnthrown[inu+2*icurr+4*iflavor];
      }
    }

    tempsig += sigma[inu+2*0+4*0];
    tempsig += sigma[inu+2*1+4*0];

    veffNu[inu] = vtot*tempweight/double(nutotthrown);
    vefferrNu[inu] = sqrt(tempweightsq)/tempweight;

    aeffNu[inu] = veffNu[inu]*(1e3)*nnucleon*tempsig;
    aefferrNu[inu] = sqrt(tempweightsq)/tempweight;

  }

  double totalveff = 0.0;
  double totalaeff = 0.0;
  for(int inu=0; inu<2; inu++) {
    for(int iflavor=0; iflavor<3; iflavor++) {
      int typetotthrown = 0;
      for(int icurr=0; icurr<2; icurr++) {
	typetotthrown += typetotnthrown[inu+2*icurr+4*iflavor];
      }
      totalveff += veffT[iflavor+3*inu]*(double(typetotthrown)/double(totnthrown));
      totalaeff += aeffT[iflavor+3*inu]*(double(typetotthrown)/double(totnthrown));
    }
  }
  aeff2 = veff*(1e3)*nnucleon*sigmaave;//aeff2=4pi*aeff (km^2 x sr)
  // aeff = vtot * (1e3) * nnucleon * totsigmaweight / double(totnthrown);

  aeff = aeff2;
  aefferr = sqrt(totweightsq) / totweight * aeff;

  // veff1 = weight1 / totnthrown * vtot * 4.0 * PI;
  //veff2 = weight2 / totnthrown * vtot * 4.0 * PI;
  //veff3 = weight3 / totnthrown * vtot * 4.0 * PI;
  // printf("Number of passing neutrinos is %i", numNus);
  printf("\nvolthrown: %.6f; totweight: %.6f; Veff: %.6f +- %.6f\n", vtot, totweight, veff, vefferr);
  //printf("veff1: %.3f; veff2: %.3f; veff3: %.3f\n", veff1, veff2, veff3);
  //string des = string(argv[4]);
  char buf[100];
  std::ostringstream stringStream;
  stringStream << string(argv[3]);
  std::string copyOfStr = stringStream.str();
  snprintf(buf, sizeof(buf), "./veffs/Veff_%s.txt", copyOfStr.c_str());
  FILE *fout = fopen(buf, "a+");
  fprintf(fout, "%e, %e, %e, %i, %e, %e, %e, %e \n", pnu, aeff*1E10, aefferr*1E10, totnthrown, numNus, totweight_thrown, veff, vefferr);//convert to cm^2
  //fprintf(fout, "%e, %.6f, %.6f, %i,%e,%e \n", pnu, veff, vefferr, totnthrown, numNus, totweight_thrown)
  fclose(fout);

  return 0;
}
