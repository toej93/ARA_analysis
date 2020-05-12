//Includes
#include <iostream>
#include <iomanip>
#include <sstream>

//AraRoot Includes
#include "RawIcrrStationEvent.h"
#include "RawAtriStationEvent.h"
#include "UsefulAraStationEvent.h"
#include "UsefulIcrrStationEvent.h"
#include "UsefulAtriStationEvent.h"

//ROOT Includes
#include "TTree.h"
#include "TFile.h"
#include "TGraph.h"

#include "Event.h"
#include "Detector.h"
#include "Report.h"
#include "Settings.h"

#include "AraGeomTool.h"
#include "AraQualCuts.h"
#include "AraAntennaInfo.h"
#include "RayTraceCorrelator.h"

#include "tools_inputParameters.h"
#include "tools_outputObjects.h"
#include "tools_runSummaryObjects.h"
#include "tools_WaveformFns.h"
#include "tools_PlottingFns.h"
#include "tools_Constants.h"
#include "tools_RecoFns.h"
#include "tools_filterEvent.h"
#include "tools_Cuts.h"
#include "tools_CommandLine.h"

class EarthModel; //class


RawAtriStationEvent *rawAtriEvPtr;
UsefulAtriStationEvent *realAtriEvPtr;

;


//int main() {
int main(int argc, char **argv) {    // this is for manual power threshold value

  TFile *fp = TFile::Open(argv[1],"read");
	if(!fp) {
		std::cout << "Can't open file\n";
		return -1;
	}
	TTree *eventTree;
	eventTree= (TTree*) fp->Get("eventTree");
	if(!eventTree) {
		std::cout << "Can't find eventTree\n";
		return -1;
	}

	TTree *simTree;
	TTree *simSettingsTree;
	Event *eventPtr = 0;
	Detector *detector = 0;
	Report *reportPtr = 0;

	simSettingsTree=(TTree*) fp->Get("AraTree");
	if (!simSettingsTree) {
		std::cout << "Can't find AraTree\n";
		return -1;
	}

	simSettingsTree->SetBranchAddress("detector", &detector);
	simSettingsTree->GetEntry(0);


	simTree=(TTree*) fp->Get("AraTree2");
	if (!simTree) {
		std::cout << "Can't find AraTree2\n";
		return -1;
	}
	simTree->SetBranchAddress("event", &eventPtr);
	simTree->SetBranchAddress("report", &reportPtr);
	simTree->GetEvent(0);
  double weight;
  eventTree->SetBranchAddress("UsefulAtriStationEvent", &realAtriEvPtr);
  eventTree->SetBranchAddress("weight", &weight);
  printf("Simulation; load useful event tree straight away \n");

  Long64_t numEntries=simTree->GetEntries();
  printf("Num entries is %d \n", numEntries);
	Long64_t starEvery=numEntries/80;
	if(starEvery==0) starEvery++;
  for(Long64_t event=0;event<numEntries/*700*/;event++) {//Loop over events
    eventTree->GetEntry(event);
    simTree->GetEntry(event);
    if (reportPtr->stations[0].Global_Pass <= 0 ) continue;
    // cout << event << endl;
    simTree->GetEntry(event);
    double maxPeakVfromSim = reportPtr->stations[0].max_PeakV;
    TGraph *gr_v = realAtriEvPtr->getGraphFromRFChan(0);
    // cout << maxPeakVfromSim << endl;
  }
}
