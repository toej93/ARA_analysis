////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////	v2_analysis_reco_100.cxx
////	A23 diffuse, do reconstruction on 100 sample
////	This means we must already have knowledge of filter file before we do reco
////	And we need to load that information
////
////	June 2019
////////////////////////////////////////////////////////////////////////////////

//Includes
#include <iostream>
#include <iomanip>
#include <sstream>

//AraRoot Includes
#include "RawAtriStationEvent.h"
#include "UsefulAraStationEvent.h"
#include "UsefulAtriStationEvent.h"
#include "AraGeomTool.h"

//ROOT Includesf
#include "TTree.h"
#include "TFile.h"
#include "TGraph.h"
#include "TH2D.h"

RawAtriStationEvent *rawAtriEvPtr;
UsefulAtriStationEvent *realAtriEvPtr;

// #include "/home/brianclark/A23_analysis_new2/AraRoot/include/Settings.h"
// #include "/home/brianclark/A23_analysis_new2/AraRoot/include/Event.h"
// #include "/home/brianclark/A23_analysis_new2/AraRoot/include/Detector.h"
// #include "/home/brianclark/A23_analysis_new2/AraRoot/include/Report.h"

#include "Settings.h"
#include "Event.h"
#include "Detector.h"
#include "Report.h"

#include "AraAntennaInfo.h"
#include "AraQualCuts.h"
// #include "/home/brianclark/A23_analysis_new2/AraRoot/include/RayTraceCorrelator.h"
#include "RayTraceCorrelator.h"

#include "tools_inputParameters.h"
#include "tools_outputObjects.h"
#include "tools_runSummaryObjects.h"
#include "tools_WaveformFns.h"
#include "tools_PlottingFns.h"
#include "tools_Constants.h"
#include "tools_RecoFns.h"
#include "tools_Cuts.h"

AraAntPol::AraAntPol_t Vpol = AraAntPol::kVertical;
AraAntPol::AraAntPol_t Hpol = AraAntPol::kHorizontal;

int main(int argc, char **argv)
{
	time_t time_now = time(0); //get the time now
	tm *time = localtime(&time_now);
	int year_now = time -> tm_year + 1900;
	int month_now = time -> tm_mon + 1;
	int day_now = time -> tm_mday;

	int thresholdBin_pol[]={0,0}; //bin 3 = 2.3, bin 5 = 2.5 //what is the faceRMS inclusion threshold?
	double wavefrontRMScut[]={-1.3, -1.4}; //event wavefrontRMS < this value

	if(argc<7) {
		std::cout << "Usage\n" << argv[0] << " <1-simulation_flag> <2-station> <3-year/config> <4-filter_file_dir> <5-output directory> <6-input file> <7-pedestal file> \n";
		return -1;
	}

	/*
	arguments
	0: exec
	1: simulation (yes/no)
	2: station num (2/3)
	3: year/config
	4: filter file directory
	5: output directory
	6: input file name
	7: pedestal file name
	*/

	//	cout<<argv[0]<<" "<<argv[1]<<" "<<argv[2]<<" "<<argv[3]<<" "<<argv[4]<<" "<<argv[5]<<" "<<argv[6]<<" "<<argv[7]<<endl;
	//cout<<""<<endl;
	//return 0;

	isSimulation=atoi(argv[1]);
	int station_num=atoi(argv[2]);
	calpulserRunMode=0;
	int yearConfig=atoi(argv[3]);


	AraQualCuts *qualCut = AraQualCuts::Instance(); //we also need a qual cuts tool

	// open the data
	TFile *fp = TFile::Open(argv[6]);
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

	if (isSimulation == true){
		simSettingsTree=(TTree*) fp->Get("AraTree");
		if (!simSettingsTree) {
			std::cout << "Can't find AraTree\n";
			return -1;
		}

		simSettingsTree->SetBranchAddress("detector", &detector);
		simSettingsTree->GetEntry(0);

		for (int i = 0; i < detector->stations.size(); i++){
			int n_antennas = 0;
			for (int ii = 0; ii < detector->stations[i].strings.size(); ii++){
				for (int iii = 0; iii < detector->stations[i].strings[ii].antennas.size(); iii++){
					detectorCenter[0] += detector->stations[i].strings[ii].antennas[iii].GetX();
					detectorCenter[1] += detector->stations[i].strings[ii].antennas[iii].GetY();
					detectorCenter[2] += detector->stations[i].strings[ii].antennas[iii].GetZ();
					n_antennas++;
				}
			}
			cout << "Detector Center: ";
			for (int ii = 0; ii < 3; ii++){
				detectorCenter[ii] = detectorCenter[ii]/(double)n_antennas;
				cout << detectorCenter[ii] << " : ";
			}
			cout << endl;
		}

		simTree=(TTree*) fp->Get("AraTree2");
		if (!simTree) {
			std::cout << "Can't find AraTree2\n";
			return -1;
		}
		simTree->SetBranchAddress("event", &eventPtr);
		simTree->SetBranchAddress("report", &reportPtr);
		simTree->GetEvent(0);
	}

	Settings *settings = new Settings();
	string setupfile = "setup.txt";
	settings->ReadFile(setupfile);
	cout << "Read " << setupfile << " file!" << endl;
	settings->NOFZ=1;

	// we just need two correlators
	// one for 300m, and one for 41m

	RayTraceCorrelator *theCorrelators[2];
	theCorrelators[0] = new RayTraceCorrelator(station_num, 41, settings, angularBinSize, RTTestMode);
	theCorrelators[1] = new RayTraceCorrelator(station_num, 300, settings, angularBinSize, RTTestMode);

	double weight;
	int unixTime;
	int unixTimeUs;
	int eventNumber;
	double maxPeakVfromSim;
	double PeakVfromSim[16][2];
	int runNum;

	// eventTree->ResetBranchAddresses();

	if(isSimulation){
		eventTree->SetBranchAddress("UsefulAtriStationEvent", &realAtriEvPtr);
		eventTree->SetBranchAddress("weight", &weight);
		printf("Simulation; load useful event tree straight away \n");
		runNum = getrunNum(argv[6]);
	}
	else{
		eventTree->SetBranchAddress("event",&rawAtriEvPtr);
		eventTree->SetBranchAddress("run",&runNum);
		printf("Data; load raw event tree \n");
	}

	Long64_t numEntries=eventTree->GetEntries();
	// Long64_t numEntries=100;
	Long64_t starEvery=numEntries/80;
	if(starEvery==0) starEvery++;
	// numEntries=300;
	// int numThermal=0;
	// int numGood=0;

	eventTree->GetEntry(0); //just to get runNum
	printf("Reco Run Number %d \n", runNum);

	/*
		Adjust filter parameters
		in A2, we were happy with snr in 0,0 and -1.3, -1.4 in V and H
		in A3, we want to do something a little more complicated and just thresholds
		by configuration
	*/

	int thisConfiguration = yearConfig;
	if(!isSimulation){
		thisConfiguration = getConfig(station_num, runNum);
	}
	getWFRMSCutValues(station_num, thisConfiguration, thresholdBin_pol[0], thresholdBin_pol[1], wavefrontRMScut[0], wavefrontRMScut[1]);
	printf("Wavefront RMS cut values are vBin %d and hBin %d, vCut %.2f, hCut %.2f \n", thresholdBin_pol[0], thresholdBin_pol[1], wavefrontRMScut[0], wavefrontRMScut[1]);

	AraEventCalibrator *calibrator = AraEventCalibrator::Instance();
	if (argc==8){
		cout << "Trying to load named pedestal" << endl;
		calibrator->setAtriPedFile(argv[7], station_num);
		cout << "Loaded named pedestal" << endl;
	} else {
		cout << "Trying to load blank pedestal" << endl;
		calibrator->setAtriPedFile("", station_num);
		cout << "Loaded blank pedestal" << endl;
	}

	// get the run summary information, if it exists yet
	// and remember, because it's the users job to pass the location of the filter files
	// this should work for simulated events just fine
	// note that also, we need to have information about the wavefront RMS filter
	// so that we can only do reconstructions on events which pass the WFRMS filter
	char filter_file_name[400];
	sprintf(filter_file_name,"%s/processed_station_%d_run_%d_filter.root",argv[4],station_num,runNum);
	TFile *filterFile = TFile::Open(filter_file_name,"READ"); //read only please
	if(!filterFile){
		std::cout << "Can't open filter file for run "<<runNum<<endl;
		return -1;
	}
	TTree *filterTree = (TTree*) filterFile->Get("OutputTree");
	if(!filterTree) {
		std::cout << "Can't find filter tree\n";
		return -1;
	}
	filterTree->SetBranchAddress("VPeakOverRMS", &VPeakOverRMS);
	filterTree->SetBranchAddress("rms_pol_thresh_face_V", &rms_pol_thresh_face_V);
	filterTree->SetBranchAddress("rms_pol_thresh_face_H", &rms_pol_thresh_face_H);
	int numFaces_new_V;
	int numFaces_new_H;
	if(station_num==2){
		numFaces_new_V = numFaces;
		numFaces_new_H = numFaces_A2_drop;
	}
	else if(station_num==3){
		numFaces_new_V = numFaces_A3_drop;
		numFaces_new_H = numFaces_A3_drop;
	}
	double rms_pol_thresh_face_alternate_V[thresholdSteps][numFaces_new_V];
	double rms_pol_thresh_face_alternate_H[thresholdSteps][numFaces_new_H];
	filterTree->SetBranchAddress("rms_pol_thresh_face_alternate_V", &rms_pol_thresh_face_alternate_V);
	filterTree->SetBranchAddress("rms_pol_thresh_face_alternate_H", &rms_pol_thresh_face_alternate_H);
	filterFile->cd();

	// prepare for output
	char output_file_name[500];
	sprintf(output_file_name, "%s/processed_station_%d_run_%d_reco.root",argv[5],station_num,runNum);

	// string processedFilename = getProcessedFilename_recoRadius(station_num, argv[6], runNum, radii[radiusBin]);
	TFile *OutputFile = TFile::Open(output_file_name, "RECREATE");
	TTree* OutputFilterTreeCopy = filterTree->CloneTree(0);

	TTree* OutputTree=new TTree("OutputTreeReco", "OutputTreeReco");
	// reconstruction information

	OutputTree->Branch("peakCorr_41m", &peakCorr_41m, "peakCorr_41m[2]/D");
	OutputTree->Branch("peakTheta_41m", &peakTheta_41m, "peakTheta_41m[2]/I");
	OutputTree->Branch("peakPhi_41m", &peakPhi_41m, "peakPhi_41m[2]/I");
	OutputTree->Branch("minCorr_41m", &minCorr_41m, "minCorr_41m[2]/D");
	OutputTree->Branch("meanCorr_41m", &meanCorr_41m, "meanCorr_41m[2]/D");
	OutputTree->Branch("rmsCorr_41m", &rmsCorr_41m, "rmsCorr_41m[2]/D");
	OutputTree->Branch("peakSigma_41m", &peakSigma_41m, "peakSigma_41m[2]/D");

	OutputTree->Branch("peakCorr_300m", &peakCorr_300m, "peakCorr_300m[2]/D");
	OutputTree->Branch("peakTheta_300m", &peakTheta_300m, "peakTheta_300m[2]/I");
	OutputTree->Branch("peakPhi_300m", &peakPhi_300m, "peakPhi_300m[2]/I");
	OutputTree->Branch("minCorr_300m", &minCorr_300m, "minCorr_300m[2]/D");
	OutputTree->Branch("meanCorr_300m", &meanCorr_300m, "meanCorr_300m[2]/D");
	OutputTree->Branch("rmsCorr_300m", &rmsCorr_300m, "rmsCorr_300m[2]/D");
	OutputTree->Branch("peakSigma_300m", &peakSigma_300m, "peakSigma_300m[2]/D");


	OutputTree->Branch("run",&runNumOut, "run/I");
	runNumOut=runNum;

	bool passesWavefrontRMS[2];
	double bestFaceRMS[2];
	OutputTree->Branch("isCalpulser", &isCalpulser, "isCalpulser/O");
	OutputTree->Branch("isSoftTrigger", &isSoftTrigger, "isSoftTrigger/O");
	OutputTree->Branch("passesWavefrontRMS", &passesWavefrontRMS, "passesWavefrontRMS[2]/O");
	OutputTree->Branch("bestFaceRMS", &bestFaceRMS, "bestFaceRMS[2]/D");
	OutputTree->Branch("unixTime", &unixTime);
	OutputTree->Branch("unixTimeUs", &unixTimeUs);
	OutputTree->Branch("eventNumber", &eventNumber);

	// simulation parameters
	OutputTree->Branch("maxPeakVfromSim", &maxPeakVfromSim);
	OutputTree->Branch("PeakVfromSim", &PeakVfromSim, "peakVfromSim[16][2]/D");
	OutputTree->Branch("weight", &weight_out, "weight/D");
	OutputTree->Branch("flavor", &flavor, "flavor/I");
	OutputTree->Branch("nu_nubar", &nu_nubar, "nu_nubar/I");
	OutputTree->Branch("energy", &energy, "energy/D");
	OutputTree->Branch("posnu", &posnu, "posnu[3]/D");
	OutputTree->Branch("viewAngle", &viewAngle, "viewAngle[16][2]/D");
	OutputTree->Branch("viewAngleAvg", &viewAngleAvg, "viewAngleAvg[2]/D");

	int eventSim = 0;
	cerr<<"Run "<<runNum<<" has a starEvery of "<<starEvery<<" and "<<numEntries<<" total events"<<endl;
	for(Long64_t event=0;event<numEntries;event++) {
		if(event%starEvery==0) {
			std::cout << "*";
		}

		eventTree->GetEntry(event);
		filterTree->GetEntry(event);

		if (isSimulation == false){
			unixTime=(int)rawAtriEvPtr->unixTime;
			unixTimeUs=(int)rawAtriEvPtr->unixTimeUs;
			eventNumber=(int)rawAtriEvPtr->eventNumber;
		}else {
			eventNumber = event;
		}

		if (isSimulation == true){
			bool foundNextSimEvent = false;

			while (foundNextSimEvent == false){
				simTree->GetEntry(eventSim);
				if (reportPtr->stations[0].Global_Pass != 0 ){
					flavor = eventPtr->nuflavorint;
					nu_nubar = eventPtr->nu_nubar;
					energy = eventPtr->pnu;
					posnu[0] = eventPtr->Nu_Interaction[0].posnu.GetX();
					posnu[1] = eventPtr->Nu_Interaction[0].posnu.GetY();
					posnu[2] = eventPtr->Nu_Interaction[0].posnu.GetZ();
					weight = eventPtr->Nu_Interaction[0].weight;
					maxPeakVfromSim = reportPtr->stations[0].max_PeakV;
					for (int i = 0; i < 4; i++){
						for (int ii = 0; ii < 4; ii++){
							int chan = ii +4*i;
							for (int j = 0; j < reportPtr->stations[0].strings[ii].antennas[i].PeakV.size(); j++){
								PeakVfromSim[chan][j] = reportPtr->stations[0].strings[ii].antennas[i].PeakV[j];
							}
						}
					}

					int avgCounter[2];
					avgCounter[0] = 0;       avgCounter[1] = 0;
					viewAngleAvg[0] = 0.;        viewAngleAvg[1] = 0.;
					for (int i = 0; i < 16; i++){
						for (int ii = 0; ii < 2; ii++){
							viewAngle[i][ii] = 0.;
						}
					}
					for (int i = 0; i < reportPtr->stations[0].strings.size(); i++){
						for (int ii = 0; ii < reportPtr->stations[0].strings[i].antennas.size(); ii++){
							int channel = 4*i+ii;
							for (int iii = 0; iii < reportPtr->stations[0].strings[i].antennas[ii].view_ang.size(); iii++){
								viewAngleAvg[iii] += reportPtr->stations[0].strings[i].antennas[ii].view_ang[iii];
								avgCounter[iii]++;
								viewAngle[channel][iii] = reportPtr->stations[0].strings[i].antennas[ii].view_ang[iii];
							}
						}
					}
					for (int i = 0; i < 2; i++){
						if (avgCounter[i] == 0) {
							viewAngleAvg[i] = 0.;
						} else {
							viewAngleAvg[i] = viewAngleAvg[i]/(double)avgCounter[i];
						}
					}
					foundNextSimEvent=true;
				}
				eventSim++;
			}
		} else {
			posnu[0] = -10000000;
			posnu[1] = -10000000;
			posnu[2] = -10000000;
			flavor = -1;
			nu_nubar = -1;
			energy = -1.;
		}

		if(!isSimulation){
			realAtriEvPtr = new UsefulAtriStationEvent(rawAtriEvPtr, AraCalType::kLatestCalib);
		}

		if (isSimulation){
			isCalpulser = false;
			isSoftTrigger = false;
		} else{
			isCalpulser = rawAtriEvPtr->isCalpulserEvent();
			isSoftTrigger = rawAtriEvPtr->isSoftwareTrigger();
			weight = 1.;
		}

		bool analyzeEvent = true;
		if (analyzeEvent == true){

			weight_out = weight;

			// always start by assuming they pass
			// NB: passing the WFRMS filter therefore means that the event might have other issues
			// so it shouldn't be taken as an exclusive way to reject the event
			passesWavefrontRMS[0] = true;
			passesWavefrontRMS[1] = true;
			// assigning these to 10 should make them stand out
			// because the value for actually fails the filter is 3
			bestFaceRMS[0]=10;
			bestFaceRMS[1]=10;

			for(int pol=0; pol<2; pol++){
				peakCorr_41m[pol]=-100000;
				peakPhi_41m[pol]=-100000;
				peakTheta_41m[pol]=-100000;
				minCorr_41m[pol]=-100000;
				meanCorr_41m[pol]=-100000;
				rmsCorr_41m[pol]=-100000;
				peakSigma_41m[pol]=-100000;

				peakCorr_300m[pol]=-100000;
				peakPhi_300m[pol]=-100000;
				peakTheta_300m[pol]=-100000;
				minCorr_300m[pol]=-100000;
				meanCorr_300m[pol]=-100000;
				rmsCorr_300m[pol]=-100000;
				peakSigma_300m[pol]=-100000;
			}

			if(!isSimulation)
				hasDigitizerError = !(qualCut->isGoodEvent(realAtriEvPtr));
			else
				hasDigitizerError=false;
			//if the event has a  digitizer error, skip it
			if(hasDigitizerError){
				OutputTree->Fill(); //fill this anyway with garbage
				OutputFilterTreeCopy->Fill();
				if (isSimulation == false) {
					delete realAtriEvPtr;
				}
				continue; //don't do any further processing on this event
			}

			// here we need to check if it passes the WFRMS filter
			vector <double> rms_faces_V;
			vector <double> rms_faces_H;

			bool needToSwitchToAltWFRMSArrays=false;
			// we need an actual flag for if we need to switch to the _alternate_ arrays

			int num_faces_for_V_loop;
			int num_faces_for_H_loop;
			if(station_num==2){
				rms_faces_V.resize(numFaces);
				num_faces_for_V_loop=numFaces;
				rms_faces_H.resize(numFaces_A2_drop);
				num_faces_for_H_loop=numFaces_A2_drop;
				needToSwitchToAltWFRMSArrays=true;
			}
			else if(station_num==3){
				if(
					(!isSimulation && runNum>getA3BadRunBoundary())
					||
					(isSimulation && yearConfig>2)
				){ //it's 2014+, drop string four
					rms_faces_V.resize(numFaces_A3_drop);
					num_faces_for_V_loop=numFaces_A3_drop;
					rms_faces_H.resize(numFaces_A3_drop);
					num_faces_for_H_loop=numFaces_A3_drop;
					needToSwitchToAltWFRMSArrays=true;
				}
				else{ //it's 2013-, keep string four
					rms_faces_V.resize(numFaces);
					num_faces_for_V_loop=numFaces;
					rms_faces_H.resize(numFaces);
					num_faces_for_H_loop=numFaces;
				}
			}

			if(needToSwitchToAltWFRMSArrays){
				//now we loop over the faces in the *alternate* arrays
				for(int i=0; i<num_faces_for_V_loop; i++){
					rms_faces_V[i] = rms_pol_thresh_face_alternate_V[thresholdBin_pol[0]][i];
				}
				for(int i=0; i<num_faces_for_H_loop; i++){
					rms_faces_H[i] = rms_pol_thresh_face_alternate_H[thresholdBin_pol[1]][i];
				}
			}
			else{
				//now we loop over the faces in the not alternate arrays
				for(int i=0; i<num_faces_for_V_loop; i++){
					rms_faces_V[i] = rms_pol_thresh_face_V[thresholdBin_pol[0]][i];
				}
				for(int i=0; i<num_faces_for_H_loop; i++){
					rms_faces_H[i] = rms_pol_thresh_face_H[thresholdBin_pol[1]][i];
				}
			}

			//now to sort them smallest to largest; lowest RMS is best
			sort(rms_faces_V.begin(), rms_faces_V.end());
			sort(rms_faces_H.begin(), rms_faces_H.end());

			bestFaceRMS[0]=rms_faces_V[0];
			bestFaceRMS[1]=rms_faces_H[0];

			// if it's log10(wavefront RMS is <-1.3 in V and <-1.4 in H, we're good to go!)
			if(log(bestFaceRMS[0])/log(10) >= wavefrontRMScut[0]){
				passesWavefrontRMS[0]=false;
			}
			if(log(bestFaceRMS[1])/log(10) >= wavefrontRMScut[1]){
				passesWavefrontRMS[1]=false;
			}

 			if(isCalpulser || isSoftTrigger){
 				OutputTree->Fill(); //fill this anyway with garbage
				OutputFilterTreeCopy->Fill(); // just for synchronization
				if (isSimulation == false) {
					delete realAtriEvPtr;
				}
				continue; //don't do any further processing on this event
 			}

 			// numThermal++;

			// printf("Event %5d WFRMS are %.2f, %.2f \n", event, TMath::Log10(bestFaceRMS[0]), TMath::Log10(bestFaceRMS[1]));
			// if it doesn't pass WFRMS filter in one of the two pols, no need to do reconstruction!
			// printf("Event %d, Cal Status is %d, Soft Status is %d. WFRMS are %.2f, %.2f \n", eventNumber, isCalpulser, isSoftTrigger, TMath::Log10(bestFaceRMS[0]), TMath::Log10(bestFaceRMS[1]));
			if(!passesWavefrontRMS[0] && !passesWavefrontRMS[1]){
				// printf("     No need to reco event event %d! Cal %d, Soft %d WFRMS are %.2f, %.2f \n", eventNumber, isCalpulser, isSoftTrigger, TMath::Log10(bestFaceRMS[0]), TMath::Log10(bestFaceRMS[1]));
				OutputTree->Fill(); //fill this anyway with garbage
				OutputFilterTreeCopy->Fill(); // just for synchronization
				if (isSimulation == false) {
					delete realAtriEvPtr;
				}
				continue; //don't do any further processing on this event
			}
			// printf("Event %d good for reco! Cal %d, Soft %d, WFRMS are %.2f, %.2f \n", eventNumber, isCalpulser, isSoftTrigger, TMath::Log10(bestFaceRMS[0]), TMath::Log10(bestFaceRMS[1]));
			// numGood++;
			// continue;

			//otherwise, we need to do recosntructions on both polarizations and for both radii (sigh)

			// if so, we should yank the SNR's that it computed for our reconstructions!
			vector<double> chan_SNRs;
			for(int i=0; i<16; i++){
				chan_SNRs.push_back(VPeakOverRMS[i]);
				//printf("Event %d: chan %d SNR is %.2f \n",event,i,chan_SNRs[i]);
			}

			vector <int> chan_list_V;
			vector <int> chan_list_H;
			for(int chan=0; chan<=7; chan++){
				chan_list_V.push_back(chan);
				chan_list_H.push_back(chan+8);
			}

			if(station_num==2){
				//for station 2, we need to exclude channel 15 from the analysis
				chan_list_H.erase(remove(chan_list_H.begin(), chan_list_H.end(), 15), chan_list_H.end());
			}
			else if(station_num==3){
				// for station 3 years 2014, 2015, 2016, we need to drop string 4 (channels 3, 7, 11, 15) altogether above some run
				if(
					(!isSimulation && runNum>getA3BadRunBoundary())
					||
					(isSimulation && yearConfig>2)

				){			// drop string four
					chan_list_V.erase(remove(chan_list_V.begin(), chan_list_V.end(), 3), chan_list_V.end());
					chan_list_V.erase(remove(chan_list_V.begin(), chan_list_V.end(), 7), chan_list_V.end());
					chan_list_H.erase(remove(chan_list_H.begin(), chan_list_H.end(), 11), chan_list_H.end());
					chan_list_H.erase(remove(chan_list_H.begin(), chan_list_H.end(), 15), chan_list_H.end());
				}
			}

			// reco both polarizations and both radii in one fell swoop
			int solNum = 0;
			TH2D *map_V_raytrace_41 = theCorrelators[0]->getInterferometricMap_RT_select_NewNormalization_SNRweighted(settings, detector, realAtriEvPtr, Vpol, isSimulation, chan_list_V, chan_SNRs, solNum);
			TH2D *map_V_raytrace_300 = theCorrelators[1]->getInterferometricMap_RT_select_NewNormalization_SNRweighted(settings, detector, realAtriEvPtr, Vpol, isSimulation, chan_list_V, chan_SNRs, solNum);

			TH2D *map_H_raytrace_41 = theCorrelators[0]->getInterferometricMap_RT_select_NewNormalization_SNRweighted(settings, detector, realAtriEvPtr, Hpol, isSimulation, chan_list_H, chan_SNRs, solNum);
			TH2D *map_H_raytrace_300 = theCorrelators[1]->getInterferometricMap_RT_select_NewNormalization_SNRweighted(settings, detector, realAtriEvPtr, Hpol, isSimulation, chan_list_H, chan_SNRs, solNum);

			// a little clearer to see logic if we clsuter by polarization, isntead of by polarization....
			getCorrMapPeak_wStats(map_V_raytrace_41, peakTheta_41m[0], peakPhi_41m[0], peakCorr_41m[0], minCorr_41m[0], meanCorr_41m[0], rmsCorr_41m[0], peakSigma_41m[0]);
			getCorrMapPeak_wStats(map_H_raytrace_41, peakTheta_41m[1], peakPhi_41m[1], peakCorr_41m[1], minCorr_41m[1], meanCorr_41m[1], rmsCorr_41m[1], peakSigma_41m[1]);

			getCorrMapPeak_wStats(map_V_raytrace_300, peakTheta_300m[0], peakPhi_300m[0], peakCorr_300m[0], minCorr_300m[0], meanCorr_300m[0], rmsCorr_300m[0], peakSigma_300m[0]);
			getCorrMapPeak_wStats(map_H_raytrace_300, peakTheta_300m[1], peakPhi_300m[1], peakCorr_300m[1], minCorr_300m[1], meanCorr_300m[1], rmsCorr_300m[1], peakSigma_300m[1]);


			//cout<<"Run "<<runNum<<" Event "<<event<<" 300m v corr is "<<peakCorr_300m[0]<<endl;
			// cleanup
			delete map_V_raytrace_41;
			delete map_V_raytrace_300;
			delete map_H_raytrace_41;
			delete map_H_raytrace_300;

			OutputTree->Fill();
			OutputFilterTreeCopy->Fill(); // bring the filter information with us

			if (isSimulation == false) {
				delete realAtriEvPtr;
			}
		}
	}

	// cout<<"Total thermal was "<<numThermal<<endl;
	// cout<<"Total num good was "<<numGood<<endl;

	OutputFile->Write();
	OutputFile->Close();
	filterFile->Close();
	fp->Close();

	// even more cleanup...
	delete theCorrelators[0];
	delete theCorrelators[1];

	delete settings;

	cout<<endl;
	printf("Done! Run Number %d \n", runNum);
}
