////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////  analysis_allCuts.cxx
////  derive all analysis related variables in one go
////  Assembled by B. Clark. Made it functional by Jorge Torres.
////  Apr 30 2020
////////////////////////////////////////////////////////////////////////////////

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

RawAtriStationEvent *rawAtriEvPtr;
UsefulAtriStationEvent *realAtriEvPtr;

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

AraAntPol::AraAntPol_t Vpol = AraAntPol::kVertical;
AraAntPol::AraAntPol_t Hpol = AraAntPol::kHorizontal;

int main(int argc, char **argv){

	if(argc<7) {
		std::cout << "Usage\n" << argv[0] << " <simulation_flag> <station> <year/config> <run summary directory> <output directory> <input file> <pedestal file> \n";
		return -1;
	}

	/*
	arguments
	0: exec
	1: simulation (yes/no)
	2: station num (2/3)
	3: year/config
	4: run number
	5: output directory
	6: input file
	7: pedestal file
	*/

	isSimulation=atoi(argv[1]);
	int station_num=atoi(argv[2]);
	calpulserRunMode=0; //analyze all events
	int yearConfig=atoi(argv[3]);
	int runNum = getrunNum(argv[6]);
	if(isSimulation && yearConfig>5){
		std:cout<<"Warning! You have called for simulation with a config larger than 5, which cannot be true. Are you sure you didnt' accidentally use year instead of config?"<<endl;
		return -1;
	}

	// get the wavefront RMS cut parameters

	int thresholdBin_pol[] = {0,0};
	double wavefrontRMScut[] = {-1.3, -1.4};

	int thisConfiguration = yearConfig;
	if(!isSimulation){
		thisConfiguration = getConfig(station_num, runNum);
	}
	getWFRMSCutValues(station_num, thisConfiguration, thresholdBin_pol[0], thresholdBin_pol[1], wavefrontRMScut[0], wavefrontRMScut[1]);
	printf("Wavefront RMS cut values are vBin %d and hBin %d, vCut %.2f, hCut %.2f \n", thresholdBin_pol[0], thresholdBin_pol[1], wavefrontRMScut[0], wavefrontRMScut[1]);


	stringstream ss;
	string xLabel, yLabel;
	vector<string> titlesForGraphs;
	for (int i = 0; i < nGraphs; i++){
		ss.str("");
		ss << "Channel " << i;
		titlesForGraphs.push_back(ss.str());
	}

	AraGeomTool * geomTool = new AraGeomTool();
	AraQualCuts *qualCut = AraQualCuts::Instance();

	TFile *fp = TFile::Open(argv[6],"read");
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

	vector<vector<vector<vector<int> > > > Pairs = setupPairs(station_num); // face type, polarization, pair #, 2 antennas
	double weight;
	int unixTime;
	int unixTimeUs;
	int eventNumber;
	double maxPeakVfromSim;
	double PeakVfromSim[16][2];
	int Trig_Pass[16] = {0};

	if(isSimulation){
		eventTree->SetBranchAddress("UsefulAtriStationEvent", &realAtriEvPtr);
		eventTree->SetBranchAddress("weight", &weight);
		printf("Simulation; load useful event tree straight away \n");
	}
	else{
		eventTree->SetBranchAddress("event",&rawAtriEvPtr);
		printf("Data; load raw event tree \n");
	}

	Long64_t numEntries=eventTree->GetEntries();
	Long64_t starEvery=numEntries/80;
	if(starEvery==0) starEvery++;

	// int runNum = getrunNum(argv[6]);
	printf("Filter Run Number %d \n", runNum);
	printf("Num entries is %d \n", numEntries);

	string runSummaryFilename;
	if (isSimulation == false){
		runSummaryFilename = getRunSummaryFilename(station_num, argv[4], argv[6]);
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

	double SNR_for_WFRMS[16][2];
	double hitTimes_for_WFRMS[16][2];

	int dropBadChans=1;
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

	// list of what channels to exclude in finding the SNR of the event
	vector<int> chan_exclusion_list;
	if(station_num==2){
		// hpol channel 15
		chan_exclusion_list.push_back(15);
		printf("Station 2: Dropping ch 15\n");
	}
	else if(station_num==3){
		if(
			(!isSimulation && runNum>getA3BadRunBoundary())
			||
			(isSimulation && yearConfig>2)

		){
			printf("Station 3: Dropping ch 3, 7, 11, 15\n");
			chan_exclusion_list.push_back(3);
			chan_exclusion_list.push_back(7);
			chan_exclusion_list.push_back(11);
			chan_exclusion_list.push_back(15);
		}
	}
	// set up wavefront RMS arrays for what happens when we *drop* strings or channels
	double rms_pol_thresh_face_alternate_V[thresholdSteps][numFaces_new_V];
	double rms_pol_thresh_face_alternate_H[thresholdSteps][numFaces_new_H];
	char rms_title_V[300];
	char rms_title_H[300];

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

	int eventSim = 0;
	int start=0;

	for(Long64_t event=start;event<numEntries;event++) {

		if(event%starEvery==0) {
			std::cout << "*";
		}

		eventTree->GetEntry(event);
		if (isSimulation == false){
			unixTime=(int)rawAtriEvPtr->unixTime;
			unixTimeUs=(int)rawAtriEvPtr->unixTimeUs;
			eventNumber=(int)rawAtriEvPtr->eventNumber;
		} else{
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
							Trig_Pass[chan] = reportPtr->stations[0].strings[ii].antennas[i].Trig_Pass; //store if this channel triggered based on simulation
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

		weight_out = weight;
		if(!isSimulation)
		hasDigitizerError = !(qualCut->isGoodEvent(realAtriEvPtr));
		else
		hasDigitizerError=false;

		xLabel = "Time (ns)"; yLabel = "Voltage (mV)";
		vector<TGraph*> grWaveformsRaw = makeGraphsFromRF(realAtriEvPtr, nGraphs, xLabel, yLabel, titlesForGraphs);
		ss.str("");

		for (int i = 0; i < 16; i++){
			waveformLength[i] = grWaveformsRaw[i]->GetN();
		}

		if(hasDigitizerError){
			// OutputTree->Fill(); //fill this anyway with garbage
			deleteGraphVector(grWaveformsRaw);
			if (isSimulation == false) {
				delete realAtriEvPtr;
			}
			continue; //don't do any further processing on this event
		}

		xLabel = "Time (ns)"; yLabel = "Voltage (mV)";
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

		vector<double> vThirdVPeakOverRMS;
		getThirdVPeakOverRMS(vVPeakOverRMS, polarizations, antenna_numbers, chan_exclusion_list, vThirdVPeakOverRMS);
		for (int i = 0 ; i< 3; i++){
			thirdVPeakOverRMS[i] = vThirdVPeakOverRMS[i];
		}

		xLabel = "Time (ns)"; yLabel = "Integrated Power (arb units)";
		vector<TGraph*> grIntPower = makeIntegratedBinPowerGraphs(grWaveformsInt, numBinsToIntegrate, xLabel, yLabel, titlesForGraphs);
		ss.str("");

		vector<double> hitTimes;
		vector<double> peakIntPowers;
		getAbsMaximum(grIntPower, hitTimes, peakIntPowers);

		vector<vector<double> > vvHitTimes;
		vector<vector<double> > vvPeakIntPowers;
		getAbsMaximum_N(grIntPower, numSearchPeaks, 5.0, vvHitTimes, vvPeakIntPowers);

		vector<double> peakIntRMS;
		for (int i = 0; i < peakIntPowers.size(); i++){
			peakIntRMS.push_back(sqrt(peakIntPowers[i]/numBinsToIntegrate));
		}

		for (int i = 0; i < 16; i++){
			avgPeakPower_5ns[i] = peakIntPowers[i]/numBinsToIntegrate;
			peakPowerTimes[i] = hitTimes[i];
		}

		vector<double> RMS_10overRMS;
		for (int i = 0; i < 16; i++){
			RMS_10overRMS.push_back(sqrt(avgPeakPower_5ns[i])/waveformRMS[i]);
		}

		vector<vector<double> > vvRMS_10overRMS;
		vvRMS_10overRMS.resize(16);
		for (int i = 0; i < 16; i++){
			vvRMS_10overRMS[i].resize(vvPeakIntPowers[i].size());
			for (int j = 0; j < vvPeakIntPowers[i].size(); j++){
				vvRMS_10overRMS[i][j] = sqrt(vvPeakIntPowers[i][j]/numBinsToIntegrate)/waveformRMS[i];

				// additionally store the WFRMS SNRs and hitTimes (cuz why not, we're already storing everything else...)
				SNR_for_WFRMS[i][j] = vvRMS_10overRMS[i][j];
				hitTimes_for_WFRMS[i][j] = vvHitTimes[i][j];
			}
		}


		//first apply the filter with *no* dropped channels
		vector<vector<vector<vector<int> > > > faces = setupFaces(station_num);
		for (int thresholdBin = 0; thresholdBin < thresholdSteps; thresholdBin++){
			double threshold = thresholdMin + thresholdStep*(double)thresholdBin;
			// if(thresholdBin==0) printf("     4-String Threshold is %.2f \n", threshold);

			vector<double> rms_faces_V = getRms_Faces_Thresh_N(vvHitTimes, vvRMS_10overRMS, threshold, 0, faces, ant_loc);
			vector<double> rms_faces_H = getRms_Faces_Thresh_N(vvHitTimes, vvRMS_10overRMS, threshold, 1, faces, ant_loc);

			for (int i = 0; i < numFaces; i++){
				// if(thresholdBin==0) printf("          4-string face %d value is  is %.4f \n", i, rms_faces_V[i]);
				rms_pol_thresh_face_V[thresholdBin][i] = rms_faces_V[i];
				rms_pol_thresh_face_H[thresholdBin][i] = rms_faces_H[i];
			}

		} // end threshold scan

		//then apply the filter over again *with* dropped channels
		vector<vector<vector<vector<int> > > > faces_drop = setupFaces(station_num, dropBadChans);
		for (int thresholdBin = 0; thresholdBin < thresholdSteps; thresholdBin++){
			double threshold = thresholdMin + thresholdStep*(double)thresholdBin;
			// if(thresholdBin==0) printf("     3-String Threshold is %.2f \n", threshold);

			vector<double> rms_faces_V_alternate = getRms_Faces_Thresh_N(vvHitTimes, vvRMS_10overRMS, threshold, 0, faces_drop, ant_loc);
			vector<double> rms_faces_H_alternate = getRms_Faces_Thresh_N(vvHitTimes, vvRMS_10overRMS, threshold, 1, faces_drop, ant_loc);

			for (int i = 0; i < numFaces_new_V; i++){
				rms_pol_thresh_face_alternate_V[thresholdBin][i] = rms_faces_V_alternate[i];
				// if(thresholdBin==0) printf("          3-string face %d value is %.4f \n", i, rms_faces_V_alternate[i]);
			}
			for (int i = 0; i < numFaces_new_H; i++){
				rms_pol_thresh_face_alternate_H[thresholdBin][i] = rms_faces_H_alternate[i];
			}
		} // end threshold scan

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
		sort(rms_faces_V.begin(), rms_faces_V.end());
		sort(rms_faces_H.begin(), rms_faces_H.end());

		double bestFaceRMS[2];
		bool passesWavefrontRMS[2];
		bestFaceRMS[0]=rms_faces_V[0];
		bestFaceRMS[1]=rms_faces_H[0];

		// if it's log10(wavefront RMS) passes cut, we're good to go
		if(log(bestFaceRMS[0])/log(10) >= wavefrontRMScut[0]){
				passesWavefrontRMS[0]=false;
		}
		if(log(bestFaceRMS[1])/log(10) >= wavefrontRMScut[1]){
				passesWavefrontRMS[1]=false;
		}
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
			){                      // drop string four

				chan_list_V.erase(remove(chan_list_V.begin(), chan_list_V.end(), 3), chan_list_V.end());
				chan_list_V.erase(remove(chan_list_V.begin(), chan_list_V.end(), 7), chan_list_V.end());
				chan_list_H.erase(remove(chan_list_H.begin(), chan_list_H.end(), 11), chan_list_H.end());
				chan_list_H.erase(remove(chan_list_H.begin(), chan_list_H.end(), 15), chan_list_H.end());
			}
		}

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


		// now check for surface in the 300m interferometery with all channels
		// this means surface (peakTheta_300m[0]>=17 || peakTheta_300m[1]>=17)
		// being surface in either polarization is bad
		bool isSurface = (peakTheta_300m[0]>=17 || peakTheta_300m[1]>=17);

		// then we check for if it's a cal pulser
		bool isCP5;
		bool isCP6;
		for(int i=0; i<2; i++){ // loop polarizations
			identifyCalPulser(station_num, yearConfig, peakTheta_41m[i], peakPhi_41m[i], isCP5, isCP6);
		}

		// also do top-face only reconstruction
		chan_list_V.clear();
		chan_list_V.push_back(0);
		chan_list_V.push_back(1);
		chan_list_V.push_back(2);

		chan_list_H.clear();
		chan_list_H.push_back(8);
		chan_list_H.push_back(9);
		chan_list_H.push_back(10);
		// this looks weird here because we're aiming for what channels to *include*
		if(
			!(
				dropBadChans
				&& station_num==3
				&& (
					(!isSimulation && runNum>getA3BadRunBoundary())
					||
					(isSimulation && yearConfig>2)
				)
			)
		){
			chan_list_V.push_back(3);
			chan_list_H.push_back(11);
		}
		TH2D *map_300m_top_V = theCorrelators[1]->getInterferometricMap_RT_select_NewNormalization_SNRweighted(settings, detector, realAtriEvPtr, Vpol, isSimulation, chan_list_V, chan_SNRs, solNum);
		TH2D *map_300m_top_H = theCorrelators[1]->getInterferometricMap_RT_select_NewNormalization_SNRweighted(settings, detector, realAtriEvPtr, Hpol, isSimulation, chan_list_H, chan_SNRs, solNum);

        int PeakTheta_Recompute_300m_top_V;
        int PeakPhi_Recompute_300m_top_V;
        double PeakCorr_Recompute_300m_top_V;
        getCorrMapPeak(map_300m_top_V,PeakTheta_Recompute_300m_top_V,PeakPhi_Recompute_300m_top_V,PeakCorr_Recompute_300m_top_V);


        int PeakTheta_Recompute_300m_top_H;
        int PeakPhi_Recompute_300m_top_H;
        double PeakCorr_Recompute_300m_top_H;
        getCorrMapPeak(map_300m_top_H,PeakTheta_Recompute_300m_top_H,PeakPhi_Recompute_300m_top_H,PeakCorr_Recompute_300m_top_H);

        // top face is polarization specific, and cut is at 37
        bool failsTopV=false;
        if(PeakTheta_Recompute_300m_top_V>=37) failsTopV=true;
        bool failsTopH=false;
        if(PeakTheta_Recompute_300m_top_H>=37) failsTopH=true;


        // finally we do the 2D cut which needs the SNR and correlation values
        double selected_slopes[2];
        double selected_intercepts[2];
        getRCutValues(station_num, yearConfig, 0, selected_slopes[0], selected_intercepts[0]);
        getRCutValues(station_num, yearConfig, 1, selected_slopes[1], selected_intercepts[1]);


        double snr_val[2];
        double corr_val[2];
        snr_val[0] = thirdVPeakOverRMS[0];
        snr_val[1] = thirdVPeakOverRMS[1];
        corr_val[0] = peakCorr_300m[0];
        corr_val[1] = peakCorr_300m[1];

        double this_y_val[2];
        bool failsRcut[2]; // does it fail the rcut
        for(int pol=0; pol<2; pol++){
        	this_y_val[pol] = corr_val[pol]*selected_slopes[pol] + selected_intercepts[pol];
        	if(snr_val[pol]<this_y_val[pol]){
        		failsRcut[pol]=true;
        	}
        }

		delete map_V_raytrace_41;
		delete map_V_raytrace_300;
		delete map_H_raytrace_41;
		delete map_H_raytrace_300;

		deleteGraphVector(grIntPower);
		deleteGraphVector(grWaveformsInt);
		deleteGraphVector(grWaveformsRaw);
		if (isSimulation == false) {
			delete realAtriEvPtr;
		}
	}//end loop over events
	for(int jj=0;jj<2;jj++) delete theCorrelators[jj];
  return 0;
}
