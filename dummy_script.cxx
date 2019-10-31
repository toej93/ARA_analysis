//Includes
#include <iostream>
#include <iomanip>
#include <sstream>
#include "Riostream.h"


//AraRoot Includes
#include "RawAtriStationEvent.h"
#include "UsefulAraStationEvent.h"
#include "UsefulAtriStationEvent.h"

//ROOT Includes
#include "TTree.h"
#include "TFile.h"
#include "TGraph.h"
#include "TH2D.h"

RawAtriStationEvent *rawAtriEvPtr;
UsefulAtriStationEvent *realAtriEvPtr;

#include "Settings.h"
#include "Event.h"
#include "Detector.h"
#include "Report.h"
#include "signal.h"

#include "AraAntennaInfo.h"
#include "AraQualCuts.h"
#include "RayTraceCorrelator.h"

#include "tools_inputParameters.h"
#include "tools_outputObjects.h"
#include "tools_runSummaryObjects.h"
#include "tools_WaveformFns.h"
#include "tools_PlottingFns.h"
#include "tools_Constants.h"
#include "tools_RecoFns.h"
#include "tools_Cuts.h"


int main (){
  vector<int> BadRunList=BuildBadRunList(3);
  cout << "Making bad runs list" << endl;

  FILE *fout = fopen("./ARA_analysis/files/badRuns_list_A3.txt", "w+");
  for(int i=0;i<BadRunList.size();i++){
    fprintf(fout,"%i\n",BadRunList[i]);
  }
  fclose(fout);

  cout << 4 % 3 << endl;
  return 0;
}
