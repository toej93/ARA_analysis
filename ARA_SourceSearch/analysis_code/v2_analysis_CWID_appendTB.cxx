////////////////////////////////////////////////////////////////////////////////
////	v2_CWID.cxx 
////	A23 diffuse, identify CW freequency, just testbed method
////	take more care with when a baseline is "bad"
////
////	Nov 2018
////////////////////////////////////////////////////////////////////////////////

//Includes
#include <iostream>
#include <iomanip>
#include <sstream>
#include <deque>
#include <vector>

//AraRoot Includes
#include "RawAtriStationEvent.h"
#include "UsefulAtriStationEvent.h"
#include "AraGeomTool.h"
#include "AraAntennaInfo.h"
#include "AraQualCuts.h"

//ROOT Includes
#include "TTree.h"
#include "TFile.h"
#include "TGraph.h"

#include "tools_inputParameters.h"
#include "tools_WaveformFns.h"
#include "tools_PlottingFns.h"
#include "tools_RecoFns.h"
#include "tools_CW.h"
#include "tools_CommandLine.h"

RawAtriStationEvent *rawAtriEvPtr;
UsefulAtriStationEvent *realAtriEvPtr;

int main(int argc, char **argv)
{

	if(argc<8) {
		std::cout << "Usage\n" << argv[0] << " <1-simulation_flag> <2-station> <3-year/config> <4-drop_bad_chans> <5-run summary directory> <6-output directory> <7-input file> <8-pedestal file> \n";
		return -1;
	}

	char *PedDirPath(getenv("PED_DIR"));
	if (PedDirPath == NULL) std::cout << "Warning! $DATA_DIR is not set!" << endl;
	char *toolsPath(getenv("TOOLS_DIR"));
	if (toolsPath == NULL) {
		std::cout << "Warning! $TOOLS_DIR is not set!" << endl;
		return -1;
	}

	/*
	arguments
	0: exec
	1: simulation (yes/no)
	2: station num (2/3)
	3: year/ config
	4: drop bad chans
	5: run summary directory
	6: output directory
	7: input file
	8: pedestal file
	*/

	int isSimulation=atoi(argv[1]);
	int station_num=atoi(argv[2]);
	int yearConfig=atoi(argv[3]);
	int drop_bad_chans=atoi(argv[4]);

	//open the file
	TFile *fp = TFile::Open(argv[7]);
	if(!fp) {
		std::cerr << "Can't open file\n";
		return -1;
	}
	TTree *eventTree= (TTree*) fp->Get("eventTree");
	if(!eventTree) {
		std::cerr << "Can't find eventTree\n";
		return -1;
	}
	int runNum = getrunNum(argv[7]);
	int config = getConfig(station_num, runNum);

	printf("Run Number %d \n", runNum);

	AraEventCalibrator *calibrator = AraEventCalibrator::Instance();	
	if(argc==9){
		//only if they gave us a pedestal should we fire up the calibrator
		calibrator->setAtriPedFile(argv[8],station_num);
	}
	else{
		if(!isSimulation){
			char ped_file_name[400];
			sprintf(ped_file_name,"%s/run_specific_peds/A%d/all_peds/event%d_specificPeds.dat",PedDirPath,station_num,runNum);
			calibrator->setAtriPedFile(ped_file_name,station_num); //because someone had a brain (!!), this will error handle itself if the pedestal doesn't exist
		}
		calibrator->setAtriPedFile("", station_num);
	}
	AraQualCuts *qualCut = AraQualCuts::Instance(); //we also need a qual cuts tool

	if(isSimulation){
		eventTree->SetBranchAddress("UsefulAtriStationEvent", &realAtriEvPtr);
		printf("Simulation; load useful event tree straight away \n");
	}
	else{
		eventTree->SetBranchAddress("event",&rawAtriEvPtr);
		printf("Data; load raw event tree \n");
	}
  
  	Long64_t numEntries=eventTree->GetEntries();
	Long64_t starEvery=numEntries/80;
	if(starEvery==0) starEvery++;
	printf("Num events is %d \n", numEntries);
	cout<<"This file has a starEvery of "<<starEvery<<endl;
	// numEntries=100;

	//first, let's get the baselines loaded in
	string runSummaryFilename;
	if (!isSimulation){
		runSummaryFilename = getRunSummaryFilename(station_num, argv[5], argv[7]);
	}
	else {
		if(station_num==2){
			runSummaryFilename = "/fs/scratch/PAS0654/ara/sim/RunSummary/run_summary_station_2_run_20.root";
		}
		else if(station_num==3){
			runSummaryFilename = "/fs/scratch/PAS0654/ara/sim/RunSummary/run_summary_station_3_run_30.root";
		}
	}
	TFile *SummaryFile = TFile::Open(runSummaryFilename.c_str());
	if(!SummaryFile) {
		std::cerr << "Can't open summary file\n";
		return -1;
	}
	TTree* SummaryTree = (TTree*) SummaryFile->Get("BaselineTree");   
	if(!SummaryTree) {
		std::cerr << "Can't find SummaryTree\n";
		return -1;
	}
	vector <TGraph*> average;
	average.resize(16);
	stringstream ss1;
	for(int i=0; i<16; i++){
		ss1.str(""); ss1<<"baselines_RF_chan_"<<i;
		SummaryTree->SetBranchAddress(ss1.str().c_str(),&average[i]);
	}
	SummaryTree->GetEntry(0);
	vector<TGraph*> average_copy;
	for(int i=0; i<16; i++){
		average_copy.push_back((TGraph*)average[i]->Clone());
	}

	/*
		Now, we test and see if these averages are "good"/worth using
	*/
	bool baselinesGood = areBaselinesGood(average_copy,station_num,runNum);
	deleteGraphVector(average_copy); // clean this up, we don't need the copies anymore

	if(!baselinesGood){
		printf(RED"Warning! Run %d has bad baeslines, preparing for swap to averages...\n"RESET,runNum);
		char default_filename[500];
		sprintf(default_filename,"%s/data/average_baseline_station%d_config%d.root",toolsPath,station_num,config);
		TFile *DefaultFile = TFile::Open(default_filename);
		if(!DefaultFile) { std::cout << "Can't open default baseline file, and run "<<runNum<<" needs it\n"; return -1;}
		TTree* AverageBaselineTree = (TTree*) DefaultFile->Get("AverageBaselineTree");   
		if(!AverageBaselineTree) { std::cerr << "Can't find AverageBaselineTree for run "<<runNum<<" which needs it.\n"; return -1;}
		vector <TGraph*> config_averages;
		config_averages.resize(16);
		stringstream ss2;
		for(int i=0; i<16; i++){
			ss2.str(""); ss2<<"baselines_average_RF_chan_"<<i;
			AverageBaselineTree->SetBranchAddress(ss2.str().c_str(),&config_averages[i]);
		}
		AverageBaselineTree->GetEntry(0);
		for(int i=0; i<16; i++){
			delete average[i]; //delete
		}
		average.clear(); //clear this
		for(int i=0; i<16; i++){
			average.push_back((TGraph*)config_averages[i]->Clone()); //push back the new thing
		}
		// now that we've *cloned* the result, we can close up shop right away
		// and now "average" will have been replaced with the default tree, which is exactly what we wanted
		DefaultFile->Close();
		delete DefaultFile;
	}

	AraGeomTool * geomTool = new AraGeomTool();
	int nGraphs=16;

	vector<int> chan_exclusion_list;
	if(drop_bad_chans){
		if(station_num==2){
			//drop the last hpol channel
			chan_exclusion_list.push_back(15);
		}
		else if(station_num==3){
			if( 
				(!isSimulation && runNum>getA3BadRunBoundary())
				||
				(isSimulation && yearConfig>2)

			){			// drop string four
				printf("Yes, we need to drop channels!\n");
				chan_exclusion_list.push_back(3);
				chan_exclusion_list.push_back(7);
				chan_exclusion_list.push_back(11);
				chan_exclusion_list.push_back(15);
			}
		}
	}

	//now set up the outputs
	string output_location = argv[6];
	char run_file_name[400];
	sprintf(run_file_name,"%s/CWID_station_%d_run_%d.root",output_location.c_str(),station_num, runNum);
	printf("Run File Name: %s\n", run_file_name);
	TFile *outFile = TFile::Open(run_file_name,"update");
	TTree *NewCWTree = (TTree*) outFile->Get("NewCWTree");
	int numEntries_org_file = NewCWTree->GetEntries();
	if(numEntries_org_file!=numEntries){
		cout<<"Warning! Not the same number of events in both. Halt!"<<endl;
		outFile->Close();
		return -1;
	}
	vector<vector<double> > badFreqs_baseline;
	TBranch *newBranch = NewCWTree->Branch("badFreqs_baseline_TB",&badFreqs_baseline);

	printf(BLUE"About to loop over events\n"RESET);

	//now, to loop over events!
	for(Long64_t event=0;event<numEntries;event++){
		// printf("Inside CW search loop, on event %d \n", event);
		// cout<<"On event "<<event<<endl;

		badFreqs_baseline.clear();
    
		if(event%starEvery==0) { std::cerr << "*"; }
    
		eventTree->GetEntry(event); //get the event

		if (isSimulation == false){
			realAtriEvPtr = new UsefulAtriStationEvent(rawAtriEvPtr, AraCalType::kLatestCalib);
		}

		bool hasError=false;
		bool isCalPulser=false;

		if (isSimulation == false){
			hasError = !(qualCut->isGoodEvent(realAtriEvPtr));
			isCalPulser=rawAtriEvPtr->isCalpulserEvent();
			if(realAtriEvPtr->eventNumber<5){
				hasError=true;
			}
			vector<TGraph*> spareElecChanGraphs;
			spareElecChanGraphs.push_back(realAtriEvPtr->getGraphFromElecChan(6));
			spareElecChanGraphs.push_back(realAtriEvPtr->getGraphFromElecChan(14));
			spareElecChanGraphs.push_back(realAtriEvPtr->getGraphFromElecChan(22));
			spareElecChanGraphs.push_back(realAtriEvPtr->getGraphFromElecChan(30));
			bool hasBadSpareChanIssue = hasSpareChannelIssue(spareElecChanGraphs);
			deleteGraphVector(spareElecChanGraphs);
			if(hasBadSpareChanIssue){
				hasError=true;
			}
		}
		else if(isSimulation){
			hasError=false;
			isCalPulser=false;
		}

		if(!hasError && !(isCalPulser && station_num==3) ){ 

			stringstream ss;
			string xLabel, yLabel;
			xLabel = "Time (ns)"; yLabel = "Voltage (mV)";
			vector<string> titlesForGraphs;
			for (int i = 0; i < nGraphs; i++){
				ss.str("");
				ss << "Channel " << i;
				titlesForGraphs.push_back(ss.str());
			}

			vector<TGraph*> grWaveformsRaw = makeGraphsFromRF(realAtriEvPtr, 16, xLabel, yLabel, titlesForGraphs);

			//before we do the phase variance, we should check for baseline violations	
			vector<double> baseline_CW_cut_V = CWCut_TB(grWaveformsRaw, average, 0, 6., 5.5, station_num, 3, chan_exclusion_list, runNum, event,false);
			vector<double> baseline_CW_cut_H = CWCut_TB(grWaveformsRaw, average, 1, 6., 5.5, station_num, 3, chan_exclusion_list, runNum, event,false);
			
			// for(int i=0; i<baseline_CW_cut_V.size(); i++){
			// 	printf(CYAN"	V: Event %d Baseline CW Cut %.2f \n"RESET, event, baseline_CW_cut_V[i]);
			// }
			// for(int i=0; i<baseline_CW_cut_H.size(); i++){
			// 	printf(CYAN"	H: Event %d Baseline CW Cut %.2f \n"RESET, event, baseline_CW_cut_H[i]);
			// }

			badFreqs_baseline.push_back(baseline_CW_cut_V);
			badFreqs_baseline.push_back(baseline_CW_cut_H);

			deleteGraphVector(grWaveformsRaw);

		}
		newBranch->Fill();
		if(isSimulation==false){
			delete realAtriEvPtr;
		}
	}//loop over events

	outFile->Write(0,TObject::kOverwrite);
	outFile->Close();
	fp->Close();
	SummaryFile->Close();

	printf("Done! Run Number %d \n", runNum);

}//end main