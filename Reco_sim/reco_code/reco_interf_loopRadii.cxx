////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////	v2_analysis_reco.cxx 
////	A23 diffuse, do reconstruction
////
////	Nov 2018
////////////////////////////////////////////////////////////////////////////////

//Includes
#include <iostream>
#include <iomanip>
#include <sstream>

//AraRoot Includes
#include "RawAtriStationEvent.h"
#include "UsefulAraStationEvent.h"
#include "UsefulAtriStationEvent.h"

//ROOT Includesf
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

AraAntPol::AraAntPol_t Vpol = AraAntPol::kVertical;
AraAntPol::AraAntPol_t Hpol = AraAntPol::kHorizontal;

int main(int argc, char **argv)
{
	time_t time_now = time(0); //get the time now                                                                                                                                                                  
	tm *time = localtime(&time_now);
	int year_now = time -> tm_year + 1900;
	int month_now = time -> tm_mon + 1;
	int day_now = time -> tm_mday;

	char *DataDirPath(getenv("DATA_DIR"));
	if (DataDirPath == NULL) std::cout << "Warning! $DATA_DIR is not set!" << endl;
	char *PedDirPath(getenv("PED_DIR"));
	if (PedDirPath == NULL) std::cout << "Warning! $DATA_DIR is not set!" << endl;
	
	if(argc<8) {
		std::cout << "Usage\n" << argv[0] << " <1-simulation_flag> <2-station> <3-year/config> <4-radius_bin> <5-filter_file_dir> <6-output directory> <7-input file>\n";
		return -1;
	}

	/*
	arguments
	0: exec
	1: simulation (yes/no)
	2: station num (2/3)
	3: year/config
	4: radius bin
	5: filter file dir
	6: output directory
	7: input file
	*/

	isSimulation=atoi(argv[1]);
	int station_num=atoi(argv[2]);
	calpulserRunMode=0;
	int yearConfig=atoi(argv[3]);
	// int radiusBin = atoi(argv[4]);
	
	int numRadiiScanned = 35;
	int startingRadiusBin = 0;

	AraQualCuts *qualCut = AraQualCuts::Instance(); //we also need a qual cuts tool
	AraGeomTool * geomTool = new AraGeomTool();
	vector<int> chan_exclusion_list;

	stringstream ss;
	string xLabel, yLabel;
	vector<string> titlesForGraphs;
	for (int i = 0; i < nGraphs; i++){
	ss.str("");
	ss << "Channel " << i;
		titlesForGraphs.push_back(ss.str());
	}
		
	TFile *fp = TFile::Open(argv[7]);
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
	string runSummaryFilename;

	runSummaryFilename = "/fs/project/PAS0654/ARA_DATA/A23/sim_SourceSearch/A2/RunSummary/run_summary_station_2_run_20.root";
	
	TFile *SummaryFile = TFile::Open(runSummaryFilename.c_str());
	if(!SummaryFile) {
		std::cout << "Can't open summary file\n";
		return -1;
	}
	TTree* SummaryTree;
	SummaryTree = (TTree*) SummaryFile->Get("SummaryTree");   
	if(!SummaryTree) {
		std::cout << "Can't find SummaryTree\n";
		return -1;
	}
	
	SummaryTree->SetBranchAddress("RMS_RFTrigger", &RMS_RFTrigger);
	SummaryTree->SetBranchAddress("RMS_SoftTrigger", &RMS_SoftTrigger);
	SummaryTree->GetEntry(0);
	
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
	
	// numRadiiScanned=1;
	RayTraceCorrelator *theCorrelators[numRadiiScanned];
	for (int i = 0; i < numRadiiScanned; i++){
		theCorrelators[i] = 0;
	}

	for (int i = 0; i < numRadiiScanned; i++){
		double radius_temp = radii[i+startingRadiusBin];
		cout << "Setup RTCorr : " << radius_temp << endl;
		theCorrelators[i] = new RayTraceCorrelator(station_num, radius_temp, settings, 0.25, RTTestMode);
	}	
	
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
		runNum = getrunNum(argv[7]);
	}
	else{
		eventTree->SetBranchAddress("event",&rawAtriEvPtr);
		eventTree->SetBranchAddress("run",&runNum);
		printf("Data; load raw event tree \n");

	}
	
	Long64_t numEntries=eventTree->GetEntries();
	Long64_t starEvery=numEntries/80;
	if(starEvery==0) starEvery++;
	//numEntries=10;

	eventTree->GetEntry(0); //just to get runNum
	printf("Reco Run Number %d \n", runNum);

	// load pedestals, if they exist yet
	// this will perform fine for simulation; it'll evaluate to garbage (or whatever), but it's not needed, so cool
	AraEventCalibrator *calibrator = AraEventCalibrator::Instance();
	char ped_file_name[400];
	sprintf(ped_file_name,"%s/run_specific_peds/A%d/all_peds/event%d_specificPeds.dat",PedDirPath,station_num,runNum);
	calibrator->setAtriPedFile(ped_file_name,station_num); //because someone had a brain (!!), this will error handle itself if the pedestal doesn't exist

	// get the run summary information, if it exists yet
	// and remember, because it's the users job to pass the location of the filter files
	// this should work for simulated events just fine
	char filter_file_name[500];
	sprintf(filter_file_name,"%s/processed_station_%d_run_%d_filter.root",argv[5],station_num,runNum);
	bool hasFilterFile = false;
	TFile *filterFile = TFile::Open(filter_file_name);
	TTree *filterTree;
	if(filterFile){
		printf("Successfully found filter file information \n");
		hasFilterFile=true;
		filterTree = (TTree*) filterFile->Get("OutputTree");
		if(!filterTree) {
			std::cout << "Can't find filterTree\n";
			return -1;
		}
		filterTree->SetBranchAddress("VPeakOverRMS", &VPeakOverRMS);
		filterTree->SetBranchAddress("thirdVPeakOverRMS", &thirdVPeakOverRMS);

		filterFile->cd();
	}
	if(!filterFile){
	  printf("There is no filter file! Running without a filter file is not allowed!");
	  return -1;
	}

	// prepare for output
	string processedFilename = getProcessedFilename_recoRadius(station_num, argv[6], runNum, 99999);
	TFile *OutputFile = TFile::Open(processedFilename.c_str(), "RECREATE");
	TTree* OutputSettingsTree = new TTree("OutputSettingsTree", "OutputSettingsTree");
	OutputSettingsTree->Branch("detectorCenter", &detectorCenter, "detectorCenter[3]/D");
	OutputSettingsTree->Branch("calpulserRunMode", &calpulserRunMode, "calpulserRunMode/I");
	OutputSettingsTree->Branch("numFaces", &numFaces_save, "numFaces");
	OutputSettingsTree->Branch("numSearchPeaks", &numSearchPeaks, "numSearchPeaks/I");
	OutputSettingsTree->Branch("thresholdMin", &thresholdMin, "thresholdMin/I");
	OutputSettingsTree->Branch("thresholdStep", &thresholdStep, "thresholdStep/D");
	OutputSettingsTree->Branch("thresholdSteps", &thresholdSteps_v, "thresholdSteps/D");
	OutputSettingsTree->Branch("interpolationTimeStep", &interpolationTimeStep, "interpolationTimeSteps/D");
	OutputSettingsTree->Branch("numBinsToIntegrate", &numBinsToIntegrate, "numBinsToIntegrate/I");

	OutputSettingsTree->Branch("numRadii", &numRadii_v);
	OutputSettingsTree->Branch("numRadiiScanned", &numRadiiScanned);
	OutputSettingsTree->Branch("startingRadiusBin", &startingRadiusBin);
	OutputSettingsTree->Branch("numPols", &numPols_v, "numPols");
	OutputSettingsTree->Branch("radii", &radii, "radii[numRadii]");
	OutputSettingsTree->Branch("recoFilterThreshold", &recoFilterThreshold, "recoFilterThreshold[numPols]/D");
	OutputSettingsTree->Branch("recoFilterThresholdBin", &recoFilterThresholdBin, "recoFilterThresholdBin[numPols]/I");
	OutputSettingsTree->Branch("recoFilterWavefrontRMSCut", &recoFilterWavefrontRMSCut, "recoFilterWavefrontRMSCut[numPols]/D");
	OutputSettingsTree->Fill();
	
	TTree* OutputTree=new TTree("OutputTree", "OutputTree");
	// reconstruction information
	OutputTree->Branch("runReconstruction", &runReconstruction, "runReconstruction/O");

	int peakTheta_dir[numRadiiScanned][2], peakPhi_dir[numRadiiScanned][2];
	double peakCorr_dir[numRadiiScanned][2], minCorr_dir[numRadiiScanned][2], meanCorr_dir[numRadiiScanned][2], rmsCorr_dir[numRadiiScanned][2], peakSigma_dir[numRadiiScanned][2];

	OutputTree->Branch("peakCorr_dir", &peakCorr_dir, "peakCorr_dir[35][2]/D");
	OutputTree->Branch("peakTheta_dir", &peakTheta_dir, "peakTheta_dir[35][2]/I");
	OutputTree->Branch("peakPhi_dir", &peakPhi_dir, "peakPhi_dir[35][2]/I");
	OutputTree->Branch("minCorr_dir", &minCorr_dir, "minCorr_dir[35][2]/D");
	OutputTree->Branch("meanCorr_dir", &meanCorr_dir, "meanCorr_dir[35][2]/D");
	OutputTree->Branch("rmsCorr_dir", &rmsCorr_dir, "rmsCorr_dir[35][2]/D");
	OutputTree->Branch("peakSigma_dir", &peakSigma_dir, "peakSigma_dir[35][2]/D");
	
	int peakTheta_ref[numRadiiScanned][2], peakPhi_ref[numRadiiScanned][2];
	double peakCorr_ref[numRadiiScanned][2], minCorr_ref[numRadiiScanned][2], meanCorr_ref[numRadiiScanned][2], rmsCorr_ref[numRadiiScanned][2], peakSigma_ref[numRadiiScanned][2];
	
	OutputTree->Branch("peakCorr_ref", &peakCorr_ref, "peakCorr_ref[35][2]/D");
	OutputTree->Branch("peakTheta_ref", &peakTheta_ref, "peakTheta_ref[35][2]/I");
	OutputTree->Branch("peakPhi_ref", &peakPhi_ref, "peakPhi_ref[35][2]/I");
	OutputTree->Branch("minCorr_ref", &minCorr_ref, "minCorr_ref[35][2]/D");
	OutputTree->Branch("meanCorr_ref", &meanCorr_ref, "meanCorr_ref[35][2]/D");
	OutputTree->Branch("rmsCorr_ref", &rmsCorr_ref, "rmsCorr_ref[35][2]/D");
	OutputTree->Branch("peakSigma_ref", &peakSigma_ref, "peakSigma_ref[35][2]/D");
	
	OutputTree->Branch("run",&runNumOut, "run/I");
	runNumOut=runNum;

	double thirdVPeakOverRMS_out[3];
	OutputTree->Branch("isCalpulser", &isCalpulser, "isCalpulser/O");
	OutputTree->Branch("isSoftTrigger", &isSoftTrigger, "isSoftTrigger/O");
	OutputTree->Branch("unixTime", &unixTime);
	OutputTree->Branch("unixTimeUs", &unixTimeUs);
	OutputTree->Branch("eventNumber", &eventNumber);
	OutputTree->Branch("maxPeakVfromSim", &maxPeakVfromSim);
	OutputTree->Branch("PeakVfromSim", &PeakVfromSim, "peakVfromSim[16][2]/D");
	OutputTree->Branch("thirdVPeakOverRMS_out", &thirdVPeakOverRMS_out, "thirdVPeakOverRMS_out[3]/D");

	// simulation parameters
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
		if(hasFilterFile){
			filterTree->GetEntry(event);
		}

		if (isSimulation == false){
			unixTime=(int)rawAtriEvPtr->unixTime;
			unixTimeUs=(int)rawAtriEvPtr->unixTimeUs;
			eventNumber=(int)rawAtriEvPtr->eventNumber;
		}else {
			eventNumber = event;
		}
	
		if (isSimulation == true){
			// bool foundNextSimEvent = false;
			// 
			// while (foundNextSimEvent == false){
				simTree->GetEntry(event);
				if (reportPtr->stations[0].Global_Pass <= 0 ) continue;

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
					// foundNextSimEvent=true;
				}
				// eventSim++;
			// }
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

		bool analyzeEvent = false;
		if (calpulserRunMode == 0) { analyzeEvent = true; } // analyze all events
		if (calpulserRunMode == 1 && isCalpulser == false && isSoftTrigger == false) { analyzeEvent = true; } // analyze only RF-triggered, non-calpulser events
		if (calpulserRunMode == 2 && isCalpulser == true) { analyzeEvent = true; } // analyze only calpulser events
		if (calpulserRunMode == 3 && isSoftTrigger == true) { analyzeEvent = true; } // analyze only software triggered  events
		if (analyzeEvent == true){

			weight_out = weight;
			if(!isSimulation)
				hasDigitizerError = !(qualCut->isGoodEvent(realAtriEvPtr));
			else
				hasDigitizerError=false;
			//if the event has a  digitizer error, skip it
			if(hasDigitizerError){
				OutputTree->Fill(); //fill this anyway with garbage
				if (isSimulation == false) {
					delete realAtriEvPtr;
				}
				continue; //don't do any further processing on this event
			}
			
			// double qualArray[4];
			// filterEvent * filterEventPtr = new filterEvent();
			// TSQualParam = -1.;
			// TSQualParam = filterEventPtr->getQualityParameter(grWaveformsRaw, ant_loc, station_num, qualArray);
			// delete filterEventPtr;
	
			xLabel = "Time (ns)"; yLabel = "Voltage (mV)";
			vector<TGraph*> grWaveformsRaw = makeGraphsFromRF(realAtriEvPtr, nGraphs, xLabel, yLabel, titlesForGraphs);
			vector<TGraph*> grWaveformsInt = makeInterpolatedGraphs(grWaveformsRaw, interpolationTimeStep, xLabel, yLabel, titlesForGraphs);
	
			vector<double> vVPeak;
			vector<double> vVPeakTimes;
	
			getAbsMaximum(grWaveformsInt, vVPeakTimes, vVPeak);
			copy(vVPeak.begin(), vVPeak.begin()+16, VPeak);
			copy(vVPeakTimes.begin(), vVPeakTimes.begin()+16, VPeakTimes);
	
	
			vector<double> vWaveformRMS;
			vWaveformRMS.resize(nGraphs);
			for (int i = 0; i < nGraphs; i++){
				if (RMS_SoftTrigger[i] == RMS_SoftTrigger[i]){
					vWaveformRMS[i] = RMS_SoftTrigger[i];
				} else {
					if (RMS_RFTrigger[i] == RMS_RFTrigger[i]){
						vWaveformRMS[i] = RMS_RFTrigger[i];
					}
				}
			}       
			copy(vWaveformRMS.begin(), vWaveformRMS.begin()+16, waveformRMS);
	
			vector<double> vWaveformRMS_50ns;
			getRMS(grWaveformsInt, vWaveformRMS_50ns, first50ns);
			copy(vWaveformRMS_50ns.begin(), vWaveformRMS_50ns.begin()+16, waveformRMS_50ns);
	
			vector<double> vVPeakOverRMS;
			vVPeakOverRMS.resize(16);
			for (int i = 0; i < 16; i++){
				VPeakOverRMS[i] = VPeak[i]/waveformRMS[i];
				vVPeakOverRMS[i] = VPeak[i]/waveformRMS[i];
			}
			vector<int> polarizations;
			vector<int> antenna_numbers;
			polarizations.resize(16);
			antenna_numbers.resize(16);
			vector< vector <double> > ant_loc;
			ant_loc.resize(16);
			for (int i = 0; i < 16; i++){
				ant_loc[i].resize(3);
				ant_loc[i][0] = geomTool->getStationInfo(station_num)->getAntennaInfo(i)->antLocation[0];
				ant_loc[i][1] = geomTool->getStationInfo(station_num)->getAntennaInfo(i)->antLocation[1];
				ant_loc[i][2] = geomTool->getStationInfo(station_num)->getAntennaInfo(i)->antLocation[2];
				polarizations[i] = (int)geomTool->getStationInfo(station_num)->getAntennaInfo(i)->polType;
				antenna_numbers[i]=i;
			}
	
			vector<double> vThirdVPeakOverRMS;
			getThirdVPeakOverRMS(vVPeakOverRMS, polarizations, antenna_numbers, chan_exclusion_list, vThirdVPeakOverRMS);
			for (int i = 0 ; i< 3; i++){
				thirdVPeakOverRMS_out[i] = vThirdVPeakOverRMS[i];
				// cout << thirdVPeakOverRMS[i] << endl;

			}


			// vector<double> chan_SNRs;
			// if(hasFilterFile){
			// 	filterTree->GetEntry(event);
			// 	for(int i=0; i<16; i++){
			// 		chan_SNRs.push_back(VPeakOverRMS[i]);
			// 		cout << event << endl;
			// 		// VPeakOverRMS[i]=0;
			// 		//printf("Event %d: The SNR for chan %d is %.2f \n",event,i,chan_SNRs[i]);
			// 	}
			// 	for(int ii = 0; ii < 3; ii++) {
			// 	    thirdVPeakOverRMS_out[ii] = thirdVPeakOverRMS[ii];
			// 	}		
			// }

			vector <int> chan_list_V;
			vector <int> chan_list_H;
			for(int chan=0; chan<=7; chan++){
				chan_list_V.push_back(chan);
				chan_list_H.push_back(chan+8);
			}
			double best_v_values[numRadiiScanned];
			for(int radiusBin=startingRadiusBin; radiusBin<startingRadiusBin + numRadiiScanned; radiusBin++){
				int radiusBin_adjusted = radiusBin-startingRadiusBin;
				cout << radiusBin << endl;
				for(int solNum = 0;solNum<2;solNum++){
					TH2D *map_V_raytrace = theCorrelators[radiusBin_adjusted]->getInterferometricMap_RT_select(settings, detector, realAtriEvPtr, Vpol, isSimulation, chan_list_V, solNum);
					TH2D *map_H_raytrace = theCorrelators[radiusBin_adjusted]->getInterferometricMap_RT_select(settings, detector, realAtriEvPtr, Hpol, isSimulation, chan_list_H, solNum);
					// cout << peakTheta_dir[radiusBin_adjusted][1] << endl;
					if(solNum==0){
						getCorrMapPeak_wStats(map_V_raytrace, peakTheta_dir[radiusBin_adjusted][0], peakPhi_dir[radiusBin_adjusted][0], peakCorr_dir[radiusBin_adjusted][0], minCorr_dir[radiusBin_adjusted][0], meanCorr_dir[radiusBin_adjusted][0], rmsCorr_dir[radiusBin_adjusted][0], peakSigma_dir[radiusBin_adjusted][0]);
						getCorrMapPeak_wStats(map_H_raytrace, peakTheta_dir[radiusBin_adjusted][1], peakPhi_dir[radiusBin_adjusted][1], peakCorr_dir[radiusBin_adjusted][1], minCorr_dir[radiusBin_adjusted][1], meanCorr_dir[radiusBin_adjusted][1], rmsCorr_dir[radiusBin_adjusted][1], peakSigma_dir[radiusBin_adjusted][1]);
					}
					
					else{
						getCorrMapPeak_wStats(map_V_raytrace, peakTheta_ref[radiusBin_adjusted][0], peakPhi_ref[radiusBin_adjusted][0], peakCorr_ref[radiusBin_adjusted][0], minCorr_ref[radiusBin_adjusted][0], meanCorr_ref[radiusBin_adjusted][0], rmsCorr_ref[radiusBin_adjusted][0], peakSigma_ref[radiusBin_adjusted][0]);
						getCorrMapPeak_wStats(map_H_raytrace, peakTheta_ref[radiusBin_adjusted][1], peakPhi_ref[radiusBin_adjusted][1], peakCorr_ref[radiusBin_adjusted][1], minCorr_ref[radiusBin_adjusted][1], meanCorr_ref[radiusBin_adjusted][1], rmsCorr_ref[radiusBin_adjusted][1], peakSigma_ref[radiusBin_adjusted][1]);
					}
					delete map_V_raytrace;
					delete map_H_raytrace;
				}
			}
			bool print_maps = false;
			deleteGraphVector(grWaveformsInt);
			deleteGraphVector(grWaveformsRaw);
			OutputTree->Fill();

			if (isSimulation == false) {
				delete realAtriEvPtr;
			}
		}
	}
	
	OutputFile->Write();
	OutputFile->Close();
	if(hasFilterFile)
		filterFile->Close();
	fp->Close();
	
	for (int i = startingRadiusBin; i < numRadiiScanned; i++){
		delete theCorrelators[i];
	}

	delete settings;

	cout<<endl;
	printf("Done! Run Number %d \n", runNum);
}
