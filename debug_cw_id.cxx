////////////////////////////////////////////////////////////////////////////////
////	debug_cw_id.cxx
////	A23 diffuse, identify CW frequency, debug
////
////	Jorge Torres, Sept 2019. Modified from B. Clark
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
#include "tools_Cuts.h"

RawAtriStationEvent *rawAtriEvPtr;
UsefulAtriStationEvent *realAtriEvPtr;

bool isBalloonEvent(TGraph * spectrum){
  // cout << "Number of samples is "<< spectrum->GetN() << endl;
  // for(int i=0;i<spectrum->GetN();i++){
  //   printf("n:%d, x:%f, y:%f \n", i, spectrum->GetX()[i],spectrum->GetY()[i]);
  // }
  if(spectrum->GetY()[410]>100*spectrum->GetY()[310]) return true;
  else return false;
 }


int main(int argc, char **argv)
{

	if(argc<8) {
		std::cout << "Usage\n" << argv[0] << " <simulation_flag> <station> <year> <drop_bad_chans> <run summary directory> <output directory> <input file> <pedestal file> \n";
		return -1;
	}

	char *PedDirPath(getenv("PED_DIR"));
	if (PedDirPath == NULL) std::cout << "Warning! $DATA_DIR is not set!" << endl;

	/*
	arguments
	0: exec
	1: simulation (yes/no)
	2: station num (2/3)
	3: year
	4: drop bad chans
	5: run summary directory
	6: output directory
	7: input file
	8: pedestal file
	*/

	int isSimulation=atoi(argv[1]);
	int station_num=atoi(argv[2]);
	int year=atoi(argv[3]);
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
  // Long64_t numEntries=4902;
	Long64_t starEvery=numEntries/80;
	if(starEvery==0) starEvery++;
	printf("Num events is %d \n", numEntries);
	cout<<"This file has a starEvery of "<<starEvery<<endl;

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

	AraGeomTool * geomTool = new AraGeomTool();
	int nGraphs=16;

	vector<int> chan_exclusion_list;
	if(drop_bad_chans){
		if(station_num==2){
			//drop the last hpol channel
			chan_exclusion_list.push_back(15);
		}
		if(station_num==3 && runNum>2972){
			// drop string four
			chan_exclusion_list.push_back(3);
			chan_exclusion_list.push_back(7);
			chan_exclusion_list.push_back(11);
			chan_exclusion_list.push_back(15);
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

	cout<<"About to make FFTs..."<<endl;

	char del_me_file_name[400];
	sprintf(del_me_file_name,"%s/delme_run%d.root",output_location.c_str(),runNum);
	TFile *tempFile = TFile::Open(del_me_file_name,"RECREATE");
	tempFile->cd();
	TTree *tempTree = new TTree("tempTree","tempTree");
	bool hasError=0;
	tempTree->Branch("hasError",&hasError);
	vector<TGraph*> temp_phs;
	temp_phs.resize(16);
	stringstream ss;
	for(int i=0; i<16; i++){
		ss.str(""); ss<<"temp_phs_"<<i;
		tempTree->Branch(ss.str().c_str(),&temp_phs[i]);
	}
	for(int event=0; event<numEntries; event++){
		eventTree->GetEntry(event);
    bool isCalpulser = rawAtriEvPtr->isCalpulserEvent();
    // if(isCalpulser) continue;
		if (isSimulation == false){
			realAtriEvPtr = new UsefulAtriStationEvent(rawAtriEvPtr, AraCalType::kLatestCalib);
      if(event>10350 && event<11000){
        hasError = !(qualCut->isGoodEvent(realAtriEvPtr));
      }
      else hasError=true;

		}
		else if(isSimulation){
			hasError=false;
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

    TCanvas *c2 = new TCanvas("","",1550,1550);
    c2->Divide(4,4);
    for(int i=0; i<16; i++){//canvas loop
      char ch_name[20];
      sprintf(ch_name,"chan %d",i);
      c2->cd(i+1);
      // temp_phs[i]->SetTitle(ch_name);
      grWaveformsRaw[i]->Draw("AL");
    }//canvas loop
    char h3name[60];
    sprintf(h3name,"./plots/trouble_events/wforms/wf_event%d_run%d.png",event, runNum);
    //c2->SaveAs(h3name);
    delete c2;

vector<TGraph*> electChansGraphs;
electChansGraphs.push_back(realAtriEvPtr->getGraphFromElecChan(6));
electChansGraphs.push_back(realAtriEvPtr->getGraphFromElecChan(14));
electChansGraphs.push_back(realAtriEvPtr->getGraphFromElecChan(22));
electChansGraphs.push_back(realAtriEvPtr->getGraphFromElecChan(30));
TCanvas *cWave_spare = new TCanvas("","",4*1100,850);
cWave_spare->Divide(4,1);
for(int i=0; i<4; i++){
cWave_spare->cd(i+1);
electChansGraphs[i]->Draw("AL");
electChansGraphs[i]->SetLineWidth(3);
}
char save_temp_title[100];
//sprintf(save_temp_title,"./plots/trouble_events/wforms_spare/wf_event%d_run%d.png",event, runNum);
//cWave_spare->SaveAs(save_temp_title);
delete cWave_spare;


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
      bool isballoon=false;
      TCanvas *cc = new TCanvas("","",1550,1550);
      cc->Divide(4,4);
      for(int i=0; i<16; i++){//canvas loop
        char ch_name[20];
        sprintf(ch_name,"chan %d",i);
        gPad->SetLogy();
        cc->cd(i+1);
        // temp_phs[i]->SetTitle(ch_name);
        TGraph *spectrum = FFTtools::makePowerSpectrumMilliVoltsNanoSeconds(grWaveformsPadded[i]);
        spectrum->Draw("AL");
        // if(i<3) isballoon = isBalloonEvent(spectrum);
      }//canvas loop
      char h5name[60];
      sprintf(h5name,"./plots/trouble_events/ffts/fft_event%d_run%d_A%d.png",event, runNum, station_num);
      int unixTime=(int)rawAtriEvPtr->unixTime;
      // cout << unixTime << endl;
      // if(unixTime>=1431034500 && unixTime<=1431036900) cc->SaveAs(h5name);
      delete cc;

      for(int chan=0; chan<16; chan++){
				temp_phs[chan] = getFFTPhase(grWaveformsPadded[chan],120.,1000.);
			}

      TCanvas *c2 = new TCanvas("","",1550,1550);
      c2->Divide(4,4);
      for(int i=0; i<16; i++){//canvas loop
        char ch_name[20];
        sprintf(ch_name,"chan %d",i);
        gPad->SetLogy();
        c2->cd(i+1);
        // temp_phs[i]->SetTitle(ch_name);
        FFTtools::makePowerSpectrumMilliVoltsNanoSeconds(grWaveformsPadded[i])->Draw("AL");
      }//canvas loop
      char h3name[60];
      sprintf(h3name,"./plots/trouble_events/ffts/fft_event%d_run%d.png",event, runNum);
      //c2->SaveAs(h3name);
      delete c2;


			deleteGraphVector(grWaveformsInt);
			deleteGraphVector(grWaveformsPadded);
		}
		tempTree->Fill(); //fill the tree
		deleteGraphVector(grWaveformsRaw);
		for(int i=0; i<16; i++) delete temp_phs[i];
		if(!isSimulation) delete realAtriEvPtr;
	}
	tempFile->Write();
	cout<<"Done making FFTs."<<endl;

	temp_phs.clear();
	temp_phs.resize(16);

	//now, to loop over events!
	for(Long64_t event=0;event<numEntries;event++){
		// cout<<"On event "<<event<<endl;

		badFreqs_fwd.clear();
		badSigmas_fwd.clear();
		badFreqs_back.clear();
		badSigmas_back.clear();
		badFreqs_baseline.clear();

		if(event%starEvery==0) { std::cerr << "*"; }

		eventTree->GetEntry(event); //get the event
    bool isCalpulser = rawAtriEvPtr->isCalpulserEvent();
    // if(isCalpulser) continue;

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


		if(!hasError){

			//before we do the phase variance, we should check for baseline violations
			vector<double> baseline_CW_cut_V = CWCut_TB(grWaveformsRaw, average, 0, 6., 5.5, station_num, 3, chan_exclusion_list, runNum, event);
			vector<double> baseline_CW_cut_H = CWCut_TB(grWaveformsRaw, average, 1, 6., 5.5, station_num, 3, chan_exclusion_list, runNum, event);
			/*
			for(int i=0; i<baseline_CW_cut_V.size(); i++){
				printf("V: Event %d Baseline CW Cut %.2f \n", event, baseline_CW_cut_V[i]);
			}
			for(int i=0; i<baseline_CW_cut_H.size(); i++){
				printf("H: Event %d Baseline CW Cut %.2f \n", event, baseline_CW_cut_H[i]);
			}
			*/

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
					if(runNum>2972){
						// drop string four (two channels per polarization)
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
				E.g., reduce to 21 pairs when
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
      TCanvas *c2 = new TCanvas("","",1550,1550);
      c2->Divide(4,4);
      for(int i=0; i<16; i++){//canvas loop
        char ch_name[20];
        sprintf(ch_name,"chan %d",i);
        c2->cd(i+1);
        int NumPhasePoints=first_event_in_sequence_phases_forward[i]->GetN();
        double PhaseFrequency[NumPhasePoints], PhaseWrapped[NumPhasePoints];
        for(int p=0;p<=NumPhasePoints;p++){
          PhaseFrequency[p]=first_event_in_sequence_phases_forward[i]->GetX()[p];
          PhaseWrapped[p]=first_event_in_sequence_phases_forward[i]->GetY()[p];
        }

        double AccumulatedPhase=0.;
        vector<Double_t> PhaseUnwrapped;
        PhaseUnwrapped.push_back(PhaseWrapped[0]); //we need to manually insert the first point
        for(int k=1; k<NumPhasePoints; k++){

          PhaseWrapped[k]+=AccumulatedPhase; //first, bring the current value up to the accumulated phase quantity
          double oldPhasecurrent = PhaseWrapped[k]; //the current phase value, before being adjusted by the accumulated phase
          double oldPhaseprevious = PhaseWrapped[k-1]; //the previous phase value entry, before being adjusted by the accumulated phase

          //then, decide if it needs further adjustment
          if( (oldPhasecurrent-oldPhaseprevious)>TMath::Pi()){ //this point is too large
            AccumulatedPhase-=2*TMath::Pi(); //we need to pull out a factor of pi
          }
          else if( (oldPhasecurrent-oldPhaseprevious)<-1.*TMath::Pi()){ //this point is too small
            AccumulatedPhase+=2*TMath::Pi(); //we need to put in a factor of pi
          }
          //otherwise, this point doesn't violate our phase wrapping, and we can just leave it alone
          PhaseUnwrapped.push_back(PhaseWrapped[k]+AccumulatedPhase); //fill the unwrapped phase array with the unwrapped phase!
          //cout<<"The new accumulated phase is "<<AccumulatedPhase<<endl;
          //cout<<"The new phase value for frequency "<<PhaseFrequency[k]<<" MHz is "<<PhaseUnwrapped[k]<<endl;
        }
        TGraph *PhaseUnwrappedGraph= new TGraph(NumPhasePoints,PhaseFrequency,& PhaseUnwrapped[0]);
        PhaseUnwrappedGraph->Draw("AL");
        // temp_phs[i]->SetTitle(ch_name);
        // first_event_in_sequence_phases_forward[i]->Draw("AL");
      }//canvas loop
      char h3name[60];
      sprintf(h3name,"./plots/trouble_events/phase_plots/phases_event%d_run%d_A%d.png",event, runNum,station_num);
      // c2->SaveAs(h3name);
      delete c2;
			//okay, now we need to try and move forward
			int found_events_forward=0;
			for(int event_next=event+1; event_next<numEntries;event_next++){
				// printf("			Trying to move forwards to event %d \n",event_next);
				// printf("			I've found %d good events \n",found_events_forward);
				if(found_events_forward==14) break; //after you've collected 15 events (0->14), we're good to go.
				tempTree->GetEntry(event_next);

				if(!hasError){
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
				// printf("	We have sufficient number of events to do phase variance calculation in forward direction\n");
				int chan1, chan2;
				for(int use_event=0; use_event<15; use_event++){ //loop over the events that we stored
					for(int pol=0; pol<numPols; pol++){ //loop over polarizations
						int pair_in_use=0;
						for(int pairIndex = 0; pairIndex < numPairs; pairIndex++){ //loop over pairs for that event and polarization
							// cout<<"Working on global pair index "<<pairIndex<<endl;
							getChansfromPair(geomTool,station_num,pol,pairIndex,chan1,chan2); //get chan numbers for this pair and pol
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
									vvdGrPhaseDiff_fwd[pol][pair_in_use].push_back(getPhaseDifference(phases_forward[use_event][chan1], phases_forward[use_event][chan2]));
									pair_in_use++;
							}
						}
					}
				}
				//printf("	Got phase difference; on to phase variance\n");
				vector<TGraph*> vGrSigmaVarianceAverage_fwd;
				vGrSigmaVarianceAverage_fwd.resize(numPols);
				for(int pol=0; pol<numPols; pol++){
					vGrSigmaVarianceAverage_fwd[pol] = getPhaseVariance(vvdGrPhaseDiff_fwd[pol], runNum, event, pol, true);
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
				if(found_events_backwards==0)
					break;
				tempTree->GetEntry(event_next);
				if(!hasError){
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
				// printf("	We have sufficient number of events to do phase variance calculation in backward direction\n");
				int chan1, chan2;
				for(int use_event=0; use_event<15; use_event++){ //loop over the events that we stored
					for(int pol=0; pol<numPols; pol++){ //loop over polarizations
						int pair_in_use=0;
						for(int pairIndex = 0; pairIndex < numPairs; pairIndex++){ //loop over pairs for that event and polarization
							// cout<<"Working on global pair index "<<pairIndex<<endl;
							getChansfromPair(geomTool,station_num,pol,pairIndex,chan1,chan2); //get chan numbers for this pair and pol
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
						// cout<<"Backward event "<<event<<" :: " <<pol<<" :: freq "<<badFreqs_temp[i]<<", sigma "<<badSigmas_temp[i]<<endl;
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
