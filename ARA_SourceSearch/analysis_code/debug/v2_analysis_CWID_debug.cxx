////////////////////////////////////////////////////////////////////////////////
////	v2_CWID_debug.cxx 
////	A23 diffuse, identify CW frequency
////
////	Apr 2021
////////////////////////////////////////////////////////////////////////////////

// ./v2_analysis_CWID_debug 0 2 1 2014 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/RunSummary/A2/2014 ./debug /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0312/run003226/event003226.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003225.dat


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
//#include "tools_Cuts.h"
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
			runSummaryFilename = "/fs/project/PAS0654/ARA_DATA/A23/sim_SourceSearch/A2/RunSummary/run_summary_station_2_run_20.root";
		}
		else if(station_num==3){
			runSummaryFilename = "/fs/project/PAS0654/ARA_DATA/A23/sim_SourceSearch/A3/RunSummary/run_summary_station_3_run_30.root";
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
	TFile *outFile = TFile::Open(run_file_name,"RECREATE");
	TTree *NewCWTree = new TTree("NewCWTree","NewCWTree");
	vector<vector<double> > badFreqs_fwd;
	vector<vector<double> > badFreqs_back;
	vector<vector<double> > badSigmas_fwd;
	vector<vector<double> > badSigmas_back;
	vector<vector<double> > badFreqs_baseline;
	NewCWTree->Branch("badFreqs_fwd",&badFreqs_fwd);
	NewCWTree->Branch("badSigmas_fwd",&badSigmas_fwd);
	NewCWTree->Branch("badFreqs_back",&badFreqs_back);
	NewCWTree->Branch("badSigmas_back",&badSigmas_back);
	NewCWTree->Branch("badFreqs_baseline",&badFreqs_baseline);

	/*
	In this re-factorization, we want to do all the event FFT's up front
	and write them to a local ROOT file which we can delete later
	This way we dont' have to constantly re-do the FFT's
	*/

	printf(BLUE"About to make FFTs\n"RESET);

	char del_me_file_name[400];
	sprintf(del_me_file_name,"%s/delme_run%d.root",output_location.c_str(),runNum);
	TFile *tempFile = TFile::Open(del_me_file_name,"RECREATE");
	tempFile->cd();
	TTree *tempTree = new TTree("tempTree","tempTree");
	bool hasError=0;
	bool isCalPulser=0;
	tempTree->Branch("hasError",&hasError);
	tempTree->Branch("isCalPulser", &isCalPulser);
	vector<TGraph*> temp_phs;
	temp_phs.resize(16);
	stringstream ss;
	for(int i=0; i<16; i++){
		ss.str(""); ss<<"temp_phs_"<<i;
		tempTree->Branch(ss.str().c_str(),&temp_phs[i]);
	}
	for(int event=0; event<numEntries; event++){
		// printf("Inside FFT loop on event %d \n", event);
		eventTree->GetEntry(event);
		if (isSimulation == false){
			realAtriEvPtr = new UsefulAtriStationEvent(rawAtriEvPtr, AraCalType::kLatestCalib);
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
		if(hasError){
			//if it has a digitizer error, just push back junk
			for(int i=0; i<16; i++){
				temp_phs[i] = new TGraph();
			}
		}
		else{
			//otherwise, interpolate, pad, and get the phase
			vector<TGraph*> grWaveformsInt = makeInterpolatedGraphs(grWaveformsRaw, interpolationTimeStep, xLabel, yLabel, titlesForGraphs);
			vector<TGraph*> grWaveformsPadded = makePaddedGraphs(grWaveformsInt, 0, xLabel, yLabel, titlesForGraphs);
			for(int chan=0; chan<16; chan++){
				temp_phs[chan] = getFFTPhase(grWaveformsPadded[chan],120.,1000.);
			}
			deleteGraphVector(grWaveformsInt);
			deleteGraphVector(grWaveformsPadded);
		}
		tempTree->Fill(); //fill the tree
		deleteGraphVector(grWaveformsRaw);
		for(int i=0; i<16; i++) delete temp_phs[i];
		if(!isSimulation) delete realAtriEvPtr;
	}
	tempFile->Write();
	printf(GREEN"Done making FFTs.\n"RESET);

	temp_phs.clear();
	temp_phs.resize(16);

	printf(BLUE"About to loop over events\n"RESET);

	//now, to loop over events!
	for(Long64_t event=0;event<numEntries;event++){
		// printf("Inside CW search loop, on event %d \n", event);
		// cout<<"On event "<<event<<endl;

		badFreqs_fwd.clear();
		badSigmas_fwd.clear();
		badFreqs_back.clear();
		badSigmas_back.clear();
		badFreqs_baseline.clear();
    
		if(event%starEvery==0) { std::cerr << "*"; }
    
		eventTree->GetEntry(event); //get the event

		if (isSimulation == false){
			realAtriEvPtr = new UsefulAtriStationEvent(rawAtriEvPtr, AraCalType::kLatestCalib);
		}

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
		tempTree->GetEntry(event);

		// TCanvas *cDump = new TCanvas("","",4*850,4*850);
		// cDump->Divide(4,4);
		// for(int i=0; i<16; i++){
		// 	cDump->cd(i+1);
		// 	grWaveformsRaw[i]->Draw("ALP");
		// }
		// char dump_title[400];
		// sprintf(dump_title,"/users/PAS0654/osu0673/A23_analysis_new2/results/trouble_events/run%d_event%d.png",runNum, event);
		// cDump->SaveAs(dump_title);
		// delete cDump;
	
		// if(!hasError){
		// for station 3, skip cal pulsers
		// so only proceed if it doen't have an error
		// and if it's not (A3 and a cal pulser)
		// this is done for backwards compatibility with A2, which did not exclude cal pulsers
		// from phase variance search
		if(!hasError && !(isCalPulser && station_num==3) ){ 

			//before we do the phase variance, we should check for baseline violations	
			vector<double> baseline_CW_cut_V = CWCut_TB(grWaveformsRaw, average, 0, 6., 5.5, station_num, 3, chan_exclusion_list, runNum, event,false);
			vector<double> baseline_CW_cut_H = CWCut_TB(grWaveformsRaw, average, 1, 6., 5.5, station_num, 3, chan_exclusion_list, runNum, event,false);
			
			//for(int i=0; i<baseline_CW_cut_V.size(); i++){
			// 	printf(CYAN"	V: Event %d Baseline CW Cut %.2f \n"RESET, event, baseline_CW_cut_V[i]);
			// }
			// for(int i=0; i<baseline_CW_cut_H.size(); i++){
			// 	printf(CYAN"	H: Event %d Baseline CW Cut %.2f \n"RESET, event, baseline_CW_cut_H[i]);
			// }

			badFreqs_baseline.push_back(baseline_CW_cut_V);
			badFreqs_baseline.push_back(baseline_CW_cut_H);

			const int numPols = 2; //how many polarization do we want to think about
			const int numEventsForPhaseVariance = 15; //how many events do we need for the phase variance technique?
			const int numPairs = 28; // N(N-1)/2 unique pairs

			int numPairs_pol[2];

			if(drop_bad_chans){
				if(station_num==2){
					numPairs_pol[0]=numPairs;
					numPairs_pol[1]=21; // drop channel 15, only 21 pairs left
				}
				else if(station_num==3){
					if( 
						(!isSimulation && runNum>getA3BadRunBoundary())
						||
						(isSimulation && yearConfig>2)

					){  // drop string four (two channels per polarization)
						// only 15 pairs left
						numPairs_pol[0]=15;
						numPairs_pol[1]=15;
					}
					else{
						// drop no channels, keep them all
						numPairs_pol[0]=numPairs;
						numPairs_pol[1]=numPairs;
					}
				}
			}
			else{
				numPairs_pol[0]=numPairs;
				numPairs_pol[1]=numPairs;
			}

			/*
				So, when we want to drop channels, we need to change the number of pairs we will scan over with getPhaseVariance
				E.g., reduce to 21 pairs 
				But the only iterator we have is the global pair iterator, which runs from 0->28
				So, we make the size of the container 21 (or whatever)
				And just skip the global iterator pair when we find a pair we don't want
				That's the pair_in_use variable below, instead of using pairIndex directly
			*/


			vector<vector<deque<TGraph*> > > vvdGrPhaseDiff_fwd;
			vector<vector<deque<TGraph*> > > vvdGrPhaseDiff_back;
			vvdGrPhaseDiff_fwd.resize(numPols); //need an entry per polarization
			vvdGrPhaseDiff_back.resize(numPols); //need an entry per polarization
			for (int i = 0 ; i < numPols; i++){
				vvdGrPhaseDiff_fwd[i].resize(numPairs_pol[i]); //and for the number of pairs in that polarization
				vvdGrPhaseDiff_back[i].resize(numPairs_pol[i]); //and for the number of pairs in that polarization
			}

			//forward case
			//assume the initial event is the "0th" entry, and try to go forward
			//if there aren't enough good events ahead of us (no errors) to do the forward case,
			//then we declare it a failure and leave the vector of bad freqs and such empty!

			vector<vector<TGraph*> > phases_forward;
			vector <TGraph*> first_event_in_sequence_phases_forward;
			for(int chan=0; chan<16; chan++){
				first_event_in_sequence_phases_forward.push_back((TGraph*) temp_phs[chan]->Clone());
			}
			phases_forward.push_back(first_event_in_sequence_phases_forward);

			//okay, now we need to try and move forward
			int found_events_forward=0;
			for(int event_next=event+1; event_next<numEntries;event_next++){
				// printf("			Trying to move forwards to event %d \n",event_next);
				// printf("			I've found %d good events \n",found_events_forward);
				if(found_events_forward==14) break; //after you've collected 15 events (0->14), we're good to go.
				tempTree->GetEntry(event_next);
				// if(!hasError){
				if(!hasError && !(isCalPulser && station_num==3)){ // try also with excluding cal pulsers when we can
					found_events_forward++;
					vector<TGraph*> this_event_phases;
					for(int chan=0; chan<16; chan++){
						this_event_phases.push_back((TGraph*) temp_phs[chan]->Clone());
					}
					phases_forward.push_back(this_event_phases);
				}
			}
			//if we have enough events to conduct the CW check
			if(found_events_forward==14){
				// printf("	We have sufficient number of events to do phase variance calculation in forward direction by event %d \n",event);
				int chan1, chan2;
				for(int use_event=0; use_event<15; use_event++){ //loop over the events that we stored
					for(int pol=0; pol<numPols; pol++){ //loop over polarizations
						int pair_in_use=0;
						for(int pairIndex = 0; pairIndex < numPairs; pairIndex++){ //loop over pairs for that event and polarization
							// cout<<"Working on global pair index "<<pairIndex<<endl;
							getChansfromPair(geomTool,station_num,pol,pairIndex,chan1,chan2); //get chan numbers for this pair and pol
							//now, make sure the fetch didn't fail, and that neither pair is in the "channel exclusion" list
							// printf("pairIndex %2d: Chan %2d, %2d \n", pairIndex, chan1,chan2);
							if(
								(std::find(chan_exclusion_list.begin(), chan_exclusion_list.end(), chan1) != chan_exclusion_list.end())
								||
								(std::find(chan_exclusion_list.begin(), chan_exclusion_list.end(), chan2) != chan_exclusion_list.end())
							){
								// if this global pair number contains a bad channel, we should skip it
								// cout<<"		Skipping global pair "<<pairIndex<<" which has channels "<<chan1<<" and "<<chan2<<endl;
								continue;
							}

							if (chan1 != -1
								&&
								chan2 != -1
								){
									vvdGrPhaseDiff_fwd[pol][pair_in_use].push_back(getPhaseDifference(phases_forward[use_event][chan1], phases_forward[use_event][chan2]));
									pair_in_use++;
							}
						}
					}
				}

				// TCanvas *cDump2 = new TCanvas("","",4*850, 4*850);
				// cDump2->Divide(4,4);
				// for(int i=0; i<15; i++){
				// 	cDump2->cd(i+1);
				// 	vvdGrPhaseDiff_fwd[0][0][i]->Draw("ALP");
				// }
				// sprintf(dump_title,"/users/PAS0654/osu0673/A23_analysis_new2/results/trouble_events/run%d_event%d_phase_differences.png",runNum, event);
				// cDump2->SaveAs(dump_title);
				// delete cDump2;

				//printf("	Got phase difference; on to phase variance\n");
				vector<TGraph*> vGrSigmaVarianceAverage_fwd;
				vGrSigmaVarianceAverage_fwd.resize(numPols);
				for(int pol=0; pol<numPols; pol++){
					vGrSigmaVarianceAverage_fwd[pol] = getPhaseVariance(vvdGrPhaseDiff_fwd[pol], runNum, event, pol, false);
					vector<double> badFreqs_temp;
					vector<double> badSigmas_temp;
					double threshold = 1.0;
					getPeaksAboveThreshold(vGrSigmaVarianceAverage_fwd[pol], threshold, badFreqs_temp, badSigmas_temp);
					badFreqs_fwd.push_back(badFreqs_temp);
					badSigmas_fwd.push_back(badSigmas_temp);
					for(int i=0; i<badFreqs_temp.size(); i++){
						// cout<<"Forward event "<<event<<" :: pol " <<pol<<" :: freq "<<badFreqs_temp[i]<<", sigma "<<badSigmas_temp[i]<<endl;
					}
					delete vGrSigmaVarianceAverage_fwd[pol];
				}
				for(int use_event=0; use_event<15; use_event++){
					for(int pol=0; pol<numPols; pol++){
						for(int pairIndex=0; pairIndex<numPairs_pol[pol]; pairIndex++){
							delete vvdGrPhaseDiff_fwd[pol][pairIndex][use_event];
						}
					}
				}
			}
			for(int use_event=0; use_event<phases_forward.size();use_event++){
				for(int chan=0; chan<16; chan++){
					delete phases_forward[use_event][chan];
				}
			}
			// continue;

			//reverse case
			//assume the initial event is the "15th" entry, and try to go backwards
			//if there aren't enough good events ahead of us (no errors) to do the forward case,
			//then we declare it a failure and leave the vector of bad freqs and such empty!

			tempTree->GetEntry(event);

			vector<vector<TGraph*> > phases_backward;
			vector <TGraph*> first_event_in_sequence_phases_backwards;
			for(int chan=0; chan<16; chan++){
				first_event_in_sequence_phases_backwards.push_back((TGraph*) temp_phs[chan]->Clone());
			}
			phases_backward.push_back(first_event_in_sequence_phases_backwards);
			//okay, now we need to try and move backwards
			int found_events_backwards=14;
			for(int event_next=event-1; event_next>=0;event_next--){
				// printf("			Trying to move backwards to event %d \n",event_next);
				if(found_events_backwards==0) break;
				tempTree->GetEntry(event_next);
				// if(!hasError){
				if(!hasError && !(isCalPulser && station_num==3)){ // try also with excluding cal pulsers when we can
					found_events_backwards--;
					vector<TGraph*> this_event_phases;
					for(int chan=0; chan<16; chan++){
						this_event_phases.push_back((TGraph*) temp_phs[chan]->Clone());
					}
					phases_backward.push_back(this_event_phases);
				}
			}
			//if we have enough events to conduct the CW check
			if(found_events_backwards==0){
				// printf("	We have sufficient number of events to do phase variance calculation in backward direction by event %d \n",event);
				int chan1, chan2;
				for(int use_event=0; use_event<15; use_event++){ //loop over the events that we stored
					for(int pol=0; pol<numPols; pol++){ //loop over polarizations
						int pair_in_use=0;
						for(int pairIndex = 0; pairIndex < numPairs; pairIndex++){ //loop over pairs for that event and polarization
							// cout<<"Working on global pair index "<<pairIndex<<endl;
							getChansfromPair(geomTool,station_num,pol,pairIndex,chan1,chan2); //get chan numbers for this pair and pol
							// printf("pairIndex %2d: Chan %2d, %2d \n", pairIndex, chan1,chan2);
							//now, make sure the fetch didn't fail, and that neither pair is in the "channel exclusion" list
							if(
								(std::find(chan_exclusion_list.begin(), chan_exclusion_list.end(), chan1) != chan_exclusion_list.end())
								||
								(std::find(chan_exclusion_list.begin(), chan_exclusion_list.end(), chan2) != chan_exclusion_list.end())
							){
								// if this global pair number contains a bad channel, we should skip it
								// cout<<"		Skipping global pair "<<pairIndex<<" which has channels "<<chan1<<" and "<<chan2<<endl;
								continue;
							}
							if (chan1 != -1
								&&
								chan2 != -1
								){
									vvdGrPhaseDiff_back[pol][pair_in_use].push_back(getPhaseDifference(phases_backward[use_event][chan1], phases_backward[use_event][chan2]));
									pair_in_use++;
							}
						}
					}
				}

				vector<TGraph*> vGrSigmaVarianceAverage_back;
				vGrSigmaVarianceAverage_back.resize(numPols);
				for(int pol=0; pol<numPols; pol++){
					vGrSigmaVarianceAverage_back[pol] = getPhaseVariance(vvdGrPhaseDiff_back[pol], runNum, event, pol, false);
					vector<double> badFreqs_temp;
					vector<double> badSigmas_temp;
					double threshold = 1.0;
					getPeaksAboveThreshold(vGrSigmaVarianceAverage_back[pol], threshold, badFreqs_temp, badSigmas_temp);
					badFreqs_back.push_back(badFreqs_temp);
					badSigmas_back.push_back(badSigmas_temp);
					for(int i=0; i<badFreqs_temp.size(); i++){
					  //if(badSigmas_temp[i]>1.5)
					  //cout<<"Backward event "<<event<<" :: " <<pol<<" :: freq "<<badFreqs_temp[i]<<", sigma "<<badSigmas_temp[i]<<endl;
					}					
					delete vGrSigmaVarianceAverage_back[pol];
				}
				for(int use_event=0; use_event<15; use_event++){
					for(int pol=0; pol<numPols; pol++){
						for(int pairIndex=0; pairIndex<numPairs_pol[pol]; pairIndex++){
							delete vvdGrPhaseDiff_back[pol][pairIndex][use_event];
						}
					}
				}
			}
			for(int use_event=0; use_event<phases_backward.size();use_event++){
				for(int chan=0; chan<16; chan++){
					delete phases_backward[use_event][chan];
				}
			}
		}
		NewCWTree->Fill();
		deleteGraphVector(grWaveformsRaw);
		if(isSimulation==false){
			delete realAtriEvPtr;
		}
	}//loop over events

	outFile->Write();
	outFile->Close();
	fp->Close();
	SummaryFile->Close();

	tempFile->Close();
	remove(del_me_file_name);

	printf("Done! Run Number %d \n", runNum);

}//end main
