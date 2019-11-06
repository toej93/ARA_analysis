////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////	add_branch.cxx
////	Add a branch to an existing root file
////
////	Nov 2019
////  Jorge Torres
////////////////////////////////////////////////////////////////////////////////

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
#include <TSystem.h>


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

#include "RawIcrrStationEvent.h"
#include "UsefulIcrrStationEvent.h"
#include "RawAraStationEvent.h"
#include "RawAtriStationEvent.h"
#include "UsefulAtriStationEvent.h"
#include "AraEventCalibrator.h"
#include "AraGeomTool.h"
#include "FFTtools.h"
#include "AraStationInfo.h"
#include "TPaletteAxis.h"
#include "AraQualCuts.h"
#include "tools_PlottingFns.h"
#include "tools_RecoFns.h"
#include "tools_inputParameters.h"
#include "tools_outputObjects.h"
#include "tools_Cuts.h"
#include "tools_WaveformFns.h"

TStyle* RootStyle();

using namespace std;

int main(int argc, char **argv){

	if(argc<3){
		cout<< "Usage\n" << argv[0] << " <1-station> <2-config> <3-ValForCuts filename 1...> <4-ValForCuts filename 2... >"<<endl;;
		return -1;
	}
	int station = atoi(argv[1]);
	int config = atoi(argv[2]);
	bool drop_chan=false;
	if(config>2) drop_chan=true;

	for(int file_num=3; file_num<argc; file_num++){

		if(gSystem->AccessPathName(argv[file_num])){
			std::cout << "file does not exist" << std::endl;
			return -1;
		}

		string chRun = "run";
		string file = string(argv[file_num]);
		size_t foundRun = file.find(chRun);
		string strRunNum = file.substr(foundRun+4,4);
		int runNum_in = atoi(strRunNum.c_str());
		printf("On file %d, run number %d \n", file_num-2, runNum_in);

		// TFile *testFile = TFile::Open(argv[file_num]);
  	// if(!testFile) {
  	// 	std::cout << "Can't open file\n";
  	// 	return -1;
  	// }
		// delete testFile;

		TFile *f = new TFile(argv[file_num],"update");
		TTree *T = (TTree*)f->Get("AllTree");
		bool isSpikey;
		bool isCliff;

		int eventNumber;
		T->SetBranchAddress("eventNumber",&eventNumber);
		cout << "Here" << endl;

		TBranch *isSpikeyBranch = T->Branch("isSpikey",&isSpikey);
		TBranch *isCliffBranch = T->Branch("isCliff",&isCliff);

    char dataFName[70];
    sprintf(dataFName,"/fs/project/PAS0654/ARA_DATA/A23/10pct/RawData/A3/all_runs/event%i.root",runNum_in);
    TFile *fp = TFile::Open(dataFName);
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
    RawAtriStationEvent *rawEvPtr=0;
    eventTree->SetBranchAddress("event",&rawEvPtr);
    AraQualCuts *qualCut = AraQualCuts::Instance();
    AraEventCalibrator *calib = AraEventCalibrator::Instance(); //make a calibrator
    // if(isBadRun(3, runNum_in, BadRunList)) continue;
  	// if(isSoftwareDominatedRun("/users/PCON0003/cond0068/ARA/AraRoot/analysis/a23_analysis_tools", 3, runNum_in)) continue;
		int numEntries = T->GetEntries();
		cout << "Number of events is " << numEntries << endl;

		for(int event=0; event<numEntries; event++){
			isSpikey=false;
			isCliff=false;
			eventTree->GetEvent(event);
			T->GetEvent(event);
	    //if(rawEvPtr->isCalpulserEvent()==false){
	    int evt_num = rawEvPtr->eventNumber;//event number
			// cout << evt_num << endl;
			// cout << eventNumber << endl;
			UsefulAtriStationEvent *realAtriEvPtr_fullcalib = new UsefulAtriStationEvent(rawEvPtr, AraCalType::kLatestCalib); //make the event
			vector<TGraph*> graphs;
			for (int i = 0; i < 16; i++){
				TGraph* gr = realAtriEvPtr_fullcalib->getGraphFromRFChan(i);
				graphs.push_back(gr);
			}
			delete realAtriEvPtr_fullcalib;
			//isSpikeyStringEvent(3,0,graphs,2);
			if(isCliffEvent(graphs)) isCliff=true;
			if(isSpikeyStringEvent(station,drop_chan,graphs,config)) isSpikey=true;

			for (int i=0; i < graphs.size(); i++){
				delete graphs[i];
			}
			graphs.clear();

			isSpikeyBranch->Fill();
			isCliffBranch->Fill();
		}
		f->cd();
		T->Write(0,TObject::kOverwrite);
		delete f;
		delete fp;
	}
}
