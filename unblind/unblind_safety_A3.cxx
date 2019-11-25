////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////	unblind_safety_A3.cxx
////	unblind the safety stripes
////  Adapted from B. Clark's unblind_safety_A3.cxx code
////	Jorge Torres
////  Nov 2019
////////////////////////////////////////////////////////////////////////////////

//C++
#include <algorithm>
#include <iostream>
#include <fstream>
#include <sstream>
#include <math.h>
#include <sys/stat.h>

//ROOT Includes
#include "TTree.h"
#include "TFile.h"
#include "TH2D.h"
#include "TCanvas.h"
#include "TStyle.h"
#include "TF1.h"
#include "TLegend.h"
#include "TRandom3.h"
#include "TChain.h"

//AraRoot includes
#include "RawAtriStationEvent.h"
#include "UsefulAtriStationEvent.h"
#include "AraQualCuts.h"

// analysis custom
#include "tools_Cuts.h"
#include "tools_Stats.h"
#include "tools_CommandLine.h"
#include "tools_outputObjects.h"
#include "tools_PlottingFns.h"
#include "tools_RecoFns.h"

// for ray trace correlator
#include "Settings.h"
#include "Event.h"
#include "Detector.h"
#include "Report.h"
#include "RayTraceCorrelator.h"

AraAntPol::AraAntPol_t Vpol = AraAntPol::kVertical;
AraAntPol::AraAntPol_t Hpol = AraAntPol::kHorizontal;

using namespace std;

int PlotThisEvent(int station, int config, int runNum, int event, int problempol);
void configure(TH1D *gr);

int main(int argc, char **argv)
{

	TH1D *num_samps[16];
	TH1D *num_samps_special[16];
	for(int i=0; i<16; i++){
		num_samps[i] = new TH1D("","",100,0,4000);
		num_samps_special[i] = new TH1D("","",100,0,4000);
	}

	time_t time_now = time(0); //get the time now
	tm *time = localtime(&time_now);
	int year_now = time -> tm_year + 1900;
	int month_now = time -> tm_mon + 1;
	int day_now = time -> tm_mday;

	stringstream ss;
	gStyle->SetOptStat(0);

	char *plotPath(getenv("PLOT_PATH"));
	if (plotPath == NULL) std::cout << "Warning! $PLOT_PATH is not set!" << endl;

	if(argc<3){
		cout<< "Usage\n" << argv[0] << " <1-station> <2-config> <100 or 10> <isOrg>"<<endl;;
		return -1;
	}
	int station = atoi(argv[1]);
	int config = atoi(argv[2]);
	int full_or_partial = atoi(argv[3]);
	int isOrg = atoi(argv[4]);

	if(station!=2 && station!=3){
		printf("No good! You asked for station %d, but this code only works for stations 2 and 3 \n",station);
		return -1;
	}

	double side_cut_corr[2] = {0.005, 0.004}; // in corr, side region is <=0.005 for V and <=0.004 in H
	double side_cut_snr[2] = {4.,4.}; // in snr, side region is <=4 in V and H

	vector<int> BadRunList=BuildBadRunList(station);

	int numTotal=0;

	// need to be able to make the final 2D distribution
	double max=0.05;
	TH2D *h2SNRvsCorr[2]; // SNR on Y axis, Corr on X axis, like in the TB
	h2SNRvsCorr[0]=new TH2D("","V Data",100,0,max,300,0,30);
	h2SNRvsCorr[1]=new TH2D("","H Data",100,0,max,300,0,30);

	TChain dataVTree("VTree");
	TChain dataHTree("HTree");
	TChain dataAllTree("AllTree");
	TChain dataRecoTree("OutputTreeReco");
	TChain dataFilterTree("OutputTree");
	char the_data[500];

	if(full_or_partial==100){
		// use the 100pct sample
		// sprintf(the_data,"/fs/project/PAS0654/ARA_DATA/A23/100pct_try2/ValsForCuts/A%d/c%d/cutvals_drop_FiltSurface_snrbins_0_0_wfrmsvals_-1.3_-1.4_run_*.root",station,config);

	}
	if(full_or_partial==10 && isOrg==1){
		// use the *original* 10pct sample from optimization
		sprintf(the_data,"/fs/project/PAS0654/ARA_DATA/A23/10pct_redo/ValsForCuts/A%d/c%d/cutvals_drop_FiltSurface_snrbins_0_0_wfrmsvals_-1.3_-1.4_run_*.root",station,config);
	}
	if(full_or_partial==10 && isOrg==0){
		// use the *new* 10pct sample from the slightly revised code base
		sprintf(the_data,"/fs/project/PAS0654/ARA_DATA/A23/10pct_verify_try2/ValsForCuts/A%d/c%d/cutvals_drop_FiltSurface_snrbins_0_0_wfrmsvals_-1.3_-1.4_run_*.root",station,config);
	}

	printf("The data: %s\n", the_data);

	sprintf(the_data,"/fs/project/PAS0654/ARA_DATA/A23/100pct_try2/ValsForCuts/A%d/c%d/cutvals_drop_FiltSurface_snrbins_0_0_wfrmsvals_-1.3_-1.4_run_4111.root",station,config);
	dataVTree.Add(the_data);
	dataHTree.Add(the_data);
	dataAllTree.Add(the_data);
	dataFilterTree.Add(the_data);

	sprintf(the_data,"/fs/project/PAS0654/ARA_DATA/A23/100pct_try2/ValsForCuts/A%d/c%d/cutvals_drop_FiltSurface_snrbins_0_0_wfrmsvals_-1.3_-1.4_run_4837.root",station,config);
	dataVTree.Add(the_data);
	dataHTree.Add(the_data);
	dataAllTree.Add(the_data);
	dataFilterTree.Add(the_data);

	sprintf(the_data,"/fs/project/PAS0654/ARA_DATA/A23/100pct_try2/ValsForCuts/A%d/c%d/cutvals_drop_FiltSurface_snrbins_0_0_wfrmsvals_-1.3_-1.4_run_5660.root",station,config);
	dataVTree.Add(the_data);
	dataHTree.Add(the_data);
	dataAllTree.Add(the_data);
	dataFilterTree.Add(the_data);

	sprintf(the_data,"/fs/project/PAS0654/ARA_DATA/A23/100pct_try2/ValsForCuts/A%d/c%d/cutvals_drop_FiltSurface_snrbins_0_0_wfrmsvals_-1.3_-1.4_run_5669.root",station,config);
	dataVTree.Add(the_data);
	dataHTree.Add(the_data);
	dataAllTree.Add(the_data);
	dataFilterTree.Add(the_data);

	sprintf(the_data,"/fs/project/PAS0654/ARA_DATA/A23/100pct_try2/ValsForCuts/A%d/c%d/cutvals_drop_FiltSurface_snrbins_0_0_wfrmsvals_-1.3_-1.4_run_5676.root",station,config);
	dataVTree.Add(the_data);
	dataHTree.Add(the_data);
	dataAllTree.Add(the_data);
	dataFilterTree.Add(the_data);

	sprintf(the_data,"/fs/project/PAS0654/ARA_DATA/A23/100pct_try2/ValsForCuts/A%d/c%d/cutvals_drop_FiltSurface_snrbins_0_0_wfrmsvals_-1.3_-1.4_run_5679.root",station,config);
	dataVTree.Add(the_data);
	dataHTree.Add(the_data);
	dataAllTree.Add(the_data);
	dataFilterTree.Add(the_data);

	sprintf(the_data,"/fs/project/PAS0654/ARA_DATA/A23/100pct_try2/ValsForCuts/A%d/c%d/cutvals_drop_FiltSurface_snrbins_0_0_wfrmsvals_-1.3_-1.4_run_6171.root",station,config);
	dataVTree.Add(the_data);
	dataHTree.Add(the_data);
	dataAllTree.Add(the_data);
	dataFilterTree.Add(the_data);

	int numDataEvents = dataVTree.GetEntries();
	// numDataEvents=100;

	// do this inside brackets for scoping power and re-use of identical variable names when it comes time for simulation to happen
	{

		double corr_val[2];
		double snr_val[2];
		int WFRMS[2];
		int theta_300[2];
		int phi_300[2];
		int theta_41[2];
		int phi_41[2];

		int Refilt[2];
		dataVTree.SetBranchAddress("Refilt_V",&Refilt[0]);
		dataHTree.SetBranchAddress("Refilt_H",&Refilt[1]);

		dataVTree.SetBranchAddress("corr_val_V_new",&corr_val[0]);
		dataVTree.SetBranchAddress("snr_val_V_new",&snr_val[0]);
		dataVTree.SetBranchAddress("wfrms_val_V_new",&WFRMS[0]);
		dataVTree.SetBranchAddress("theta_300_V_new",&theta_300[0]);
		dataVTree.SetBranchAddress("theta_41_V_new",&theta_41[0]);
		dataVTree.SetBranchAddress("phi_300_V_new",&phi_300[0]);
		dataVTree.SetBranchAddress("phi_41_V_new",&phi_41[0]);

		dataHTree.SetBranchAddress("corr_val_H_new",&corr_val[1]);
		dataHTree.SetBranchAddress("snr_val_H_new",&snr_val[1]);
		dataHTree.SetBranchAddress("wfrms_val_H_new",&WFRMS[1]);
		dataHTree.SetBranchAddress("theta_300_H_new",&theta_300[1]);
		dataHTree.SetBranchAddress("theta_41_H_new",&theta_41[1]);
		dataHTree.SetBranchAddress("phi_300_H_new",&phi_300[1]);
		dataHTree.SetBranchAddress("phi_41_H_new",&phi_41[1]);

		int isCal;
		int isSoft;
		int isShort;
		int isCW;
		int isNewBox;

		dataAllTree.SetBranchAddress("cal",&isCal);
		dataAllTree.SetBranchAddress("soft",&isSoft);
		dataAllTree.SetBranchAddress("short",&isShort);
		dataAllTree.SetBranchAddress("CW",&isCW);
		dataAllTree.SetBranchAddress("box",&isNewBox);

		int isSurf[2]; // a surface event after filtering?
		int isSurfEvent_top[2]; // a top event?

		dataAllTree.SetBranchAddress("surf_V_new",&isSurf[0]);
		dataAllTree.SetBranchAddress("surf_H_new",&isSurf[1]);
		dataAllTree.SetBranchAddress("surf_top_V",&isSurfEvent_top[0]);
		dataAllTree.SetBranchAddress("surf_top_H",&isSurfEvent_top[1]);

		int isBadEvent;
		double weight;
		int unixTime;
		int isFirstFiveEvent;
		int hasBadSpareChanIssue;
		int hasBadSpareChanIssue2;
		int runNum;
		int eventNumber;
    bool isSpikey;
    bool isCliff;
    bool OutofBandIssue;
    bool bad_v2;
    bool isRFEvent;
    bool isPayloadBlast2;
    int box300;

		dataAllTree.SetBranchAddress("bad",&isBadEvent);
		dataAllTree.SetBranchAddress("weight",&weight);
		dataAllTree.SetBranchAddress("unixTime",&unixTime);
		dataAllTree.SetBranchAddress("isFirstFiveEvent",&isFirstFiveEvent);
		dataAllTree.SetBranchAddress("hasBadSpareChanIssue",&hasBadSpareChanIssue);
		dataAllTree.SetBranchAddress("hasBadSpareChanIssue2",&hasBadSpareChanIssue2);
		dataAllTree.SetBranchAddress("runNum",&runNum);
		dataAllTree.SetBranchAddress("eventNumber",&eventNumber);
    dataAllTree.SetBranchAddress("isSpikey",&isSpikey);
    dataAllTree.SetBranchAddress("isCliff",&isCliff);
    dataAllTree.SetBranchAddress("OutofBandIssue",&OutofBandIssue);
    dataAllTree.SetBranchAddress("bad_v2",&bad_v2);
    dataAllTree.SetBranchAddress("isRFEvent",&isRFEvent);
    dataAllTree.SetBranchAddress("isPayloadBlast2",&isPayloadBlast2);
    dataAllTree.SetBranchAddress("box300",&box300);

		double frac_of_power_notched_V[8];
		double frac_of_power_notched_H[8];

		stringstream ss;
		for(int i=0; i<8; i++){
			ss.str("");
			ss<<"PowerNotch_Chan"<<i;
			dataVTree.SetBranchAddress(ss.str().c_str(),&frac_of_power_notched_V[i]);
		}
		for(int i=8; i<16; i++){
			ss.str("");
			ss<<"PowerNotch_Chan"<<i;
			dataHTree.SetBranchAddress(ss.str().c_str(),&frac_of_power_notched_H[i-8]);
		}

		double VPeakOverRMS[16];
		int waveformLength[16];
		dataFilterTree.SetBranchAddress("VPeakOverRMS",&VPeakOverRMS);
		dataFilterTree.SetBranchAddress("waveformLength",&waveformLength);

		int numEntries = dataVTree.GetEntries();
		numTotal+=numEntries;

		dataAllTree.GetEvent(0);
		int currentRunNum = runNum;
		bool isThisABadRun = isBadRun(station,runNum,BadRunList);
    bool isThisASoftDomRun;

		for(int event=0; event<numDataEvents; event++){
			dataVTree.GetEvent(event);
			dataHTree.GetEvent(event);
			dataAllTree.GetEvent(event);
			dataFilterTree.GetEvent(event);

			if(runNum!=currentRunNum){
				currentRunNum=runNum;

        isThisASoftDomRun = isSoftwareDominatedRun("/users/PCON0003/cond0068/ARA/AraRoot/analysis/a23_analysis_tools", station, runNum);
        if(isThisASoftDomRun) printf(RED"run:%i"RESET,runNum);

				isThisABadRun = isBadRun(station,runNum, BadRunList);
				if(isThisABadRun){
					printf(RED"*"RESET);
					// printf("     Yup, run %d is bad \n",runNum);
				}
				else{
					printf(GREEN"*"RESET);
				}

			}

			for(int i=0; i<16; i++){
				num_samps[i]->Fill(waveformLength[i]);
			}

			// continue;

			if( isSoft || isBadEvent || hasBadSpareChanIssue || hasBadSpareChanIssue2 || isFirstFiveEvent || isShort || isCal || isThisABadRun || isThisASoftDomRun|| isSpikey || isCliff || OutofBandIssue || bad_v2 || isPayloadBlast2 || box300){
				continue;
			}
			if(isBadLivetime(station,unixTime)){
				continue;
			}
			for(int pol=0; pol<2; pol++){
				if(!WFRMS[pol] && !isNewBox && !isSurf[0] && !isSurf[1] && !isSurfEvent_top[pol]){
					bool failsCWPowerCut=false;
					if(Refilt[pol] && !WFRMS[pol]){
						vector<double> frac;
						for(int i=0; i<8; i++){
							if(pol==0) frac.push_back(frac_of_power_notched_V[i]);
							else if(pol==1) frac.push_back(frac_of_power_notched_H[i]);
						}
						sort(frac.begin(), frac.end(), std::greater<double>());
						if(frac[2]>0.06){
							failsCWPowerCut=true;
						}
					} //refiltered?
					if(!failsCWPowerCut){
						double which_corr_to_use = corr_val[pol];
						// now, we only plot if the event is in the "safety cut" region
						if( which_corr_to_use <=side_cut_corr[pol] || snr_val[pol]<=side_cut_snr[pol] ){
							h2SNRvsCorr[pol]->Fill(which_corr_to_use,snr_val[pol],weight);
						}


						if(which_corr_to_use<=side_cut_corr[pol]){
							if(snr_val[pol]>8){

								// dataFilterTree.GetEvent(event);

								// vector<double> chan_SNRs;
								// for(int i=0; i<16; i++){
								// 	chan_SNRs.push_back(VPeakOverRMS[i]);
								// 	printf("Chan %d SNR is %.2f \n", i, chan_SNRs[i]);
								// }

							// print the event out so we can look at it
							// there should be two such events in config 3
							// and maybe 7 or 8 in config
							printf(BLUE"\n Run %d, Event %d, pol %d, unixTime %d, reco theta %d, phi %d, Refilt status %d, corr is %.4f \n"RESET, runNum, eventNumber, pol, unixTime, theta_300[pol], phi_300[pol], Refilt[pol], corr_val[pol]);
							PlotThisEvent(station, config, runNum, eventNumber, pol);

							}
						}
					}// not failing CW power cut?
				}// passes rest of analysis (not WFRMS, box, surface)
			}// loop over polarizations
		}// loop over events
	}
	std::cout<<endl;

	stringstream ss1;
	vector<string> titlesForGraphs;
	for (int i = 0; i < 16; i++){
		ss1.str("");
		ss1 << "Channel " << i;
		titlesForGraphs.push_back(ss1.str());
	}


	TCanvas *cSamps = new TCanvas("","",2.1*850,2.1*850);
	cSamps->Divide(4,4);
	for(int i=0; i<16; i++){
		cSamps->cd(i+1);
		configure(num_samps[i]);
		// num_samps[i]->GetYaxis()->SetRangeUser(0.1,2e7);
		// num_samps[i]->GetXaxis()->SetRangeUser(0,750);

		gPad->SetTopMargin(0.1);
		gPad->SetRightMargin(0.03);
		gPad->SetLeftMargin(0.12);
		gPad->SetBottomMargin(0.11);

		num_samps[i]->Draw("");
		num_samps[i]->GetXaxis()->SetTitle("Number of Samples");
		num_samps[i]->GetYaxis()->SetTitle("Number of Events");
		num_samps_special[i]->Draw("same");
		num_samps_special[i]->SetLineColor(kRed);
		gPad->SetLogy();

		double total_num = num_samps[i]->Integral();
		TAxis *xaxis = num_samps[i]->GetXaxis();
		Int_t binx_start = xaxis->FindBin(2100);
		Int_t binx_end = xaxis->FindBin(3500);

		double above = num_samps[i]->Integral(binx_start, binx_end);
		printf("Total %7.1f, Above %7.1f, percentage %1.4f \n", total_num, above, 100.*above/total_num);
		num_samps[i]->SetTitle(titlesForGraphs[i].c_str());

	}
	char thistitle[300];
	sprintf(thistitle, "%s/%d.%d.%d_A%d_%d_%dEvents_NumSamps.png",plotPath,year_now,month_now,day_now,station,config,int(numTotal));
	cSamps->SaveAs(thistitle);
	delete cSamps;


	vector<TGraph*> cut_lines;
	for(int pol=0; pol<2; pol++){
		vector <double> x_vals_for_line;
		vector <double> y_vals_for_line;
		double rcut_slope;
		double rcut_intercept;
		getRCutValues(station, config, pol, rcut_slope, rcut_intercept);
		for(double x=0; x<0.020; x+=0.00001){
			double y_val = (rcut_slope * x ) + rcut_intercept;
			x_vals_for_line.push_back(x);
			y_vals_for_line.push_back(y_val);
		}
		cut_lines.push_back(new TGraph(x_vals_for_line.size(), &x_vals_for_line[0], &y_vals_for_line[0]));
	}

	// now to actually draw the safety cut lines
	double vert_cuts[2] = {side_cut_corr[0], side_cut_corr[1]};
	vector<TGraph*> vert_lines;
	for(int pol=0; pol<2; pol++){
		vector <double> x_vals_for_line;
		vector <double> y_vals_for_line;
		for(double y=0; y<30; y+=1.){
			y_vals_for_line.push_back(y);
			x_vals_for_line.push_back(vert_cuts[pol]);
		}
		vert_lines.push_back(new TGraph(x_vals_for_line.size(), &x_vals_for_line[0], &y_vals_for_line[0]));
	}

	double horz_cuts[2] = {side_cut_snr[0], side_cut_snr[1]};
	vector<TGraph*> horz_lines;
	for(int pol=0; pol<2; pol++){
		vector <double> x_vals_for_line;
		vector <double> y_vals_for_line;
		for(double x=0; x<0.05; x+=0.01){
			y_vals_for_line.push_back(horz_cuts[pol]);
			x_vals_for_line.push_back(x);
		}
		horz_lines.push_back(new TGraph(x_vals_for_line.size(), &x_vals_for_line[0], &y_vals_for_line[0]));
	}

	// okay, now save out the 2D histogram
	TCanvas *cSNRvsCorr = new TCanvas("","",2.1*850, 850);
	cSNRvsCorr->Divide(2,1);
	for(int pol=0; pol<2; pol++){
		cSNRvsCorr->cd(pol+1);
		h2SNRvsCorr[pol]->Draw("colz");
		h2SNRvsCorr[pol]->GetYaxis()->SetTitle("3rd Highest VPeak/RMS");
		h2SNRvsCorr[pol]->GetXaxis()->SetTitle("Peak Corr");
		gPad->SetLogz();
		cut_lines[pol]->Draw("same");
		cut_lines[pol]->SetLineColor(kRed);
		vert_lines[pol]->Draw("same");
		vert_lines[pol]->SetLineColor(kBlue);
		horz_lines[pol]->Draw("same");
		horz_lines[pol]->SetLineColor(kBlue);
	}
	char title[300];
	if(full_or_partial==100)
	  sprintf(title, "%s/unblind/A%d_config%d_%dEvents_UnblindSides_SNRvsCorr100.png",plotPath,station,config,numTotal);
	else if(full_or_partial==10 && isOrg==0)
	  sprintf(title, "%s/unblind/A%d_config%d_%dEvents_UnblindSides_SNRvsCorr10_New.png",plotPath,station,config,numTotal);
	else if(full_or_partial==10 && isOrg==1)
	  sprintf(title, "%s/unblind/A%d_config%d_%dEvents_UnblindSides_SNRvsCorr10_Org.png",plotPath,station,config,numTotal);
	cSNRvsCorr->SaveAs(title);
	delete cSNRvsCorr;
}

// int PlotThisEvent(int station, int config, int runNum, int event, int problempol, Settings *settings, Detector *detector, RayTraceCorrelator *theCorrelators[2]){
int PlotThisEvent(int station, int config, int runNum, int event, int problempol){
	time_t time_now = time(0); //get the time now
	tm *time = localtime(&time_now);
	int year_now = time -> tm_year + 1900;
	int month_now = time -> tm_mon + 1;
	int day_now = time -> tm_mday;

	char *DataDirPath(getenv("DATA_DIR_100"));
	if (DataDirPath == NULL) std::cout << "Warning! $DATA_DIR is not set!" << endl;
	char *PedDirPath(getenv("PED_DIR"));
	if (PedDirPath == NULL) std::cout << "Warning! $DATA_DIR is not set!" << endl;
	char *plotPath(getenv("PLOT_PATH"));
	if (plotPath == NULL) std::cout << "Warning! $PLOT_PATH is not set!" << endl;

	char run_file_name[400];
	sprintf(run_file_name,"%s/RawData/A%d/all_runs/event%d.root",DataDirPath,station,runNum);
	TFile *mapFile = TFile::Open(run_file_name);
	if(!mapFile){
		cout<<"Can't open data file for map!"<<endl;
		return -1;
	}
	TTree *eventTree = (TTree*) mapFile-> Get("eventTree");
	if(!eventTree){
		cout<<"Can't find eventTree for map"<<endl;
		return -1;
	}

	RawAtriStationEvent *rawPtr =0;
	eventTree->SetBranchAddress("event",&rawPtr);
	eventTree->GetEvent(event);

	int stationID = rawPtr->stationId;
	char ped_file_name[400];
	sprintf(ped_file_name,"%s/run_specific_peds/A%d/all_peds/event%d_specificPeds.dat",PedDirPath,station,runNum);
	AraEventCalibrator *calibrator = AraEventCalibrator::Instance();
	calibrator->setAtriPedFile(ped_file_name,stationID); //because someone had a brain (!!), this will error handle itself if the pedestal doesn't exist

	AraQualCuts *qualCut = AraQualCuts::Instance();
	UsefulAtriStationEvent *realAtriEvPtr = new UsefulAtriStationEvent(rawPtr,AraCalType::kLatestCalib);
	printf("Run %d, Event %d \n", runNum, realAtriEvPtr->eventNumber);
	printf("	Is Quality Event? %d \n", qualCut->isGoodEvent(realAtriEvPtr));

	int unixTime = (int)rawPtr->unixTime;
	int unixTimeUs =(int)rawPtr->unixTimeUs;
	int timeStamp = (int)rawPtr->timeStamp;
	printf("	Unixtime is %d \n", unixTime);
	printf("	Unixtime microsecond is %d \n", unixTimeUs);
	printf("	timeStamp is %d \n", timeStamp);

	stringstream ss1;
	string xLabel, yLabel;
	xLabel = "Time (ns)"; yLabel = "Voltage (mV)";
	vector<string> titlesForGraphs;
	for (int i = 0; i < 16; i++){
		ss1.str("");
		ss1 << "Channel " << i;
		titlesForGraphs.push_back(ss1.str());
	}

	vector <TGraph*> waveforms = makeGraphsFromRF(realAtriEvPtr,16,xLabel,yLabel,titlesForGraphs);
	vector<TGraph*> grWaveformsInt = makeInterpolatedGraphs(waveforms, 0.5, xLabel, yLabel, titlesForGraphs);
	vector<TGraph*> grWaveformsPadded = makePaddedGraphs(grWaveformsInt, 0, xLabel, yLabel, titlesForGraphs);
	xLabel = "Frequency (Hz)"; yLabel = "Power Spectral Density (mV/Hz)";
	vector<TGraph*> grWaveformsPowerSpectrum = makePowerSpectrumGraphs(grWaveformsPadded, xLabel, yLabel, titlesForGraphs);

	// get the run summary information, if it exists yet
	// and remember, because it's the users job to pass the location of the filter files
	// this should work for simulated events just fine
	char filter_file_name[400];
	sprintf(filter_file_name,"%s/processed_station_%d_run_%d_filter.root","/fs/project/PAS0654/ARA_DATA/A23/100pct_try2/ProcessedFile/A2/2015",station,runNum);
	bool hasFilterFile = false;
	TFile *filterFile = TFile::Open(filter_file_name);
	TTree *filterTree;
	double VPeakOverRMS[16];
	if(filterFile){
		printf("Successfully found filter file information \n");
		hasFilterFile=true;
		filterTree = (TTree*) filterFile->Get("OutputTree");
		if(!filterTree) {
			std::cout << "Can't find filterTree\n";
			return -1;
		}
		filterTree->SetBranchAddress("VPeakOverRMS", &VPeakOverRMS);
		filterFile->cd();
	}
	if(!filterFile){
		return -1;
	}

	filterTree->GetEvent(event);

	vector<double> chan_SNRs;
	if(hasFilterFile){
		for(int i=0; i<16; i++){
			chan_SNRs.push_back(VPeakOverRMS[i]);
		}
	}

	vector <int> chan_list_V;
	vector <int> chan_list_H;
	for(int chan=0; chan<=7; chan++){
		chan_list_V.push_back(chan);
		chan_list_H.push_back(chan+8);
	}

	if(station==2){
		//for station 2, we need to exclude channel 15 from the analysis
		chan_list_H.erase(remove(chan_list_H.begin(), chan_list_H.end(), 15), chan_list_H.end());
	}
	else if(station==3){
		// // for station 3 years 2014, 2015, 2016, we need to drop string 4 (channels 3, 7, 11, 15) altogether above some run
		// if(
		// 	(!isSimulation && runNum>getA3BadRunBoundary())
		// 	||
		// 	(isSimulation && yearConfig>2)

		// ){			// drop string four
		// 	chan_list_V.erase(remove(chan_list_V.begin(), chan_list_V.end(), 3), chan_list_V.end());
		// 	chan_list_V.erase(remove(chan_list_V.begin(), chan_list_V.end(), 7), chan_list_V.end());
		// 	chan_list_H.erase(remove(chan_list_H.begin(), chan_list_H.end(), 11), chan_list_H.end());
		// 	chan_list_H.erase(remove(chan_list_H.begin(), chan_list_H.end(), 15), chan_list_H.end());
		// }
	}

	Settings *settings = new Settings();
	string setupfile = "setup.txt";
	settings->ReadFile(setupfile);
	cout << "Read " << setupfile << " file!" << endl;
	settings->NOFZ=1;
	Detector *detector = 0;

	RayTraceCorrelator *theCorrelator = new RayTraceCorrelator(station, 300, settings, 1, RTTestMode);

	int solNum = 0;
	TH2D *map_V_raytrace = theCorrelator->getInterferometricMap_RT_select_NewNormalization_SNRweighted(settings, detector, realAtriEvPtr, Vpol, isSimulation, chan_list_V, chan_SNRs, solNum);
	// TH2D *map_H_raytrace = theCorrelator->getInterferometricMap_RT_select_NewNormalization_SNRweighted(settings, detector, realAtriEvPtr, Hpol, isSimulation, chan_list_H, chan_SNRs, solNum);

	int new_theta;
	int new_phi;
	double new_corr;

	getCorrMapPeak(map_V_raytrace,new_theta, new_phi, new_corr);
	char title_for_map[300];
	sprintf(title_for_map,"VMap: peak theta %d, phi %d, corr %.4f",new_theta, new_phi,new_corr);
	map_V_raytrace->SetTitle(title_for_map);

	// TH2D *map_V_raytrace_org = theCorrelator->getInterferometricMap_RT(settings, detector, realAtriEvPtr, Vpol, isSimulation, solNum);

	// getCorrMapPeak(map_V_raytrace_org,new_theta, new_phi, new_corr);
	// char title_for_map2[300];
	// sprintf(title_for_map2,"old (eugene/carl) method peak theta %d, phi %d, corr %.4f",new_theta, new_phi,new_corr);
	// map_V_raytrace_org->SetTitle(title_for_map2);

	bool print_maps = true;
	if(print_maps){
		gStyle->SetOptStat(0);
		// TCanvas *cMaps = new TCanvas("","",2*1100,2*850);
		TCanvas *cMaps = new TCanvas("","",1100,1.1*850);
		// cMaps->Divide(2,2);
			// cMaps->cd(1);
			map_V_raytrace->Draw("colz");
			gPad->SetRightMargin(0.15);
			// cMaps->cd(2);
			// map_V_raytrace_org->Draw("colz");
			// gPad->SetRightMargin(0.15);
		char save_temp_title[400];
		sprintf(save_temp_title,"/users/PAS0654/osu0673/A23_analysis_new2/results/trouble_events/sideregion_%d.%d.%d_Run%d_Ev%d_Maps.png",year_now,month_now,day_now,runNum,event);
		cMaps->SaveAs(save_temp_title);
		delete cMaps;
	}

	// chan_list_V.clear();
	// chan_list_V.push_back(0);
	// // chan_list_V.push_back(2);
	// chan_list_V.push_back(4);
	// chan_list_V.push_back(5);
	// chan_list_V.push_back(6);
	// chan_list_V.push_back(7);

	// TH2D *map_V_raytrace_onlystrong = theCorrelator->getInterferometricMap_RT_select_NewNormalization_SNRweighted(settings, detector, realAtriEvPtr, Vpol, isSimulation, chan_list_V, chan_SNRs, solNum);


	// int strong_theta;
	// int strong_phi;
	// double strong_corr;
	// getCorrMapPeak(map_V_raytrace_onlystrong,strong_theta, strong_phi, strong_corr);
	// char title_for_strongmap[300];
	// sprintf(title_for_strongmap,"high-SNR only theta %d, phi %d, corr %.4f",strong_theta, strong_phi,strong_corr);
	// map_V_raytrace_onlystrong->SetTitle(title_for_strongmap);

	// if(print_maps){
	// 	gStyle->SetOptStat(0);
	// 	// TCanvas *cMaps = new TCanvas("","",2*1100,2*850);
	// 	TCanvas *cMaps = new TCanvas("","",1.1-1100,850);
	// 	// cMaps->Divide(2,2);
	// 		// cMaps->cd(1);
	// 		map_V_raytrace_onlystrong->Draw("colz");
	// 		gPad->SetRightMargin(0.15);
	// 		// cMaps->cd(2);
	// 		// map_H_raytrace->Draw("colz");
	// 	char save_temp_title[400];
	// 	sprintf(save_temp_title,"/users/PAS0654/osu0673/A23_analysis_new2/results/trouble_events/sideregion_%d.%d.%d_Run%d_Ev%d_VMap_OnlyStrong.png",year_now,month_now,day_now,runNum,event);
	// 	cMaps->SaveAs(save_temp_title);
	// 	delete cMaps;
	// }

	// delete map_V_raytrace_onlystrong;


	bool doContributingMaps=true;
	if(doContributingMaps){
		stringstream ss1;
		vector<string> titlesForGraphs;
		vector <TH2D*> individuals;

		double SNR_scaling=0.;

		for(int i=0; i<7; i++){
			for(int j=i+1; j<8; j++){
				ss1.str("");
				ss1<<"Pair "<<i<<" and "<<j;
				titlesForGraphs.push_back(ss1.str());
				TH2D *map = theCorrelator->getInterferometricMap_RT_NewNormalization_PairSelect(settings, detector, realAtriEvPtr, Vpol, isSimulation, i, j, solNum);

				// now do the SNR scaling
				double this_snr_product = chan_SNRs[i] * chan_SNRs[j];
				// printf("Weighting term for %d, %d is %.3f \n", i, j, this_snr_product);
				map->Scale(this_snr_product);

				SNR_scaling+=this_snr_product;

				individuals.push_back(map);
			}
		}

		for(int i=0; i<individuals.size(); i++){
			individuals[i]->Scale(1./SNR_scaling);
		}

		// compute the average myself manually
		TH2D *average = (TH2D*) individuals[0]->Clone();
		for(int i=0; i<individuals.size(); i++){
			average->Add(individuals[i]);
		}
		// average->Scale(1./28);
		average->SetTitle("Summed Maps");

		vector<double> mins;
		vector<double> maxs;
		for(int i=0; i<individuals.size(); i++){
			mins.push_back(individuals[i]->GetMinimum());
			maxs.push_back(individuals[i]->GetMaximum());
		}
		std::sort(mins.begin(), mins.end()); //sort smallest to largest
		std::sort(maxs.begin(), maxs.end()); //sort smallest to largest
		std::reverse(maxs.begin(), maxs.end()); //reverse order to get largest to smallest

		TCanvas *cMaps2 = new TCanvas("","",8*850,4*850);
		cMaps2->Divide(7,5);
		for(int i=0; i<individuals.size(); i++){
			cMaps2->cd(i+1);
			individuals[i]->Draw("colz");
			individuals[i]->GetZaxis()->SetRangeUser(mins[0],maxs[0]);
			individuals[i]->SetTitle(titlesForGraphs[i].c_str());
			gStyle->SetTitleFontSize(0.07);
		}
		cMaps2->cd(35);
			average->Draw("colz");
		char save_temp_title[400];
		sprintf(save_temp_title,"/users/PAS0654/osu0673/A23_analysis_new2/results/trouble_events/sideregion_%d.%d.%d_Run%d_Ev%d_AllMaps.png",year_now,month_now,day_now,runNum,event);
		cMaps2->SaveAs(save_temp_title);
		delete cMaps2;
	}



	// delete map_V_raytrace;
	// delete map_H_raytrace;
	// delete theCorrelator;

	char save_temp_title[300];
	sprintf(save_temp_title,"%s/trouble_events/sideregion_%d.%d.%d_Run%d_Ev%d_ProblemPol%d_Waveforms.png",plotPath,year_now,month_now,day_now,runNum,event,problempol);
	TCanvas *cWave = new TCanvas("","",4*1100,4*850);
	cWave->Divide(4,4);
	for(int i=0; i<16; i++){
		cWave->cd(i+1);
		// dummy[i]->Draw("AL");
		// dummy[i]->SetLineColor(kWhite);
		// dummy[i]->GetXaxis()->SetRangeUser(300.,500.);

		waveforms[i]->Draw("AL");
		waveforms[i]->SetLineWidth(3);
		// waveforms[i]->GetXaxis()->SetRangeUser(300.,500.);
	}
	cWave->SaveAs(save_temp_title);
	delete cWave;

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
		waveforms[i]->SetLineWidth(3);
	}
	sprintf(save_temp_title,"%s/trouble_events/sideregion_%d.%d.%d_Run%d_Ev%d_ProblemPol%d_Waveforms_SpareChans.png",plotPath,year_now,month_now,day_now,runNum,event,problempol);
	cWave_spare->SaveAs(save_temp_title);
	delete cWave_spare;


	sprintf(save_temp_title,"%s/trouble_events/sideregion_%d.%d.%d_Run%d_Ev%d_ProblemPol%d_Spectra.png",plotPath,year_now,month_now,day_now,runNum,event,problempol);
	TCanvas *cSpec = new TCanvas("","",4*1100,4*850);
	cSpec->Divide(4,4);
	for(int i=0; i<16; i++){
		cSpec->cd(i+1);
		grWaveformsPowerSpectrum[i]->Draw("AL");
		grWaveformsPowerSpectrum[i]->SetLineWidth(3);
		gPad->SetLogy();
	}
	cSpec->SaveAs(save_temp_title);
	delete cSpec;
	for(int i=0; i<16; i++){
		delete waveforms[i];
		delete grWaveformsInt[i];
		delete grWaveformsPadded[i];
		delete grWaveformsPowerSpectrum[i];
	}
	delete realAtriEvPtr;
	mapFile->Close();
	delete mapFile;
	return 0;


	/*
	char cw_file_name[400];
	sprintf(cw_file_name,"%s/CWID/A%d/all_runs/CWID_station_%d_run_%d.root",DataDirPath,station,station,runNum);
	TFile *NewCWFile = TFile::Open(cw_file_name);
	if(!NewCWFile) {
		std::cerr << "Can't open new CW file\n";
		return -1;
	}
	TTree* NewCWTree = (TTree*) NewCWFile->Get("NewCWTree");
	if(!NewCWTree) {
		std::cerr << "Can't find NewCWTree\n";
		return -1;
	}
	vector<vector<double> > *badFreqs_fwd =0;
	vector<vector<double> > *badFreqs_back=0;
	vector<vector<double> > *badSigmas_fwd=0;
	vector<vector<double> > *badSigmas_back=0;
	vector<vector<double> > *badFreqs_baseline=0;

	NewCWTree->SetBranchAddress("badFreqs_fwd",&badFreqs_fwd);
	NewCWTree->SetBranchAddress("badSigmas_fwd",&badSigmas_fwd);
	NewCWTree->SetBranchAddress("badFreqs_back",&badFreqs_back);
	NewCWTree->SetBranchAddress("badSigmas_back",&badSigmas_back);
	NewCWTree->SetBranchAddress("badFreqs_baseline",&badFreqs_baseline);

	//deal w/ CW cut
	NewCWTree->GetEntry(event);

	bool isCutonCW_fwd[2]; isCutonCW_fwd[0]=false; isCutonCW_fwd[1]=false;
	bool isCutonCW_back[2]; isCutonCW_back[0]=false; isCutonCW_back[1]=false;
	bool isCutonCW_baseline[2]; isCutonCW_baseline[0]=false; isCutonCW_baseline[1]=false;

	for(int pol=0; pol<badFreqs_baseline->size(); pol++){
		vector<double> badFreqListLocal_baseline = badFreqs_baseline->at(pol);
		if(badFreqListLocal_baseline.size()>0) isCutonCW_baseline[pol]=true;
	}
	for(int pol=0; pol<2; pol++){
		char run_summary_filename[400];
		sprintf(run_summary_filename,"%s/RunSummary/A%d/all_runs/run_summary_station_%d_run_%d.root",DataDirPath,station,station,runNum);
		TFile *SummaryFile = TFile::Open(run_summary_filename);
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
		// char *plotPath(getenv("PLOT_PATH"));
		// if (plotPath == NULL) std::cout << "Warning! $PLOT_PATH is not set!" << endl;
		// TCanvas *c = new TCanvas("","",1100,850);
		// c->Divide(4,4);
		// for(int i=0; i<16; i++){
		// 	c->cd(i+1);
		// 	average[i]->Draw("ALP");
		// }
		// char save_temp_title[300];
		// sprintf(save_temp_title,"%s/trouble_events/Run%d_JustBaseline.png",plotPath,runNum);
		// c->SaveAs(save_temp_title);
		// delete c;
		vector<int> chan_exclusion_list;
		vector<double> baseline_CW_freqs = CWCut_TB(waveforms, average, pol, 6., 5.5, station, 3, chan_exclusion_list, runNum, event, false);
	}

	double threshCW = 1.0;
	vector<double> badFreqList_fwd;
	vector<double> badSigmaList_fwd;
	for(int pol=0; pol<badFreqs_fwd->size(); pol++){
		badFreqList_fwd=badFreqs_fwd->at(pol);
		badSigmaList_fwd=badSigmas_fwd->at(pol);
		for(int iCW=0; iCW<badFreqList_fwd.size(); iCW++){
			if(
				badSigmaList_fwd[iCW] > threshCW
				&&
				abs(300. - badFreqList_fwd[iCW]) > 2.
				&&
				abs(500. - badFreqList_fwd[iCW]) > 2.
				&&
				abs(125. - badFreqList_fwd[iCW]) > 2.
			){
				isCutonCW_fwd[pol] = true;
			}
		}
	}
	vector<double> badFreqList_back;
	vector<double> badSigmaList_back;
	for(int pol=0; pol<badFreqs_back->size(); pol++){
		badFreqList_back=badFreqs_back->at(pol);
		badSigmaList_back=badSigmas_back->at(pol);
		for(int iCW=0; iCW<badFreqList_back.size(); iCW++){
			if(
				badSigmaList_back[iCW] > threshCW
				&&
				abs(300. - badFreqList_back[iCW]) > 2.
				&&
				abs(500. - badFreqList_back[iCW]) > 2.
				&&
				abs(125. - badFreqList_back[iCW]) > 2.
			){
				isCutonCW_back[pol] = true;
			}
		}
	}
	bool skipCW=false;
	for(int pol=0; pol<2; pol++){
		if(skipCW || pol!=problempol) continue;
		if(isCutonCW_fwd[pol] || isCutonCW_back[pol] || isCutonCW_baseline[pol]){
			printf("	Has CW issue in pol %d \n", pol);
			printf("		CW in FWD %d, BWD %d, or baseline %d? \n", isCutonCW_fwd[pol], isCutonCW_back[pol], isCutonCW_baseline[pol]);
			//get the frequencies to notch
			vector<double> badFreqListLocal_fwd;
			vector <double> badFreqListLocal_back;
			vector <double> mergedFreqList;

			//merge the two lists of frequencies
			//if it's cut going both forward and backward
			if(isCutonCW_fwd[pol] && isCutonCW_back[pol]){
				badFreqListLocal_fwd=badFreqs_fwd->at(pol);
				badFreqListLocal_back=badFreqs_back->at(pol);
				for(int iFreq=0; iFreq<badFreqListLocal_fwd.size(); iFreq++){
					mergedFreqList.push_back(badFreqListLocal_fwd[iFreq]);
				}
				for(int iFreq=0; iFreq<badFreqListLocal_back.size(); iFreq++){
					double new_freq=badFreqListLocal_back[iFreq];
					for(int iFreqOld=0; iFreqOld<badFreqListLocal_fwd.size(); iFreqOld++){
						if(abs(new_freq-mergedFreqList[iFreqOld])>0.1){
							mergedFreqList.push_back(new_freq);
						}
					}
				}
			}
			//if it's cut only going forward
			else if(isCutonCW_fwd[pol] && !isCutonCW_back[pol]){
				badFreqListLocal_fwd=badFreqs_fwd->at(pol);
				for(int iFreq=0; iFreq<badFreqListLocal_fwd.size(); iFreq++){
					mergedFreqList.push_back(badFreqListLocal_fwd[iFreq]);
				}
			}
			//if it's cut only going backward
			else if(!isCutonCW_fwd[pol] && isCutonCW_back[pol]){
				badFreqListLocal_back=badFreqs_back->at(pol);
				for(int iFreq=0; iFreq<badFreqListLocal_back.size(); iFreq++){
					mergedFreqList.push_back(badFreqListLocal_back[iFreq]);
				}
			}

			vector<double> more_freqs_to_add;
			vector<double> badFreqListLocal_baseline = badFreqs_baseline->at(pol);
			if(mergedFreqList.size()>0){ //do we already have frequencies to check against?
				//loop over everything identified by the CW baseline cut
				for(int newFreq=0; newFreq<badFreqListLocal_baseline.size(); newFreq++){
					double new_freq = badFreqListLocal_baseline[newFreq];
					//now, loop over everything already in the list
					for(int oldFreq=0; oldFreq<mergedFreqList.size(); oldFreq++){
						//if there's a genuinely new frequency, add it to the list of things to be adde
						if(abs(new_freq-mergedFreqList[oldFreq])>0.1){
							more_freqs_to_add.push_back(new_freq);
						}
					}
				}
			}
			else{ //otherwise we take only those found by the CW ID cut
				for(int newFreq=0; newFreq<badFreqListLocal_baseline.size(); newFreq++){
					double new_freq = badFreqListLocal_baseline[newFreq];
					more_freqs_to_add.push_back(new_freq);
				}
			}

			//now actually add it to the merged freq list
			for(int iFreq=0; iFreq<more_freqs_to_add.size(); iFreq++){
				mergedFreqList.push_back(more_freqs_to_add[iFreq]);
			}

			//they need to be in smaller -> larger order for notching
			sort(mergedFreqList.begin(), mergedFreqList.end());
			vector <double> uniqueNotchFreqs;
			vector <double> uniqueNotchBands;
			theCorrelators[0]->pickFreqsAndBands(mergedFreqList,uniqueNotchFreqs,uniqueNotchBands);
			for (int i = 0; i < uniqueNotchFreqs.size(); ++i)
			{
				printf("			Unique freq to be notched is %.2f with width %.2f \n", uniqueNotchFreqs[i],uniqueNotchBands[i]);
			}
			vector <TGraph*> grWaveformsRaw = makeGraphsFromRF(realAtriEvPtr,16,xLabel,yLabel,titlesForGraphs);
			vector<TGraph*> grWaveformsInt = makeInterpolatedGraphs(grWaveformsRaw, 0.5, xLabel, yLabel, titlesForGraphs);
			vector<TGraph*> grWaveformsPadded = makePaddedGraphs(grWaveformsInt, 0, xLabel, yLabel, titlesForGraphs);
			vector <TGraph*> grNotched;
			for(int i=0; i<16; i++){
				TGraph *grNotchAmp = theCorrelators[0]->applyAdaptiveFilter_singleAnt_FiltMany(grWaveformsPadded[i],uniqueNotchFreqs,uniqueNotchBands);
				grNotched.push_back(theCorrelators[0]->GeometricFilter(grNotchAmp,uniqueNotchFreqs,uniqueNotchBands,uniqueNotchFreqs));
				delete grNotchAmp;
			}
			vector<TGraph*> grWaveformsPowerSpectrum = makePowerSpectrumGraphs(grWaveformsPadded, xLabel, yLabel, titlesForGraphs);
			vector<TGraph*> grWaveformsPowerSpectrum_notched = makePowerSpectrumGraphs(grNotched, xLabel, yLabel, titlesForGraphs);

			char save_temp_title[300];
			sprintf(save_temp_title,"%s/trouble_events/%d.%d.%d_Run%d_Ev%d_ProblemPol%d_WaveformsNotch.png",plotPath,year_now,month_now,day_now,runNum,event,problempol);
			TCanvas *cWave = new TCanvas("","",4*1100,4*850);
			cWave->Divide(4,4);
			for(int i=0; i<16; i++){
				cWave->cd(i+1);
				grWaveformsRaw[i]->Draw("AL");
				grWaveformsRaw[i]->SetLineWidth(3);
				grNotched[i]->Draw("same");
				grNotched[i]->SetLineWidth(3);
				grNotched[i]->SetLineColor(kRed);
			}
			cWave->SaveAs(save_temp_title);
			delete cWave;

			sprintf(save_temp_title,"%s/trouble_events/%d.%d.%d_Run%d_Ev%d_ProblemPol%d_SpectraNotch.png",plotPath,year_now,month_now,day_now,runNum,event,problempol);
			TCanvas *cSpec = new TCanvas("","",4*1100,4*850);
			cSpec->Divide(4,4);
			for(int i=0; i<16; i++){
				cSpec->cd(i+1);
				grWaveformsPowerSpectrum[i]->Draw("AL");
				grWaveformsPowerSpectrum[i]->SetLineWidth(3);
				grWaveformsPowerSpectrum_notched[i]->Draw("same");
				grWaveformsPowerSpectrum_notched[i]->SetLineWidth(3);
				grWaveformsPowerSpectrum_notched[i]->SetLineColor(kRed);
				gPad->SetLogy();
			}
			cSpec->SaveAs(save_temp_title);
			delete cSpec;

			TH2D *map_30m_V;
			TH2D *map_300m_V;
			TH2D *map_30m_H;
			TH2D *map_300m_H;
			vector <int> chan_list_V;
			vector <int> chan_list_H;
			for(int chan=0; chan<=7; chan++){
				chan_list_V.push_back(chan);
				chan_list_H.push_back(chan+8);
			}

			vector<double> chan_SNRs;

			if(station==2){
				//for station 2, we need to exclude channel 15 from the analysis
				chan_list_H.erase(remove(chan_list_H.begin(), chan_list_H.end(), 15), chan_list_H.end());
			}
			else if(station==3){
				//for station 3 years 2014 and 2015, we need to drop string 4 (channels 3, 7, 11, 15) altogether
				if(runNum>getA3BadRunBoundary()){
					chan_list_V.erase(remove(chan_list_V.begin(), chan_list_V.end(), 3), chan_list_V.end());
					chan_list_V.erase(remove(chan_list_V.begin(), chan_list_V.end(), 7), chan_list_V.end());

					chan_list_H.erase(remove(chan_list_H.begin(), chan_list_H.end(), 11), chan_list_H.end());
					chan_list_H.erase(remove(chan_list_H.begin(), chan_list_H.end(), 15), chan_list_H.end());
				}
			}

			map_30m_V = theCorrelators[0]->getInterferometricMap_RT_FiltMany_select_NewNormalization_SNRweighted(settings, detector, realAtriEvPtr, Vpol, false,chan_list_V,chan_SNRs,0,-1,uniqueNotchFreqs,uniqueNotchBands) ;
			map_300m_V = theCorrelators[1]->getInterferometricMap_RT_FiltMany_select_NewNormalization_SNRweighted(settings, detector, realAtriEvPtr, Vpol, false,chan_list_V,chan_SNRs,0,-1,uniqueNotchFreqs,uniqueNotchBands);
			map_30m_H = theCorrelators[0]->getInterferometricMap_RT_FiltMany_select_NewNormalization_SNRweighted(settings, detector, realAtriEvPtr, Hpol, false,chan_list_H,chan_SNRs,0,-1,uniqueNotchFreqs,uniqueNotchBands);
			map_300m_H = theCorrelators[1]->getInterferometricMap_RT_FiltMany_select_NewNormalization_SNRweighted(settings, detector, realAtriEvPtr, Hpol, false,chan_list_H,chan_SNRs,0,-1,uniqueNotchFreqs,uniqueNotchBands);

			int PeakTheta_Recompute_30m_H;
			int PeakTheta_Recompute_300m_H;
			int PeakPhi_Recompute_30m_H;
			int PeakPhi_Recompute_300m_H;
			double PeakCorr_Recompute_30m_H;
			double PeakCorr_Recompute_300m_H;
			int PeakTheta_Recompute_30m_V;
			int PeakTheta_Recompute_300m_V;
			int PeakPhi_Recompute_30m_V;
			int PeakPhi_Recompute_300m_V;
			double PeakCorr_Recompute_30m_V;
			double PeakCorr_Recompute_300m_V;
			getCorrMapPeak(map_30m_H,PeakTheta_Recompute_30m_H,PeakPhi_Recompute_30m_H,PeakCorr_Recompute_30m_H);
			getCorrMapPeak(map_300m_H,PeakTheta_Recompute_300m_H,PeakPhi_Recompute_300m_H,PeakCorr_Recompute_300m_H);
			getCorrMapPeak(map_30m_V,PeakTheta_Recompute_30m_V,PeakPhi_Recompute_30m_V,PeakCorr_Recompute_30m_V);
			getCorrMapPeak(map_300m_V,PeakTheta_Recompute_300m_V,PeakPhi_Recompute_300m_V,PeakCorr_Recompute_300m_V);

			printf("	Rconstruction Information\n");
			printf("		30m H theta and phi %d and %d \n", PeakTheta_Recompute_30m_H, PeakPhi_Recompute_30m_H);
			stringstream ss30H;
			ss30H<<" Peak Theta, Phi is "<<PeakTheta_Recompute_30m_H<<" , "<<PeakPhi_Recompute_30m_H;
			map_30m_H->SetTitle(ss30H.str().c_str());
			printf("		300m H theta and phi %d and %d \n", PeakTheta_Recompute_300m_H, PeakPhi_Recompute_300m_H);
			stringstream ss300H;
			ss300H<<" Peak Theta, Phi is "<<PeakTheta_Recompute_300m_H<<" , "<<PeakPhi_Recompute_300m_H;
			map_300m_H->SetTitle(ss300H.str().c_str());
			printf("		30m V theta and phi %d and %d \n", PeakTheta_Recompute_30m_V, PeakPhi_Recompute_30m_V);
			stringstream ss30V;
			ss30V<<" Peak Theta, Phi is "<<PeakTheta_Recompute_30m_V<<" , "<<PeakPhi_Recompute_30m_V;
			map_30m_V->SetTitle(ss30V.str().c_str());
			printf("		300m V theta and phi %d and %d \n", PeakTheta_Recompute_300m_V, PeakPhi_Recompute_300m_V);
			stringstream ss300V;
			ss300V<<" Peak Theta, Phi is "<<PeakTheta_Recompute_300m_V<<" , "<<PeakPhi_Recompute_300m_V;
			map_300m_V->SetTitle(ss300V.str().c_str());

			TCanvas *cMaps = new TCanvas("","",2*1100,2*850);
			cMaps->Divide(2,2);
				cMaps->cd(3);
				map_30m_V->Draw("colz");
				cMaps->cd(4);
				map_30m_H->Draw("colz");
				cMaps->cd(1);
				map_300m_V->Draw("colz");
				cMaps->cd(2);
				map_300m_H->Draw("colz");
			sprintf(save_temp_title,"%s/trouble_events/%d.%d.%d_Run%d_Ev%d_ProblemPol%d_FilteredMaps.png",plotPath,year_now,month_now,day_now,runNum,event,problempol);
			cMaps->SaveAs(save_temp_title);
			delete cMaps;
			delete map_30m_V; delete map_300m_V; delete map_30m_H; delete map_300m_H;

			deleteGraphVector(grWaveformsRaw);
			deleteGraphVector(grWaveformsInt);
			deleteGraphVector(grWaveformsPadded);
			deleteGraphVector(grNotched);
			deleteGraphVector(grWaveformsPowerSpectrum);
			deleteGraphVector(grWaveformsPowerSpectrum_notched);
		}
	}
	*/

	// printf("Trying to reconstruct theta\n");
	// AraGeomTool *araGeom = AraGeomTool::Instance();
	// double dist=abs(araGeom->getStationInfo(station)->getAntennaInfo(3)->antLocation[2] - araGeom->getStationInfo(station)->getAntennaInfo(7)->antLocation[2]);
	// TGraph *corr = FFTtools::getInterpolatedCorrelationGraph(waveforms[7],waveforms[3],0.5);
	// int peak_bin=FFTtools::getPeakBin(corr);
	// double delay=corr->GetX()[peak_bin];
	// cout<<"Delay is "<<delay<<endl;
	// delay*=1e-9;
	// double theta = TMath::ASin(3e8*delay/1.78/dist)*TMath::RadToDeg();
	// printf("Delay is %.2f, and reco theta is %.2f \n", delay,theta);
	// delete corr;


	/*
	bool do_reco=false;
	if(do_reco){
		TH2D *map_30m_V;
		TH2D *map_300m_V;
		TH2D *map_30m_H;
		TH2D *map_300m_H;
		vector <int> chan_list_V;
		vector <int> chan_list_H;
		for(int chan=0; chan<=7; chan++){
			chan_list_V.push_back(chan);
			chan_list_H.push_back(chan+8);
		}

		if(station==2){
			//for station 2, we need to exclude channel 15 from the analysis
			chan_list_H.erase(remove(chan_list_H.begin(), chan_list_H.end(), 15), chan_list_H.end());
		}
		else if(station==3){
			//for station 3 years 2014 and 2015, we need to drop string 4 (channels 3, 7, 11, 15) altogether
			if(runNum>getA3BadRunBoundary()){
				chan_list_V.erase(remove(chan_list_V.begin(), chan_list_V.end(), 3), chan_list_V.end());
				chan_list_V.erase(remove(chan_list_V.begin(), chan_list_V.end(), 7), chan_list_V.end());

				chan_list_H.erase(remove(chan_list_H.begin(), chan_list_H.end(), 11), chan_list_H.end());
				chan_list_H.erase(remove(chan_list_H.begin(), chan_list_H.end(), 15), chan_list_H.end());
			}
		}

		vector<double> chan_SNRs;

		map_30m_V = theCorrelators[0]->getInterferometricMap_RT_select_NewNormalization_SNRweighted(settings, detector, realAtriEvPtr, Vpol, false,chan_list_V,chan_SNRs,0,-1) ;
		map_300m_V = theCorrelators[1]->getInterferometricMap_RT_select_NewNormalization_SNRweighted(settings, detector, realAtriEvPtr, Vpol, false,chan_list_V,chan_SNRs,0,-1);
		map_30m_H = theCorrelators[0]->getInterferometricMap_RT_select_NewNormalization_SNRweighted(settings, detector, realAtriEvPtr, Hpol, false,chan_list_H,chan_SNRs,0,-1);
		map_300m_H = theCorrelators[1]->getInterferometricMap_RT_select_NewNormalization_SNRweighted(settings, detector, realAtriEvPtr, Hpol, false,chan_list_H,chan_SNRs,0,-1);

		// map_30m_V = theCorrelators[0]->getInterferometricMap_RT_select(settings, detector, realAtriEvPtr, Vpol, false,chan_list_V) ;
		// map_300m_V = theCorrelators[1]->getInterferometricMap_RT_select(settings, detector, realAtriEvPtr, Vpol, false,chan_list_V);
		// map_30m_H = theCorrelators[0]->getInterferometricMap_RT_select(settings, detector, realAtriEvPtr, Hpol, false,chan_list_H);
		// map_300m_H = theCorrelators[1]->getInterferometricMap_RT_select(settings, detector, realAtriEvPtr, Hpol, false,chan_list_H);

		int PeakTheta_Recompute_30m_H;
		int PeakTheta_Recompute_300m_H;
		int PeakPhi_Recompute_30m_H;
		int PeakPhi_Recompute_300m_H;
		double PeakCorr_Recompute_30m_H;
		double PeakCorr_Recompute_300m_H;
		int PeakTheta_Recompute_30m_V;
		int PeakTheta_Recompute_300m_V;
		int PeakPhi_Recompute_30m_V;
		int PeakPhi_Recompute_300m_V;
		double PeakCorr_Recompute_30m_V;
		double PeakCorr_Recompute_300m_V;
		getCorrMapPeak(map_30m_H,PeakTheta_Recompute_30m_H,PeakPhi_Recompute_30m_H,PeakCorr_Recompute_30m_H);
		getCorrMapPeak(map_300m_H,PeakTheta_Recompute_300m_H,PeakPhi_Recompute_300m_H,PeakCorr_Recompute_300m_H);
		getCorrMapPeak(map_30m_V,PeakTheta_Recompute_30m_V,PeakPhi_Recompute_30m_V,PeakCorr_Recompute_30m_V);
		getCorrMapPeak(map_300m_V,PeakTheta_Recompute_300m_V,PeakPhi_Recompute_300m_V,PeakCorr_Recompute_300m_V);

		printf("	Rconstruction Information\n");
		printf("		30m H theta and phi %d and %d \n", PeakTheta_Recompute_30m_H, PeakPhi_Recompute_30m_H);
		stringstream ss30H;
		ss30H<<" Peak Theta, Phi is "<<PeakTheta_Recompute_30m_H<<" , "<<PeakPhi_Recompute_30m_H;
		map_30m_H->SetTitle(ss30H.str().c_str());
		printf("		300m H theta and phi %d and %d \n", PeakTheta_Recompute_300m_H, PeakPhi_Recompute_300m_H);
		stringstream ss300H;
		ss300H<<" Peak Theta, Phi is "<<PeakTheta_Recompute_300m_H<<" , "<<PeakPhi_Recompute_300m_H;
		map_300m_H->SetTitle(ss300H.str().c_str());
		printf("		30m V theta and phi %d and %d \n", PeakTheta_Recompute_30m_V, PeakPhi_Recompute_30m_V);
		stringstream ss30V;
		ss30V<<" Peak Theta, Phi is "<<PeakTheta_Recompute_30m_V<<" , "<<PeakPhi_Recompute_30m_V;
		map_30m_V->SetTitle(ss30V.str().c_str());
		printf("		300m V theta and phi %d and %d \n", PeakTheta_Recompute_300m_V, PeakPhi_Recompute_300m_V);
		stringstream ss300V;
		ss300V<<" Peak Theta, Phi is "<<PeakTheta_Recompute_300m_V<<" , "<<PeakPhi_Recompute_300m_V;
		map_300m_V->SetTitle(ss300V.str().c_str());

		TCanvas *cMaps = new TCanvas("","",2*1100,2*850);
		cMaps->Divide(2,2);
			cMaps->cd(3);
			map_30m_V->Draw("colz");
			cMaps->cd(4);
			map_30m_H->Draw("colz");
			cMaps->cd(1);
			map_300m_V->Draw("colz");
			cMaps->cd(2);
			map_300m_H->Draw("colz");
		char save_temp_title[400];
		sprintf(save_temp_title,"%s/trouble_events/%d.%d.%d_Run%d_Ev%d_ProblemPol%d_Maps.png",plotPath,year_now,month_now,day_now,runNum,event,problempol);
		cMaps->SaveAs(save_temp_title);
		delete cMaps;
		delete map_30m_V; delete map_300m_V; delete map_30m_H; delete map_300m_H;

		chan_list_V.clear();
		chan_list_V.push_back(0);
		chan_list_V.push_back(1);
		chan_list_V.push_back(2);
		if(!(station==3 && runNum>getA3BadRunBoundary())){ //if dropping bad chans and station 3, don't keep fourth string
			chan_list_V.push_back(3);
		}

		chan_list_H.clear();
		chan_list_H.push_back(8);
		chan_list_H.push_back(9);
		chan_list_H.push_back(10);
		if(!(station==3 && runNum>getA3BadRunBoundary())){ //if dropping bad chans and station 3, don't keep fourth string
			chan_list_H.push_back(11);
		}

		TH2D *map_300m_top_V = theCorrelators[1]->getInterferometricMap_RT_select(settings, detector, realAtriEvPtr, Vpol, false, chan_list_V);
		TH2D *map_300m_top_H = theCorrelators[1]->getInterferometricMap_RT_select(settings, detector, realAtriEvPtr, Hpol, false, chan_list_H);

		int PeakTheta_Recompute_300m_top_V;
		int PeakPhi_Recompute_300m_top_V;
		double PeakCorr_Recompute_300m_top_V;
		int PeakTheta_Recompute_300m_top_H;
		int PeakPhi_Recompute_300m_top_H;
		double PeakCorr_Recompute_300m_top_H;
		getCorrMapPeak(map_300m_top_V,PeakTheta_Recompute_300m_top_V,PeakPhi_Recompute_300m_top_V,PeakCorr_Recompute_300m_top_V);
		getCorrMapPeak(map_300m_top_H,PeakTheta_Recompute_300m_top_H,PeakPhi_Recompute_300m_top_H,PeakCorr_Recompute_300m_top_H);

		stringstream ss300H_top;
		ss300H_top<<" Peak Theta, Phi is "<<PeakTheta_Recompute_300m_top_H<<" , "<<PeakPhi_Recompute_300m_top_H;
		map_300m_top_H->SetTitle(ss300H_top.str().c_str());

		stringstream ss300V_top;
		ss300V_top<<" Peak Theta, Phi is "<<PeakTheta_Recompute_300m_top_V<<" , "<<PeakPhi_Recompute_300m_top_V;
		map_300m_top_V->SetTitle(ss300V_top.str().c_str());

		TCanvas *cMaps_top = new TCanvas("","",2*850,850);
		cMaps_top->Divide(2,1);
			cMaps_top->cd(1);
			map_300m_top_V->Draw("colz");
			cMaps_top->cd(2);
			map_300m_top_H->Draw("colz");
		sprintf(save_temp_title,"%s/trouble_events/%d.%d.%d_Run%d_Ev%d_ProblemPol%d_MapsTop.png",plotPath,year_now,month_now,day_now,runNum,event,problempol);
		cMaps_top->SaveAs(save_temp_title);
		delete cMaps_top;
		delete map_300m_top_V; delete map_300m_top_H;

		chan_list_V.clear();
		chan_list_H.clear();
		chan_list_V.push_back(4);
		chan_list_V.push_back(5);
		chan_list_V.push_back(6);
		chan_list_V.push_back(7);

		chan_list_H.push_back(12);
		chan_list_H.push_back(13);
		chan_list_H.push_back(14);
		chan_list_H.push_back(15);

		TH2D *map_300m_bottom_V = theCorrelators[1]->getInterferometricMap_RT_select(settings, detector, realAtriEvPtr, Vpol, false, chan_list_V);
		TH2D *map_300m_bottom_H = theCorrelators[1]->getInterferometricMap_RT_select(settings, detector, realAtriEvPtr, Hpol, false, chan_list_H);

		int PeakTheta_Recompute_300m_bottom_V;
		int PeakPhi_Recompute_300m_bottom_V;
		double PeakCorr_Recompute_300m_bottom_V;
		int PeakTheta_Recompute_300m_bottom_H;
		int PeakPhi_Recompute_300m_bottom_H;
		double PeakCorr_Recompute_300m_bottom_H;
		getCorrMapPeak(map_300m_bottom_V,PeakTheta_Recompute_300m_bottom_V,PeakPhi_Recompute_300m_bottom_V,PeakCorr_Recompute_300m_bottom_V);
		getCorrMapPeak(map_300m_bottom_H,PeakTheta_Recompute_300m_bottom_H,PeakPhi_Recompute_300m_bottom_H,PeakCorr_Recompute_300m_bottom_H);

		stringstream ss300H_bottom;
		ss300H_bottom<<" Peak Theta, Phi is "<<PeakTheta_Recompute_300m_bottom_H<<" , "<<PeakPhi_Recompute_300m_bottom_H;
		map_300m_bottom_H->SetTitle(ss300H_bottom.str().c_str());

		stringstream ss300V_bottom;
		ss300V_bottom<<" Peak Theta, Phi is "<<PeakTheta_Recompute_300m_bottom_V<<" , "<<PeakPhi_Recompute_300m_bottom_V;
		map_300m_bottom_V->SetTitle(ss300V_bottom.str().c_str());

		TCanvas *cMaps_bottom = new TCanvas("","",2*850,850);
		cMaps_bottom->Divide(2,1);
			cMaps_bottom->cd(1);
			map_300m_bottom_V->Draw("colz");
			cMaps_bottom->cd(2);
			map_300m_bottom_H->Draw("colz");
		sprintf(save_temp_title,"%s/trouble_events/%d.%d.%d_Run%d_Ev%d_ProblemPol%d_MapsBottom.png",plotPath,year_now,month_now,day_now,runNum,event,problempol);
		cMaps_bottom->SaveAs(save_temp_title);
		delete cMaps_bottom;
		delete map_300m_bottom_V; delete map_300m_bottom_H;
	}
	*/

	// vector<TGraph*> dummy;
	// for(int i=0; i<16; i++){
	// 	vector<double> thisX;
	// 	vector<double> thisY;
	// 	thisX.push_back(300);
	// 	thisX.push_back(600);
	// 	thisY.push_back(-700);
	// 	thisY.push_back(700);
	// 	dummy.push_back(new TGraph(2,&thisX[0], &thisY[0]));
	// }

}

void configure(TH1D *gr){
	// gr->GetXaxis()->SetLabelSize(0.07);
	gr->GetXaxis()->SetTitleSize(0.07);

	// gr->GetYaxis()->SetLabelSize(0.07);
	gr->GetYaxis()->SetTitleSize(0.07);
	gr->GetYaxis()->SetTitleOffset(1.2);

	gStyle->SetTitleFontSize(0.07);
	// gr->GetXaxis()->SetNdivisions(4,0,0,false);
	gr->SetLineWidth(2);
}
