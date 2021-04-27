////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////	v2_analysis_run_summary.cxx 
////	A23 diffuse, make a run summary
////
////	Nov 2018
////////////////////////////////////////////////////////////////////////////////

//Includes
#include <iostream>

//AraRoot Includes
#include "RawAtriStationEvent.h"
#include "UsefulAraStationEvent.h"
#include "UsefulAtriStationEvent.h"
#include "AraQualCuts.h"

//ROOT Includes
#include "TTree.h"
#include "TFile.h"
#include "TGraph.h"
#include "Math/Interpolator.h"
#include "Math/InterpolationTypes.h"

RawAtriStationEvent *rawAtriEvPtr;
UsefulAtriStationEvent *realAtriEvPtr;

#include "tools_inputParameters.h"
#include "tools_outputObjects.h"
#include "tools_runSummaryObjects.h"
#include "tools_WaveformFns.h"
#include "tools_PlottingFns.h"
#include "tools_Cuts.h"

TGraph *customInterpolation(TGraph *grIn, Double_t deltaT);

int main(int argc, char **argv)
{

	if(argc<5) {
		std::cout << "Usage\n" << argv[0] << " <simulation_flag> <station> <output directory> <input file> <pedestal file> \n";
		return -1;
	}
	isSimulation=atoi(argv[1]);
	int station_num=atoi(argv[2]);

	char *DataDirPath(getenv("DATA_DIR"));
	if (DataDirPath == NULL) std::cout << "Warning! $DATA_DIR is not set!" << endl;
	char *SimDirPath(getenv("SIM_DIR"));
	if (SimDirPath == NULL) std::cout << "Warning! $SIM_DIR is not set!" << endl;
	char *PedDirPath(getenv("PED_DIR"));
	if (PedDirPath == NULL) std::cout << "Warning! $DATA_DIR is not set!" << endl;

	numEvents = 0;
	numSoftTriggers = 0;
	numCalpulsers = 0;
	numRFTriggers = 0;

	int numAnts=16;
	double lowFreqLimit=120;
	double highFreqLimit=850.;
	int WaveformLength=2048;
	int newLength=(WaveformLength/2)+1;

	vector<double> RMS_SoftTrigger_total;
	RMS_SoftTrigger_total.resize(nGraphs);
	vector<double> RMS_Calpulser_total;
	RMS_Calpulser_total.resize(nGraphs);
	vector<double> RMS_RFTrigger_total;
	RMS_RFTrigger_total.resize(nGraphs);
	vector<double> RMS_All_total;
	RMS_All_total.resize(nGraphs);

	stringstream ss;
	string xLabel, yLabel;
	vector<string> titlesForGraphs;
	for (int i = 0; i < nGraphs; i++){
		ss.str("");
		ss << "Channel " << i;
		titlesForGraphs.push_back(ss.str());
	}

	TFile *fp = TFile::Open(argv[4]);
	if(!fp) {
		std::cerr << "Can't open file\n";
		return -1;
	}
	TTree *eventTree; 
		eventTree= (TTree*) fp->Get("eventTree");
		if(!eventTree) {
		std::cerr << "Can't find eventTree\n";
		return -1;
	}

	if(isSimulation){
		eventTree->SetBranchAddress("UsefulAtriStationEvent", &realAtriEvPtr);
		printf("Simulation; load useful event tree straight away \n");
	}
	else{
		eventTree->SetBranchAddress("event",&rawAtriEvPtr);
		printf("Data; load raw event tree \n");
	}

	AraQualCuts *qualCut = AraQualCuts::Instance(); //we also need a qual cuts tool

	double frequencyArray[newLength];
	double FFTre[16][newLength];
	double FFTim[16][newLength];
	double FFT[16][newLength];
	for(int j=0; j<newLength; j++){
		for(int i=0; i<16; i++){
			FFTre[i][j]=0;
			FFTim[i][j]=0;
			FFT[i][j]=0;
		}
		frequencyArray[j]=0;
	}
	int eventsIncludedCtr=0;

	Long64_t numEntries=eventTree->GetEntries();
	Long64_t starEvery=numEntries/100;
	if(starEvery==0) starEvery++;

	int runNum = getrunNum(argv[4]);
	printf("RunSummary Run Number %d \n", runNum);
	printf("Num entries is %d \n", numEntries);
	runNumber = runNum;

	AraEventCalibrator * calibrator = AraEventCalibrator::Instance();
	if(argc==6){
		calibrator->setAtriPedFile(argv[5], station_num);
	}
	else{
		if(!isSimulation){
			char ped_file_name[400];
			sprintf(ped_file_name,"%s/run_specific_peds/A%d/all_peds/event%d_specificPeds.dat",PedDirPath,station_num,runNum);
			calibrator->setAtriPedFile(ped_file_name,station_num); //because someone had a brain (!!), this will error handle itself if the pedestal doesn't exist
		}
		calibrator->setAtriPedFile("", station_num);
	}

	string runSummaryFilename = getRunSummaryFilename(station_num, argv[3], argv[4]);
	TFile *OutputFile = TFile::Open(runSummaryFilename.c_str(), "RECREATE");
	TTree* OutputTree=new TTree("SummaryTree", "SummaryTree");

	OutputTree->Branch("runNumber", &runNumber, "runNumber/I");
	OutputTree->Branch("numEvents", &numEvents, "numEvents/I");
	OutputTree->Branch("numRFTriggers", &numRFTriggers, "numRFTriggers/I");
	OutputTree->Branch("numSoftTriggers", &numSoftTriggers, "numSoftTriggers/I");
	OutputTree->Branch("numCalpulsers", &numCalpulsers, "numCalpulsers/I");

	OutputTree->Branch("RMS_SoftTrigger", &RMS_SoftTrigger, "RMS_SoftTrigger[20]/D");
	OutputTree->Branch("RMS_RFTrigger", &RMS_RFTrigger, "RMS_RFTrigger[20]/D");
	OutputTree->Branch("RMS_Calpulser", &RMS_Calpulser, "RMS_Calpulser[20]/D");
	OutputTree->Branch("RMS_All", &RMS_All, "RMS_All[20]/D");

	TTree *BaselineTree = new TTree("BaselineTree","BaselineTree");
	vector <TGraph*> average;
	average.resize(16);
	stringstream ss1;
	for(int i=0; i<16; i++){
		ss1.str(""); ss1<<"baselines_RF_chan_"<<i;
		BaselineTree->Branch(ss1.str().c_str(),&average[i]);
	}

	for(Long64_t event=0;event<numEntries;event++) {
		if(event%starEvery==0) {
			std::cerr << "*";       
		}

		eventTree->GetEntry(event);

		if (isSimulation == false){
			realAtriEvPtr = new UsefulAtriStationEvent(rawAtriEvPtr, AraCalType::kLatestCalib);
		}
		if (isSimulation){
			isCalpulser = false;
			isSoftTrigger = false;
			hasDigitizerError=false;
		} else{
			isCalpulser = rawAtriEvPtr->isCalpulserEvent();
			isSoftTrigger = rawAtriEvPtr->isSoftwareTrigger();
			hasDigitizerError = !(qualCut->isGoodEvent(realAtriEvPtr));	
		}

		//if the event has a  digitizer error, skip it
		if(hasDigitizerError){
			if (isSimulation == false) {
				// cout<<"Event "<<event<<" has a digitizer error, going to delete pointer..."<<endl;
				delete realAtriEvPtr;
			}
			continue; //don't do any further processing on this event
		}

		xLabel = "Time (ns)"; yLabel = "Voltage (mV)";
		vector<TGraph*> grWaveformsRaw = makeGraphsFromRF(realAtriEvPtr, nGraphs, xLabel, yLabel, titlesForGraphs);
   
		ss.str("");
		xLabel = "Time (ns)"; yLabel = "Voltage (mV)";
		vector<TGraph*> grWaveformsInt = makeInterpolatedGraphs(grWaveformsRaw, interpolationTimeStep, xLabel, yLabel, titlesForGraphs);
		
		ss.str("");
		vector<double> vWaveformRMS;
		getRMS(grWaveformsInt, vWaveformRMS, 0);

		if (isSoftTrigger == true){
			transform(RMS_SoftTrigger_total.begin(), RMS_SoftTrigger_total.end(), vWaveformRMS.begin(),
			RMS_SoftTrigger_total.begin(), std::plus<double>());
			numSoftTriggers++;
		}
		if (isCalpulser == true){
			transform(RMS_Calpulser_total.begin(), RMS_Calpulser_total.end(), vWaveformRMS.begin(),
			RMS_Calpulser_total.begin(), std::plus<double>());
			numCalpulsers++;
		}
		if (isCalpulser == false && isSoftTrigger == false){
			transform(RMS_RFTrigger_total.begin(), RMS_RFTrigger_total.end(), vWaveformRMS.begin(),
			RMS_RFTrigger_total.begin(), std::plus<double>());
			numRFTriggers++;
		}
		transform(RMS_All_total.begin(), RMS_All_total.end(), vWaveformRMS.begin(),
		RMS_All_total.begin(), std::plus<double>());
		numEvents++;

		//now to make a baseline

		if(!isCalpulser && !isSoftTrigger && !hasDigitizerError){

			for(int chan=0; chan<numAnts; chan++){
				TGraph *grInt = customInterpolation(grWaveformsRaw[chan],interpolationTimeStep);
				TGraph *grPad = FFTtools::padWaveToLength(grInt,WaveformLength); //pad
				double *getX = grPad->GetX();
				double deltaT = getX[1]-getX[0];
				while(grPad->GetN()<WaveformLength){
					double lastX = 0.;
					double lastY = 0.;
					grPad->GetPoint(grPad->GetN()-1,lastX,lastY);
					grPad->SetPoint(grPad->GetN(),lastX+deltaT,0);
				}
				double *getY = grPad->GetY();
				int length = grPad->GetN();

				FFTWComplex *theFFT = FFTtools::doFFT(length,getY);
				double deltaF = 1/(deltaT * length);
				deltaF*=1e3;

				for(int samp=0; samp<newLength; samp++){
					FFTre[chan][samp]+=pow(theFFT[samp].re,2.);
					FFTim[chan][samp]+=pow(theFFT[samp].im,2.);

					if(chan==0){
						if(samp==0) frequencyArray[samp]=0.;
						if(samp>0) frequencyArray[samp]=frequencyArray[samp-1]+deltaF;
					}
				}
				delete [] theFFT;
				delete grPad;
				delete grInt;
			}
			eventsIncludedCtr++;
		}

		deleteGraphVector(grWaveformsInt);
		deleteGraphVector(grWaveformsRaw);
		if (isSimulation == false) {
			delete realAtriEvPtr;
		}
	}

	cout << numRFTriggers << " : ";
	for (int i = 0; i < nGraphs; i++){
		RMS_RFTrigger_total[i] = RMS_RFTrigger_total[i]/(double)numRFTriggers;
		cout << RMS_RFTrigger_total[i] << " : "; 
		RMS_SoftTrigger_total[i] = RMS_SoftTrigger_total[i]/(double)numSoftTriggers;
		RMS_Calpulser_total[i] = RMS_Calpulser_total[i]/(double)numCalpulsers;
		RMS_All_total[i] = RMS_All_total[i]/(double)numEvents;
	}
	cout << endl;

	copy(RMS_All_total.begin(), RMS_All_total.begin()+16, RMS_All);
	copy(RMS_RFTrigger_total.begin(), RMS_RFTrigger_total.begin()+16, RMS_RFTrigger);
	copy(RMS_SoftTrigger_total.begin(), RMS_SoftTrigger_total.begin()+16, RMS_SoftTrigger);
	copy(RMS_Calpulser_total.begin(), RMS_Calpulser_total.begin()+16, RMS_Calpulser);

	//now compute the average baseline
	if(eventsIncludedCtr>0){

		for(int chan=0; chan<numAnts; chan++){
			for(int samp=0; samp<newLength;samp++){
				FFTre[chan][samp]=FFTre[chan][samp]/double(eventsIncludedCtr);
				FFTim[chan][samp]=FFTre[chan][samp]/double(eventsIncludedCtr);
				FFT[chan][samp]=sqrt(FFTre[chan][samp] + FFTim[chan][samp]);
				if(FFT[chan][samp]>0.)
					FFT[chan][samp] = 10.*log10(FFT[chan][samp]);
				if(frequencyArray[samp]<lowFreqLimit || frequencyArray[samp]>highFreqLimit){
					FFT[chan][samp]=0;
				}
			}
		}
		for(int chan=0; chan<16; chan++){
			vector <double> freq;
			vector <double> amps;
			for(int samp=0; samp<newLength; samp++){
				freq.push_back(frequencyArray[samp]);
				amps.push_back(FFT[chan][samp]);
			}
			average[chan]=new TGraph(newLength,&freq[0],&amps[0]);
		}
	}

	BaselineTree->Fill();
	OutputTree->Fill();
	OutputFile->Write();
	OutputFile->Close();

	fp->Close();
	delete fp;
	printf("Done! Run Number %d \n", runNum);
}

TGraph *customInterpolation(TGraph *grIn, Double_t deltaT)
{
	std::vector<double> tVec;
	std::vector<double> vVec;

	Int_t numIn=grIn->GetN();
	Double_t tIn,vIn;

	Double_t startTime=0;
	Double_t lastTime=0;
	for (int samp=0;samp<numIn;samp++) {
		grIn->GetPoint(samp,tIn,vIn);
		tVec.push_back(tIn);
		vVec.push_back(vIn);
		if(samp==0) startTime=tIn;
		lastTime=tIn;
	}
	if(tVec.size()<1) {
		std::cout << "Insufficent points for interpolation\n";
		return NULL;
	}

	ROOT::Math::Interpolator chanInterp(tVec,vVec,ROOT::Math::Interpolation::kAKIMA);
	Int_t roughPoints=Int_t((lastTime-startTime)/deltaT);

	Double_t *newTimes = new Double_t[roughPoints+1]; //Will change this at some point, but for now
	Double_t *newVolts = new Double_t[roughPoints+1]; //Will change this at some point, but for now
	Int_t numPoints=0;
	for(Double_t time=startTime;time<=lastTime;time+=deltaT) {
		newTimes[numPoints]=time;
		newVolts[numPoints]=chanInterp.Eval(time);
		numPoints++;
	}

	TGraph *grInt = new TGraph(numPoints,newTimes,newVolts);
	delete [] newTimes;
	delete [] newVolts;
	return grInt;
}
