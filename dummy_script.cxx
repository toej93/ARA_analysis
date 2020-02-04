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


#include "tools_inputParameters.h"
#include "tools_outputObjects.h"
#include "tools_runSummaryObjects.h"
#include "tools_WaveformFns.h"
#include "tools_PlottingFns.h"
#include "tools_Constants.h"
#include "tools_RecoFns.h"
#include "tools_Cuts.h"
#include "SNR_defs.h"

int main (){

  bool isThisASoftDomRun = isSoftwareDominatedRun("/users/PCON0003/cond0068/ARA/AraRoot/analysis/a23_analysis_tools", 3, 2488);
  cout << isThisASoftDomRun << endl;
  return 0;
}
