//C++
#include <algorithm>
#include <iostream>
#include <fstream>
#include <sstream>
#include <math.h>
#include <sys/stat.h>

//ROOT Includes
#include "TTree.h"
#include "TFile.h"
#include "TH2D.h"
#include "TCanvas.h"
#include "TStyle.h"
#include "TF1.h"
#include "TLegend.h"
#include "TRandom3.h"
#include "TChain.h"
#include "TFitResult.h"
//#include "TTMatrixDSym.h"

// analysis custom
#include "tools_Cuts.h"
#include "tools_Stats.h"
#include "tools_CommandLine.h"
#include "tools_outputObjects.h"

using namespace std;

int main(int argc, char **argv)
{
  double s_up_normal;
  double s_up_TMath;
  double achieved_alpha;
  double back_estimate;
  char title[300];
  sprintf(title, "/users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/ARA_analysis/ARA_SourceSearch/analysis_code/debug/Sup.txt");
  FILE *fout = fopen(title, "w+");//open file
  fprintf(fout,"bkg,Sup_normal,Sup_TMath\n");
  for(back_estimate=0.00001;back_estimate<2;back_estimate+=0.001){
    // cout << back_estimate << endl;
    s_up_TMath = GetS_up_TMath(back_estimate,achieved_alpha, 0.9); // compute S_up for this background
    s_up_normal = GetS_up(back_estimate,achieved_alpha, 0.9); // compute S_up for this backgroun
    fprintf(fout, "%f,%f,%f\n",back_estimate,s_up_normal,s_up_TMath);
  }
  fclose(fout);

}
