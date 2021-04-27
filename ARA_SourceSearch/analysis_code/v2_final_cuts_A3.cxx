////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////	v2_final_cuts_A3.cxx 
////	A23 diffuse, make plots of the final cut parameter space
////	At this point, you must pass it the final slope and intercept that you want for the Rcut
////	Because it's going to assume you've already optimized them elsewhere
////	This will generate the big mega finale canvas that has all our cut information contained
////	make plots less hideous
////	this version specifically for A3, which has different cuts, and I want a more thorough breakdown of cut table
////	you can search for the btis added in honor of A3 by searching for "A3Add"
////
////	Nov 2018
////	updated Nov 2019
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


// analysis custom
#include "tools_Cuts.h"
#include "tools_Stats.h"
#include "tools_CommandLine.h"
#include "tools_outputObjects.h"

using namespace std;


int main(int argc, char **argv)
{
	
	time_t time_now = time(0); //get the time now                                                                                                                                                                  
	tm *time = localtime(&time_now);
	int year_now = time -> tm_year + 1900;
	int month_now = time -> tm_mon + 1;
	int day_now = time -> tm_mday;

	stringstream ss;
	gStyle->SetOptStat(0);

	char *plotPath(getenv("PLOT_PATH"));
	if (plotPath == NULL) std::cout << "Warning! $PLOT_PATH is not set!" << endl;
	char *toolsPath(getenv("TOOLS_DIR"));
	if (toolsPath == NULL) {
		std::cout << "Warning! $TOOLS_DIR is not set!" << endl;
		return -1;
	}

	if(argc<6){
		cout<< "Usage\n" << argv[0] << " <1-station> <2-config> <3-v_slope> <4-v_intercept> <5-h_slope> <6-h_intercept>"<<endl;;
		return -1;
	}

	int station = atoi(argv[1]);
	int config = atoi(argv[2]);
	double v_slope=double(atof(argv[3]));
	double v_intercept =double(atof(argv[4]));
	double h_slope=double(atof(argv[5]));
	double h_intercept=double(atof(argv[6]));

	double selected_slopes[2]={v_slope,h_slope};
	double selected_intercepts[2]={v_intercept,h_intercept};

	if(station!=2 && station!=3){
		printf("No good! You asked for station %d, but this code only works for stations 2 and 3 \n",station);
		return -1;
	}

	vector<int> BadRunList=BuildBadRunList(station);

	/*
		Now, we also need a way to deal with the rotate cross correlation cut
	*/

	int numTotal=0;

	// just for V for a hot minute

	// let's see if we can do it with arrays....
	int numSNRbins=300; //let this go all the way up to 30
	double numEventsPassed[2][numSNRbins];
	double numEventsPassed_diff[2][numSNRbins];

	double dRcut=0.1; // SNR bin incremets (bins in 0.1 SNR units)
	double Rcutmin=0.;
	double intercept[2][numSNRbins];
	for(int pol=0; pol<2; pol++){
		for(int bin=0; bin<numSNRbins; bin++){
			numEventsPassed[pol][bin]=0.;
			numEventsPassed_diff[pol][bin]=0.;
			intercept[pol][bin] = Rcutmin + double(bin)*dRcut;
		}
	}
	// for(int bin=0; bin<numSNRbins; bin++){
	// 	printf("SNR Bin %d has intercept value %.2f \n", bin,intercept[bin]);
	// }
	
	// need to be able to make the final 2D distribution
	double max=0.05;
	TH2D *h2SNRvsCorr[2]; // SNR on Y axis, Corr on X axis, like in the TB
	h2SNRvsCorr[0]=new TH2D("","V Data",100,0,max,300,0,30);
	h2SNRvsCorr[1]=new TH2D("","H Data",100,0,max,300,0,30);

	TChain dataVTree("VTree");
	TChain dataHTree("HTree");
	TChain dataAllTree("AllTree");
	char the_data[500];
	// sprintf(the_data,"/fs/scratch/PAS0654/ara/10pct/ValsForCuts/A%d/c%d/cutvals_drop_snrbins_0_0_wfrmsvals_-1.3_-1.4_run_*.root",station,config);
	sprintf(the_data,"/fs/project/PAS0654/ARA_DATA/A23/10pct_redo/ValsForCuts_v2/A%d/c%d/*.root",station,config); //latest
	int result = dataVTree.Add(the_data);
	dataHTree.Add(the_data);
	dataAllTree.Add(the_data);
	int numDataEvents = dataVTree.GetEntries();

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

		dataAllTree.SetBranchAddress("surf_V_new2",&isSurf[0]); //change to 2nd version
		dataAllTree.SetBranchAddress("surf_H_new2",&isSurf[1]); //change to 2nd version

		dataAllTree.SetBranchAddress("surf_top_V",&isSurfEvent_top[0]);
		dataAllTree.SetBranchAddress("surf_top_H",&isSurfEvent_top[1]);

		int isBadEvent;
		double weight;
		int unixTime;
		int isFirstFiveEvent;
		int hasBadSpareChanIssue;
		int hasBadSpareChanIssue2;
		int runNum;
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
		dataAllTree.SetBranchAddress("isSpikey",&isSpikey);
		dataAllTree.SetBranchAddress("isCliff",&isCliff);
		dataAllTree.SetBranchAddress("OutofBandIssue",&OutofBandIssue);
		dataAllTree.SetBranchAddress("bad_v2",&bad_v2);
		dataAllTree.SetBranchAddress("isRFEvent",&isRFEvent);
		dataAllTree.SetBranchAddress("isPayloadBlast2",&isPayloadBlast2);
		dataAllTree.SetBranchAddress("box300",&box300);
		dataAllTree.SetBranchAddress("runNum",&runNum);

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
			if(runNum!=currentRunNum){
				// printf("Incrementing bad run number to %d \n",runNum);
				// std::cout<<"*";
				currentRunNum=runNum;
				isThisABadRun = isBadRun(station,runNum, BadRunList);
				isThisASoftDomRun = isSoftwareDominatedRun(toolsPath, station, runNum); // A3Add: softwrae dominated
				if(isThisABadRun)
					printf(RED"*"RESET);
					// printf("     Yup, run %d is bad \n",runNum);
				else
					printf(GREEN"*"RESET);

			}
			if( isSoft || isBadEvent || hasBadSpareChanIssue || hasBadSpareChanIssue2 || isFirstFiveEvent || isShort || isCal || isThisABadRun){
				continue;
			}
			// new, since we learned more about A3 A3Add
			if(!isRFEvent || isThisASoftDomRun || isSpikey || isCliff || OutofBandIssue || bad_v2 || isPayloadBlast2){
				continue;
			}
			if(isBadLivetime(station,unixTime)){
				continue;
			}
			for(int pol=0; pol<2; pol++){
				if(!WFRMS[pol] && !isNewBox && !box300 && !isSurf[0] && !isSurf[1] && !isSurfEvent_top[pol]){ // add 300m box A3Add
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
						h2SNRvsCorr[pol]->Fill(corr_val[pol],snr_val[pol],weight);
						// if(snr_val[pol]>6.5){
						// 	printf("Run %d, event %d has SNR %.2f \n", runNum, event, snr_val[pol]);
						// }
						for(int bin=0; bin<numSNRbins; bin++){ //check all potential intercepts
							double this_y_val = (selected_slopes[pol] * corr_val[pol] ) + intercept[pol][bin]; // compute the SNR to pass at this intercept
							// printf("For bin %d, with intercept %.2f, SNR to pass is %.2f \n", bin, intercept[bin], this_y_val);
							if(snr_val[pol]>=this_y_val){ // does this event pass?
								// printf("     This event has SNR %.2f, so it passes!\n",snr_val[pol]);
								// printf("          Old number of events in this bin %5f \n", numEventsPassed[bin]);
								numEventsPassed[pol][bin]+=1.;
								// printf(".         New number of events in this bin %5f \n", numEventsPassed[bin]);
							} // does event pass Rcut
						} // loop over SNR cuts
					}// not failing CW power cut?
				}// passes rest of analysis (not WFRMS, box, surface)
			}// loop over polarizations
		}// loop over events
	}
	std::cout<<endl;


	// okay, now save out the 2D histogram
	TCanvas *cSNRvsCorr = new TCanvas("","",2.1*850, 850);
	cSNRvsCorr->Divide(2,1);
	for(int pol=0; pol<2; pol++){
		cSNRvsCorr->cd(pol+1);
		h2SNRvsCorr[pol]->Draw("colz");
		h2SNRvsCorr[pol]->GetYaxis()->SetTitle("3rd Highest VPeak/RMS");
		h2SNRvsCorr[pol]->GetXaxis()->SetTitle("Peak Corr");
		gPad->SetLogz();
	}
	char title[300];
	sprintf(title, "%s/optimize/A%d_config%d_%dEvents_SNRvsCorr.png",plotPath,station,config,numTotal);
	// sprintf(title, "%s/optimize/%d.%d.%d_A%d_config%d_%dEvents_SNRvsCorr.png",plotPath,year_now, month_now, day_now,station,config,numTotal);
	cSNRvsCorr->SaveAs(title);
	delete cSNRvsCorr;

	for(int pol=0; pol<2; pol++){
		for(int bin=0; bin<numSNRbins-1; bin++){
			numEventsPassed_diff[pol][bin] = numEventsPassed[pol][bin] - numEventsPassed[pol][bin+1];
			// printf("Pol %d Bin %d at cut %.2f has %5.f events passing, and next bin has %5f, so diff is %.5f \n", pol, bin, intercept[pol][bin],numEventsPassed[pol][bin],numEventsPassed[pol][bin+1],numEventsPassed_diff[pol][bin]);
		}
	}

	TH1D *hEventsVsSNR[2];
	hEventsVsSNR[0] = new TH1D("DiffDistroV","DiffDistroV",numSNRbins,0,30);
	hEventsVsSNR[1] = new TH1D("DiffDistroH","DiffDistroH",numSNRbins,0,30);

	int max_bin[2];
	int last_filled_bin_above_2[2];
	int fit_start_bin[2];
	double start_of_fit[2];
	int last_filled_bin[2];
	double end_of_fit[2];

	for(int pol=0; pol<2; pol++){
		for(int bin=0; bin<numSNRbins; bin++){
			hEventsVsSNR[pol]->SetBinContent(bin+1,numEventsPassed_diff[pol][bin]);
		}
		max_bin[pol] = hEventsVsSNR[pol]->GetMaximumBin();
		// cout<<"Max bin is "<<max_bin[pol]<<endl;
		last_filled_bin_above_2[pol] = hEventsVsSNR[pol]->FindLastBinAbove(2.,1) + 2;
		// cout<<"Last filled bin above 2 is "<<last_filled_bin_above_2[pol]<<endl;
		fit_start_bin[pol] = int((last_filled_bin_above_2[pol] - max_bin[pol])/2) + max_bin[pol]; //start half-way between the peak bin and the last filled bin
		// cout<<"Fit start bin is "<<fit_start_bin[pol]<<endl;
		start_of_fit[pol] = hEventsVsSNR[pol]->GetBinCenter(fit_start_bin[pol]);
		// cout<<"Start of fit is "<<start_of_fit[pol]<<endl;
		last_filled_bin[pol] = hEventsVsSNR[pol]->FindLastBinAbove(0.,1);
		end_of_fit[pol] = hEventsVsSNR[pol]->GetBinCenter(last_filled_bin[pol]+2.); //go two bins more just to make sure fit is over
		// printf("Pol %d Start of fit is %.2f and end of fit is %.2f \n", pol, start_of_fit[pol], end_of_fit[pol]);

		printf("Pol %d: Last filled bin is bin %d and value %.2f \n", pol, last_filled_bin[pol], hEventsVsSNR[pol]->GetBinCenter(last_filled_bin[pol]));
		printf("Pol %d: Max bin is bin %d and value %.2f \n", pol, max_bin[pol], hEventsVsSNR[pol]->GetBinCenter(max_bin[pol]));
		printf("Pol %d: Proposed start of fit is bin %d and value %.2f \n", pol, fit_start_bin[pol], hEventsVsSNR[pol]->GetBinCenter(fit_start_bin[pol]));
	}


	// now we exponential fit
	char equation[150];
	sprintf(equation,"exp([0]*x+[1])");
	char equation_name[2][150];
	TF1 *fit[2];
	int status[2];
	double fitParams[2][2];
	double fitParamErrors[2][2];
	for(int pol=0; pol<2; pol++){
		sprintf(equation_name[pol],"ExpFit%d",pol);
		fit[pol] = new TF1(equation_name[pol],equation,start_of_fit[pol],end_of_fit[pol]);
		status[pol] = hEventsVsSNR[pol]->Fit(equation_name[pol],"LL,R");
		fitParams[pol][0] = fit[pol]->GetParameter(0);
		fitParams[pol][1] = fit[pol]->GetParameter(1);
		fitParamErrors[pol][0] = fit[pol]->GetParError(0);
		fitParamErrors[pol][1] = fit[pol]->GetParError(1);
		printf("Pol %d Fit Parameters are %.2f and %.2f \n", pol, fitParams[pol][0], fitParams[pol][1]);
	}

	double binWidthIntercept[2];
	double leftBoundary[2];
	double rightBoundary[2];
	double numBinsThisFit[2];
	char this_fit_title[2][400];
	TH1D *hNumObserved[2];
	for(int pol=0; pol<2; pol++){
		binWidthIntercept[pol] = hEventsVsSNR[pol]->GetBinWidth(1);
		leftBoundary[pol] = start_of_fit[pol] - binWidthIntercept[pol]/2.;
		rightBoundary[pol] = end_of_fit[pol] + binWidthIntercept[pol]/2.;
		numBinsThisFit[pol] = (rightBoundary[pol] - leftBoundary[pol])/binWidthIntercept[pol] + 1;
		sprintf(this_fit_title[pol],"Fit_Pol%d_Slope%.2f",pol,selected_slopes[pol]);
		hNumObserved[pol] = new TH1D(this_fit_title[pol],"",numBinsThisFit[pol],leftBoundary[pol],rightBoundary[pol]);
		for(int bin=0; bin<numBinsThisFit[pol]; bin++){
			double originalContent = hEventsVsSNR[pol]->GetBinContent(bin+fit_start_bin[pol]);
			hNumObserved[pol]->SetBinContent(bin+1,originalContent);
		}
	}

	/*
		We must now also loop through the data one more time to compute the "as last cut"
	*/

	double num_total_data=0.;
	double remove_bad_runs_and_livetime_data=0.;
	double and_remove_soft_data=0.;
	double and_remove_short_and_glitch_data=0.;
	double and_remove_tagged_cal_data=0.;

	double fails_WFRMS_first_data[2]={0.,0.};
	double fails_box_first_data[2]={0.,0.};
	double fails_surface_first_data[2]={0.,0.};
	double fails_rcut_first_data[2]={0.,0.};

	double fails_WFRMS_last_data[2]={0.,0.};
	double fails_box_last_data[2]={0.,0.};
	double fails_surface_last_data[2]={0.,0.};
	double fails_rcut_last_data[2]={0.,0.};

	double fails_WFRMS_insequence_data[2]={0.,0.};
	double fails_box_insequence_data[2]={0.,0.};
	double fails_surface_insequence_data[2]={0.,0.};
	double fails_rcut_insequence_data[2]={0.,0.};

	// now, we go back through the data a second time to get "as last cut" tables
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

		dataAllTree.SetBranchAddress("surf_V_new2",&isSurf[0]);
		dataAllTree.SetBranchAddress("surf_H_new2",&isSurf[1]);

		dataAllTree.SetBranchAddress("surf_top_V",&isSurfEvent_top[0]);
		dataAllTree.SetBranchAddress("surf_top_H",&isSurfEvent_top[1]);

		int isBadEvent;
		double weight;
		int unixTime;
		int isFirstFiveEvent;
		int hasBadSpareChanIssue;
		int hasBadSpareChanIssue2;
		int runNum;
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
		dataAllTree.SetBranchAddress("isSpikey",&isSpikey);
		dataAllTree.SetBranchAddress("isCliff",&isCliff);
		dataAllTree.SetBranchAddress("OutofBandIssue",&OutofBandIssue);
		dataAllTree.SetBranchAddress("bad_v2",&bad_v2);
		dataAllTree.SetBranchAddress("isRFEvent",&isRFEvent);
		dataAllTree.SetBranchAddress("isPayloadBlast2",&isPayloadBlast2);
		dataAllTree.SetBranchAddress("box300",&box300);
		dataAllTree.SetBranchAddress("runNum",&runNum);

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

		int numEntries = dataVTree.GetEntries();
		numTotal+=numEntries;

		dataAllTree.GetEvent(0);
		int currentRunNum = runNum;
		bool isThisABadRun = isBadRun(station,runNum,BadRunList);
		bool isThisASoftDomRun;

		//now to loop over events
		for(int event=0; event<numEntries; event++){

			dataVTree.GetEvent(event);
			dataHTree.GetEvent(event);
			dataAllTree.GetEvent(event);
			if(runNum!=currentRunNum){
				// printf("Incrementing bad run number to %d \n",runNum);
				// std::cout<<"*";
				currentRunNum=runNum;
				isThisABadRun = isBadRun(station,runNum, BadRunList);
				isThisASoftDomRun = isSoftwareDominatedRun(toolsPath, station, runNum); // A3Add: softwrae dominated
				if(isThisABadRun)
					printf(RED"*"RESET);
					// printf("     Yup, run %d is bad \n",runNum);
				else
					printf(GREEN"*"RESET);

			}

			num_total_data+=weight;

			if(isBadLivetime(station,unixTime)){
				continue;
			}
			remove_bad_runs_and_livetime_data+=weight;

			if(isSoft){
				continue;
			}
			and_remove_soft_data+=weight;

			// if(
			// 	(isBadEvent
			// 	|| isFirstFiveEvent
			// 	|| hasBadSpareChanIssue
			// 	|| hasBadSpareChanIssue2
			// 	|| isShort)
			// 	){
			// 	continue;
			// }
			// and_remove_short_and_glitch_data+=weight;

			if(
				(isBadEvent
				|| isFirstFiveEvent
				|| hasBadSpareChanIssue
				|| hasBadSpareChanIssue2
				|| isShort
				|| isThisASoftDomRun
				|| isSpikey
				|| isCliff
				|| OutofBandIssue
				|| bad_v2
				|| isPayloadBlast2
				|| !isRFEvent
				)
				){
				continue;
			}
			and_remove_short_and_glitch_data+=weight;

			if(isCal){
				continue;
			}
			and_remove_tagged_cal_data+=weight;
				
			for(int pol=0; pol<2; pol++){
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

				bool failsRcut=false;
				double this_SNR=snr_val[pol];
				double this_corr=corr_val[pol];
				double this_y_val = this_corr*selected_slopes[pol] + selected_intercepts[pol];
				if(this_SNR < this_y_val){
					failsRcut=true;
				}

				// "as first cut"
					// fail WFRMS first?
					if(WFRMS[pol] || failsCWPowerCut){
						fails_WFRMS_first_data[pol]+=weight;
					}
					// fail box first?
					if(isNewBox || box300){
						fails_box_first_data[pol]+=weight;
					}
					// fail surface first?
					if(isSurf[0] || isSurf[1] || isSurfEvent_top[pol]){
						fails_surface_first_data[pol]+=weight;
					}
					if(failsRcut){
						fails_rcut_first_data[pol]+=weight;
					}


				// "as last cut"
					// fails as last cut with surface?
					// survives WFRMS and box and Rcut, but doesn't survive surface
					if(!WFRMS[pol] && !failsCWPowerCut && !isNewBox && !box300 && !failsRcut){
						if(isSurf[0] || isSurf[1] || isSurfEvent_top[pol]){
							fails_surface_last_data[pol]+=weight;
						}
					}
					// fails as last cut with WFRMS?
					// survives box and surface, but doesn't survive WFRMS
					if(!isNewBox && !box300 && !isSurf[0] && !isSurf[1] && !isSurfEvent_top[pol] && !failsRcut){
						if(WFRMS[pol] || failsCWPowerCut){
							fails_WFRMS_last_data[pol]+=weight;
						}
					}
					// fails as last cut with box?
					// survives surface and WFRMS, but not the box
					if(!isSurf[0] && !isSurf[1] && !isSurfEvent_top[pol] && !WFRMS[pol] && !failsCWPowerCut && !failsRcut){
						if(isNewBox || box300){
							fails_box_last_data[pol]+=weight;
						}
					}
					// fails as last cust with Rcut?
					if(!isSurf[0] && !isSurf[1] && !isSurfEvent_top[pol] && !WFRMS[pol] && !failsCWPowerCut && !isNewBox && !box300){
						if(failsRcut){
							fails_rcut_last_data[pol]+=weight;
						}
					}

				// "in sequence"
					// fails WFRMS first? (same as "as first" for this cut only)
					if(WFRMS[pol] || failsCWPowerCut){
						fails_WFRMS_insequence_data[pol]+=weight;
					}
					// passes WFRMS, but fails box
					if(!WFRMS[pol] && !failsCWPowerCut && (isNewBox || box300)){
						fails_box_insequence_data[pol]+=weight;
					}
					// passes WFRMS and box, but fails surface
					if(!WFRMS[pol] && !failsCWPowerCut && !isNewBox && !box300 && (isSurf[0] || isSurf[1] || isSurfEvent_top[pol])){
						fails_surface_insequence_data[pol]+=weight;
					}
					// passes WFRMS, box, and surface, but fails Rcut (same as "as last" for this cut only)
					if(!WFRMS[pol] && !failsCWPowerCut && !isNewBox && !box300 && (!isSurf[0] && !isSurf[1] && !isSurfEvent_top[pol]) && failsRcut){
						fails_rcut_insequence_data[pol]+=weight;
					}
			}
		} // loop over events
	} // loop over files

	cout<<endl;

	printf("Num total          :           %7.1f\n",num_total_data);
	printf("Livetime           :           %7.1f\n",remove_bad_runs_and_livetime_data);
	printf("Soft Trig          :           %7.1f\n",and_remove_soft_data);
	printf("Short and Glitch   :           %7.1f\n",and_remove_short_and_glitch_data);
	printf("Tagged Cal         :           %7.1f\n",and_remove_tagged_cal_data);
	printf("------------------------------------------\n");
	printf("WFRMS              :           %7.1f, %7.1f, %7.1f | %7.1f, %7.1f, %7.1f \n",fails_WFRMS_first_data[0],fails_WFRMS_insequence_data[0],fails_WFRMS_last_data[0],fails_WFRMS_first_data[1],fails_WFRMS_insequence_data[1],fails_WFRMS_last_data[1]);
	printf("Box                :           %7.1f, %7.1f, %7.1f | %7.1f, %7.1f, %7.1f \n",fails_box_first_data[0],fails_box_insequence_data[0],fails_box_last_data[0],fails_box_first_data[1],fails_box_insequence_data[1],fails_box_last_data[1]);
	printf("Surf               :           %7.1f, %7.1f, %7.1f | %7.1f, %7.1f, %7.1f \n",fails_surface_first_data[0],fails_surface_insequence_data[0],fails_surface_last_data[0],fails_surface_first_data[1],fails_surface_insequence_data[1],fails_surface_last_data[1]);
	printf("Rcut               :           %7.1f, %7.1f, %7.1f | %7.1f, %7.1f, %7.1f \n",fails_rcut_first_data[0],fails_rcut_insequence_data[0],fails_rcut_last_data[0],fails_rcut_first_data[1],fails_rcut_insequence_data[1],fails_rcut_last_data[1]);

	printf(RED"Now, loop over simulation to get efficiencies \n"RESET);
	/*
		Now we must loop over simulation to get efficiencies and as last cut tables, etc.
	*/

	TChain simVTree("VTree");
	TChain simHTree("HTree");
	TChain simAllTree("AllTree");
	TChain simFilterTree("OutputTree"); // need this for energy distribution
	char the_sims[500];
	// sprintf(the_sims,"/fs/scratch/PAS0654/ara/sim/ValsForCuts/A%d/c%d/E%d/cutvals_drop_snrbins_0_0_wfrmsvals_-1.3_-1.4_run_*.root",station,config,224);
	// sprintf(the_sims,"/fs/project/PAS0654/ARA_DATA/A23/sim/ValsForCuts_UsedInA2FinalOpt/A%d/c%d/E%d/cutvals_drop_FiltSurface_snrbins_0_0_wfrmsvals_-1.3_-1.4_run_1111*.root",station,config,224);
	sprintf(the_sims,"/fs/project/PAS0654/ARA_DATA/A23/sim/ValsForCuts/A%d/c%d/E%d/*.root",station,config,224);
	simVTree.Add(the_sims);
	simHTree.Add(the_sims);
	simAllTree.Add(the_sims);
	simFilterTree.Add(the_sims);
	int numSimEvents = simVTree.GetEntries();
	printf("Num of sim entries is %d \n", numSimEvents);

	TH2D *h2SNRvsCorr_sim[2]; // SNR on Y axis, Corr on X axis, like in the TB
	h2SNRvsCorr_sim[0]=new TH2D("","V Sim",100,0,max,30,0,30);
	h2SNRvsCorr_sim[1]=new TH2D("","H Sim",100,0,max,30,0,30);

	double num_total_sim=0.;
	double fails_WFRMS_first_sim[2]={0.,0.};
	double fails_box_first_sim[2]={0.,0.};
	double fails_surface_first_sim[2]={0.,0.};
	double fails_rcut_first_sim[2]={0.,0.};

	double fails_WFRMS_last_sim[2]={0.,0.};
	double fails_box_last_sim[2]={0.,0.};
	double fails_surface_last_sim[2]={0.,0.};
	double fails_rcut_last_sim[2]={0.,0.};

	double fails_WFRMS_insequence_sim[2]={0.,0.};
	double fails_box_insequence_sim[2]={0.,0.};
	double fails_surface_insequence_sim[2]={0.,0.};
	double fails_rcut_insequence_sim[2]={0.,0.};

	double num_pass_total_either=0.;

	///////////////////////
	// for efficiency vs SNR
	///////////////////////

	TH1D *all_events[2];
	TH1D *pass_soft_short_cal_wfrms[2];
	TH1D *pass_soft_short_cal_wfrms_box[2];
	TH1D *pass_soft_short_cal_wfrms_box_surf[2];
	TH1D *pass_soft_short_cal_wfrms_box_surf_rcut[2];

	TH1D *eff[2];
	TH1D *eff_soft_short_cal[2];
	TH1D *eff_soft_short_cal_wfrms[2];
	TH1D *eff_soft_short_cal_wfrms_box[2];
	TH1D *eff_soft_short_cal_wfrms_box_surf[2];
	TH1D *eff_soft_short_cal_wfrms_box_surf_rcut[2];

	for(int i=0; i<2; i++){
		all_events[i] = new TH1D("","",25,0,25);
		pass_soft_short_cal_wfrms[i] = new TH1D("","",25,0,25);
		pass_soft_short_cal_wfrms_box[i] = new TH1D("","",25,0,25);
		pass_soft_short_cal_wfrms_box_surf[i] = new TH1D("","",25,0,25);
		pass_soft_short_cal_wfrms_box_surf_rcut[i] = new TH1D("","",25,0,25);

		eff_soft_short_cal_wfrms[i] = new TH1D("","",25,0,25);
		eff_soft_short_cal_wfrms_box[i] = new TH1D("","",25,0,25);
		eff_soft_short_cal_wfrms_box_surf[i] = new TH1D("","",25,0,25);
		eff_soft_short_cal_wfrms_box_surf_rcut[i] = new TH1D("","",25,0,25);
	}

	///////////////////////
	// for efficiency vs energy
	///////////////////////

	TH1D *all_events_vsE = new TH1D("","",5,16,21);
	TH1D *pass_soft_short_cal_wfrms_vsE =  new TH1D("","",5,16,21);
	TH1D *pass_soft_short_cal_wfrms_box_vsE =  new TH1D("","",5,16,21);
	TH1D *pass_soft_short_cal_wfrms_box_surf_vsE =  new TH1D("","",5,16,21);
	TH1D *pass_soft_short_cal_wfrms_box_surf_rcut_vsE = new TH1D("","",5,16,21);

	TH1D *eff_vsE = new TH1D("","",5,16,21);
	TH1D *eff_soft_short_cal_vsE =  new TH1D("","",5,16,21);
	TH1D *eff_soft_short_cal_wfrms_vsE =  new TH1D("","",5,16,21);
	TH1D *eff_soft_short_cal_wfrms_box_vsE =  new TH1D("","",5,16,21);
	TH1D *eff_soft_short_cal_wfrms_box_surf_vsE =  new TH1D("","",5,16,21);
	TH1D *eff_soft_short_cal_wfrms_box_surf_rcut_vsE =  new TH1D("","",5,16,21);

	{
		double corr_val[2];
		double snr_val[2];
		int WFRMS[2];
		double frac_of_power_notched_V[8];
		double frac_of_power_notched_H[8];
		int Refilt[2];

		// just swap out for "_new" variables in our new files

		simVTree.SetBranchAddress("corr_val_V_new",&corr_val[0]);
		simVTree.SetBranchAddress("snr_val_V_new",&snr_val[0]);
		simVTree.SetBranchAddress("wfrms_val_V_new",&WFRMS[0]);
		simVTree.SetBranchAddress("Refilt_V",&Refilt[0]);
		simHTree.SetBranchAddress("corr_val_H_new",&corr_val[1]);
		simHTree.SetBranchAddress("snr_val_H_new",&snr_val[1]);
		simHTree.SetBranchAddress("wfrms_val_H_new",&WFRMS[1]);
		simHTree.SetBranchAddress("Refilt_H",&Refilt[1]);

		int isCal;
		int isSoft;
		int isShort;
		int isCW;
		int isNewBox;
		int isSurf[2];
		int isBadEvent;
		double weight;
		int isSurfEvent_top[2];
		int unixTime;
		int isFirstFiveEvent;
		int hasBadSpareChanIssue;
		int hasBadSpareChanIssue2;

		bool isSpikey;
		bool isCliff;
		bool OutofBandIssue;
		bool bad_v2;
		bool isRFEvent;
		bool isPayloadBlast2;
		int box300;

		simAllTree.SetBranchAddress("cal",&isCal);
		simAllTree.SetBranchAddress("soft",&isSoft);
		simAllTree.SetBranchAddress("short",&isShort);
		simAllTree.SetBranchAddress("CW",&isCW);
		simAllTree.SetBranchAddress("box",&isNewBox);
		simAllTree.SetBranchAddress("surf_V_new2",&isSurf[0]);
		simAllTree.SetBranchAddress("surf_H_new2",&isSurf[1]);
		simAllTree.SetBranchAddress("bad",&isBadEvent);
		simAllTree.SetBranchAddress("weight",&weight);
		simAllTree.SetBranchAddress("surf_top_V",&isSurfEvent_top[0]);
		simAllTree.SetBranchAddress("surf_top_H",&isSurfEvent_top[1]);
		simAllTree.SetBranchAddress("unixTime",&unixTime);
		simAllTree.SetBranchAddress("isFirstFiveEvent",&isFirstFiveEvent);
		simAllTree.SetBranchAddress("hasBadSpareChanIssue",&hasBadSpareChanIssue);
		simAllTree.SetBranchAddress("hasBadSpareChanIssue2",&hasBadSpareChanIssue2);
		simAllTree.SetBranchAddress("isSpikey",&isSpikey);
		simAllTree.SetBranchAddress("isCliff",&isCliff);
		simAllTree.SetBranchAddress("OutofBandIssue",&OutofBandIssue);
		simAllTree.SetBranchAddress("bad_v2",&bad_v2);
		simAllTree.SetBranchAddress("isRFEvent",&isRFEvent);
		simAllTree.SetBranchAddress("isPayloadBlast2",&isPayloadBlast2);
		simAllTree.SetBranchAddress("box300",&box300);

		double energy;
		simFilterTree.SetBranchAddress("energy",&energy);

		for(int event=0; event<numSimEvents; event++){

			simVTree.GetEvent(event);
			simHTree.GetEvent(event);
			simAllTree.GetEvent(event);
			simFilterTree.GetEvent(event);

			num_total_sim+=weight;

			bool failsCWPowerCut[2] = {false};
			bool failsRcut[2] = {false};

			isRFEvent=true; //screwed this up for simulation, dammit

			// new cuts in A3
			if(!isRFEvent || isSpikey || isCliff || OutofBandIssue || bad_v2 || isPayloadBlast2){
				continue;
			}

			// now, do the polarization dependent cuts, which requires pol-specific SNR information
			for(int pol=0; pol<2; pol++){

				if(Refilt[pol] && !WFRMS[pol]){
					vector<double> frac;
					for(int i=0; i<8; i++){
						if(pol==0) frac.push_back(frac_of_power_notched_V[i]);
						else if(pol==1) frac.push_back(frac_of_power_notched_H[i]);
					}
					sort(frac.begin(), frac.end(), std::greater<double>());
					if(frac[2]>0.06){
						failsCWPowerCut[pol]=true;
					}
				} //refiltered?

				double this_SNR=snr_val[pol];
				double this_corr=corr_val[pol];
				double this_y_val = this_corr*selected_slopes[pol] + selected_intercepts[pol];
				if(this_SNR < this_y_val){
					failsRcut[pol]=true;
				}

				if (this_SNR>24.) this_SNR=24.;
				all_events[pol]->Fill(this_SNR,weight);
				if(!WFRMS[pol] && !failsCWPowerCut[pol]){
					pass_soft_short_cal_wfrms[pol]->Fill(this_SNR,weight);
					if(!isNewBox && !box300){
						pass_soft_short_cal_wfrms_box[pol]->Fill(this_SNR,weight);
						if(!isSurf[0] && !isSurf[1] && !isSurfEvent_top[pol]){
							h2SNRvsCorr_sim[pol]->Fill(corr_val[pol],snr_val[pol],weight); // fill this now, after all cuts
							pass_soft_short_cal_wfrms_box_surf[pol]->Fill(this_SNR,weight);
							if(!failsRcut[pol])
								pass_soft_short_cal_wfrms_box_surf_rcut[pol]->Fill(this_SNR,weight);
						}
					}
				}

				// "as first cut"
					// fail WFRMS first?
					if(WFRMS[pol] || failsCWPowerCut[pol]){
						fails_WFRMS_first_sim[pol]+=weight;
					}
					// fail box first?
					if(isNewBox || box300){
						fails_box_first_sim[pol]+=weight;
					}
					// fail surface first?
					if(isSurf[0] || isSurf[1] || isSurfEvent_top[pol]){
						fails_surface_first_sim[pol]+=weight;
					}
					if(failsRcut[pol]){
						fails_rcut_first_sim[pol]+=weight;
					}


				// "as last cut"
					// fails as last cut with surface?
					// survives WFRMS and box, but doesn't survive surface
					if(!WFRMS[pol] && !failsCWPowerCut[pol] && !isNewBox && !box300 && !failsRcut[pol]){
						if(isSurf[0] || isSurf[1] || isSurfEvent_top[pol]){
							fails_surface_last_sim[pol]+=weight;
						}
					}
					// fails as last cut with WFRMS?
					// survives box and surface, but doesn't survive WFRMS
					if(!isNewBox && !box300 && !isSurf[0] && !isSurf[1] && !isSurfEvent_top[pol] && !failsRcut[pol]){
						if(WFRMS[pol] || failsCWPowerCut[pol]){
							fails_WFRMS_last_sim[pol]+=weight;
						}
					}
					// fails as last cut with box?
					// survives surface and WFRMS, but not the box
					if(!isSurf[0] && !isSurf[1] && !isSurfEvent_top[pol] && !WFRMS[pol] && !failsCWPowerCut[pol] && !failsRcut[pol]){
						if(isNewBox || box300){
							fails_box_last_sim[pol]+=weight;
						}
					}
					// fails as last cust with Rcut?
					if(!isSurf[0] && !isSurf[1] && !isSurfEvent_top[pol] && !WFRMS[pol] && !failsCWPowerCut[pol] && !isNewBox && !box300){
						if(failsRcut[pol]){
							fails_rcut_last_sim[pol]+=weight;
						}
					}

				// "in sequence"
					// fails WFRMS first? (same as "as first" for this cut only)
					if(WFRMS[pol] || failsCWPowerCut[pol]){
						fails_WFRMS_insequence_sim[pol]+=weight;
					}
					// passes WFRMS, but fails box
					if(!WFRMS[pol] && !failsCWPowerCut[pol] && (isNewBox || box300)){
						fails_box_insequence_sim[pol]+=weight;
					}
					// passes WFRMS and box, but fails surface
					if(!WFRMS[pol] && !failsCWPowerCut[pol] && !isNewBox && !box300 && (isSurf[0] || isSurf[1] || isSurfEvent_top[pol])){
						fails_surface_insequence_sim[pol]+=weight;
					}
					// passes WFRMS, box, and surface, but fails Rcut (same as "as last" for this cut only)
					if(!WFRMS[pol] && !failsCWPowerCut[pol] && !isNewBox && !box300 && (!isSurf[0] && !isSurf[1] && !isSurfEvent_top[pol]) && failsRcut[pol]){
						fails_rcut_insequence_sim[pol]+=weight;
					}
			} // loop over pol

			// alternative way of accounting
			// bool pass_this_pol[2]=false;
			// for(int pol=0; pol<2; pol++){
			// 	if(!WFRMS[pol] && !failsCWPowerCut[pol]){
			// 		if(!isNewBox){
			// 			if(!isSurf[0] && !isSurf[1] && !isSurfEvent_top[pol]){
			// 				if(!failsRcut[pol]){
			// 					pass_this_pol[pol]=true;
			// 				}
			// 			}
			// 		}
			// 	}
			// }
			// if(pass_this_pol[0] || pass_this_pol[1]){
			// 	pass_soft_short_cal_wfrms_box_surf_rcut_vsE->Fill(logE,weight);
			// 	num_pass_total_either+=weight;
			// }

			// and now to do efficiencies as a function of energy, which requires, well, not pol-specific SNR information
			double logE = TMath::Log10(energy);
			all_events_vsE->Fill(logE,weight);
			if((!WFRMS[0] && !failsCWPowerCut[0]) || (!WFRMS[1] && !failsCWPowerCut[1])){
				pass_soft_short_cal_wfrms_vsE->Fill(logE,weight);
				if(!isNewBox && !box300){
					pass_soft_short_cal_wfrms_box_vsE->Fill(logE,weight);
					if(!isSurf[0] && !isSurf[1] && !isSurfEvent_top[0] && !isSurfEvent_top[1]){
						pass_soft_short_cal_wfrms_box_surf_vsE->Fill(logE,weight);
						if(!failsRcut[0] || !failsRcut[1]){
							pass_soft_short_cal_wfrms_box_surf_rcut_vsE->Fill(logE,weight);
							num_pass_total_either+=weight;
						}
					}
				}
			}

		} //loop over sim events
	}

	printf("Sim Num total          :           %7.1f\n",num_total_sim);
	printf("------------------------------------------\n");
	printf("Sim WFRMS              :           %7.1f, %7.1f, %7.1f | %7.1f, %7.1f, %7.1f \n",fails_WFRMS_first_sim[0],fails_WFRMS_insequence_sim[0],fails_WFRMS_last_sim[0],fails_WFRMS_first_sim[1],fails_WFRMS_insequence_sim[1],fails_WFRMS_last_sim[1]);
	printf("Sim Box                :           %7.1f, %7.1f, %7.1f | %7.1f, %7.1f, %7.1f \n",fails_box_first_sim[0],fails_box_insequence_sim[0],fails_box_last_sim[0],fails_box_first_sim[1],fails_box_insequence_sim[1],fails_box_last_sim[1]);
	printf("Sim Surf               :           %7.1f, %7.1f, %7.1f | %7.1f, %7.1f, %7.1f \n",fails_surface_first_sim[0],fails_surface_insequence_sim[0],fails_surface_last_sim[0],fails_surface_first_sim[1],fails_surface_insequence_sim[1],fails_surface_last_sim[1]);
	printf("Sim Rcut               :           %7.1f, %7.1f, %7.1f | %7.1f, %7.1f, %7.1f \n",fails_rcut_first_sim[0],fails_rcut_insequence_sim[0],fails_rcut_last_sim[0],fails_rcut_first_sim[1],fails_rcut_insequence_sim[1],fails_rcut_last_sim[1]);

	printf("Num passing either pol total %.2f \n", num_pass_total_either);

	// cook up the efficiencies vs SNR
	int colors [28] = { kBlue, kRed, kGreen, kMagenta, kCyan};
	for(int pol=0; pol<2; pol++){
		for(int bin=0; bin<=all_events[pol]->GetNbinsX(); bin++){
			double thrown = all_events[pol]->GetBinContent(bin);
			double pass_soft_short_cal_wfrms_this = pass_soft_short_cal_wfrms[pol]->GetBinContent(bin);
			double pass_soft_short_cal_wfrms_box_this = pass_soft_short_cal_wfrms_box[pol]->GetBinContent(bin);
			double pass_soft_short_cal_wfrms_box_surf_this = pass_soft_short_cal_wfrms_box_surf[pol]->GetBinContent(bin);
			double pass_soft_short_cal_wfrms_box_surf_rcut_this = pass_soft_short_cal_wfrms_box_surf_rcut[pol]->GetBinContent(bin);
			if(thrown>0.){
				eff_soft_short_cal_wfrms[pol]->SetBinContent(bin,pass_soft_short_cal_wfrms_this/thrown);
				eff_soft_short_cal_wfrms_box[pol]->SetBinContent(bin,pass_soft_short_cal_wfrms_box_this/thrown);
				eff_soft_short_cal_wfrms_box_surf[pol]->SetBinContent(bin,pass_soft_short_cal_wfrms_box_surf_this/thrown);
				eff_soft_short_cal_wfrms_box_surf_rcut[pol]->SetBinContent(bin,pass_soft_short_cal_wfrms_box_surf_rcut_this/thrown);
			}
			else{
				eff_soft_short_cal_wfrms[pol]->SetBinContent(bin,0.);
				eff_soft_short_cal_wfrms_box[pol]->SetBinContent(bin,0.);
				eff_soft_short_cal_wfrms_box_surf[pol]->SetBinContent(bin,0.);
				eff_soft_short_cal_wfrms_box_surf_rcut[pol]->SetBinContent(bin,0.);
			}
		}
	}

	// and, cook up the efficiencies vs energy
	for(int bin=0; bin<=all_events_vsE->GetNbinsX(); bin++){
		double thrown = all_events_vsE->GetBinContent(bin);
		double pass_soft_short_cal_wfrms_this = pass_soft_short_cal_wfrms_vsE->GetBinContent(bin);
		double pass_soft_short_cal_wfrms_box_this = pass_soft_short_cal_wfrms_box_vsE->GetBinContent(bin);
		double pass_soft_short_cal_wfrms_box_surf_this = pass_soft_short_cal_wfrms_box_surf_vsE->GetBinContent(bin);
		double pass_soft_short_cal_wfrms_box_surf_rcut_this = pass_soft_short_cal_wfrms_box_surf_rcut_vsE->GetBinContent(bin);
		if(thrown>0.){
			eff_soft_short_cal_wfrms_vsE->SetBinContent(bin,pass_soft_short_cal_wfrms_this/thrown);
			eff_soft_short_cal_wfrms_box_vsE->SetBinContent(bin,pass_soft_short_cal_wfrms_box_this/thrown);
			eff_soft_short_cal_wfrms_box_surf_vsE->SetBinContent(bin,pass_soft_short_cal_wfrms_box_surf_this/thrown);
			eff_soft_short_cal_wfrms_box_surf_rcut_vsE->SetBinContent(bin,pass_soft_short_cal_wfrms_box_surf_rcut_this/thrown);
		}
		else{
			eff_soft_short_cal_wfrms_vsE->SetBinContent(bin,0.);
			eff_soft_short_cal_wfrms_box_vsE->SetBinContent(bin,0.);
			eff_soft_short_cal_wfrms_box_surf_vsE->SetBinContent(bin,0.);
			eff_soft_short_cal_wfrms_box_surf_rcut_vsE->SetBinContent(bin,0.);
		}
	}

	/*
		and now we need a super mega canvas at the end
		where we can plot everything we know about the search in this configuration
		this will include
			-- the plot of corr_vs_snr for data in both pols
			-- the plot of rotated cut "zoomed out" for data in both pols
			-- the plot of rotated cut "zoomed in" for data in both pols
			-- the plot of corr_vs_snr for sim in both pol
			-- the plot of efficiency_vs_snr by polarization
			-- the plot of efficiency_vs_energy overall
	*/

	vector<TGraph*> cut_lines;
	for(int pol=0; pol<2; pol++){
		vector <double> x_vals_for_line;
		vector <double> y_vals_for_line;
		for(double x=0; x<0.020; x+=0.00001){
			double y_val = (selected_slopes[pol] * x ) + selected_intercepts[pol];
			x_vals_for_line.push_back(x);
			y_vals_for_line.push_back(y_val);
		}
		cut_lines.push_back(new TGraph(x_vals_for_line.size(), &x_vals_for_line[0], &y_vals_for_line[0]));
	}

	char fit_title_words[2][400];

	TCanvas *cRcut = new TCanvas("","",6*850,2*850);
	cRcut->Divide(6,2);
	for(int pol=0; pol<2; pol++){
		cRcut->cd(pol+1+(pol==0 ? 0 : 5)); // for corr vs snr, data
			h2SNRvsCorr[pol]->Draw("colz");
			h2SNRvsCorr[pol]->GetXaxis()->SetTitle("Correlation Value");
			h2SNRvsCorr[pol]->GetYaxis()->SetTitle("SNR");
			gPad->SetLogz();
			cut_lines[pol]->Draw("same");
			cut_lines[pol]->SetLineColor(kRed);
		cRcut->cd(pol+2+(pol==0 ? 0 : 5)); // for differential distribution, zoom out
			hEventsVsSNR[pol]->Draw("");
			hEventsVsSNR[pol]->GetXaxis()->SetTitle("SNR Cut (y-intercept value)");
			hEventsVsSNR[pol]->GetYaxis()->SetTitle("Number of Events Cut");
			hEventsVsSNR[pol]->SetTitle("Differential Distribution");
			gPad->SetLogy();
		cRcut->cd(pol+3+(pol==0 ? 0 : 5)); // for differential distribution, zoom in
			hNumObserved[pol]->Draw("HIST");
			hNumObserved[pol]->GetXaxis()->SetTitle("SNR Cut (y-intercept value)");
			hNumObserved[pol]->GetYaxis()->SetTitle("Number of Events Cut");
			sprintf(fit_title_words[pol],"Fit exp(%.2fx + %.2f)",fitParams[pol][0], fitParams[pol][1]);
			hNumObserved[pol]->SetTitle(fit_title_words[pol]);
			fit[pol]->Draw("same");
			fit[pol]->SetLineColor(kRed);
			gPad->SetLogy();
		cRcut->cd(pol+4+(pol==0 ? 0 : 5)); // for corr vs snr, sim
			h2SNRvsCorr_sim[pol]->Draw("colz");
			h2SNRvsCorr_sim[pol]->GetXaxis()->SetTitle("Correlation Value");
			h2SNRvsCorr_sim[pol]->GetYaxis()->SetTitle("SNR");
			gPad->SetLogz();
			cut_lines[pol]->Draw("same");
			cut_lines[pol]->SetLineColor(kRed);
		cRcut->cd(pol+5+(pol==0 ? 0 : 5)); // for efficiencies vs snr
			eff_soft_short_cal_wfrms[pol]->Draw("");
			eff_soft_short_cal_wfrms_box[pol]->Draw("same");
			eff_soft_short_cal_wfrms_box_surf[pol]->Draw("same");
			eff_soft_short_cal_wfrms_box_surf_rcut[pol]->Draw("same");

			eff_soft_short_cal_wfrms[pol]->GetXaxis()->SetTitle("3rd Highest Vpeak/RMS");
			eff_soft_short_cal_wfrms[pol]->GetYaxis()->SetTitle("Efficiency (weighted)");

			eff_soft_short_cal_wfrms[pol]->SetLineColor(colors[0]);
			eff_soft_short_cal_wfrms_box[pol]->SetLineColor(colors[1]);
			eff_soft_short_cal_wfrms_box_surf[pol]->SetLineColor(colors[2]);
			eff_soft_short_cal_wfrms_box_surf_rcut[pol]->SetLineColor(colors[3]);

			eff_soft_short_cal_wfrms[pol]->SetLineWidth(2.);
			eff_soft_short_cal_wfrms_box[pol]->SetLineWidth(2.);
			eff_soft_short_cal_wfrms_box_surf[pol]->SetLineWidth(2.);
			eff_soft_short_cal_wfrms_box_surf_rcut[pol]->SetLineWidth(2.);
			if(pol==0){
				TLegend *leg = new TLegend(0.5,0.4,0.9,0.2);
				leg->AddEntry(eff_soft_short_cal_wfrms[pol],"Cut WFMRS","l");
				leg->AddEntry(eff_soft_short_cal_wfrms_box[pol],"+Cut Cal Pulser Reco","l");
				leg->AddEntry(eff_soft_short_cal_wfrms_box_surf[pol],"+Cut Surf & Top Surf","l");
				leg->AddEntry(eff_soft_short_cal_wfrms_box_surf_rcut[pol],"+Cut Peak/Corr","l");
				leg->Draw();
			}
	}
	cRcut->cd(6);
	// last, but no least, add efficiency vs energy
	eff_soft_short_cal_wfrms_vsE->Draw("");
	eff_soft_short_cal_wfrms_box_vsE->Draw("same");
	eff_soft_short_cal_wfrms_box_surf_vsE->Draw("same");
	eff_soft_short_cal_wfrms_box_surf_rcut_vsE->Draw("same");

	eff_soft_short_cal_wfrms_vsE->GetXaxis()->SetTitle("log10(E) [eV]");
	eff_soft_short_cal_wfrms_vsE->GetYaxis()->SetTitle("Efficiency (weighted)");

	eff_soft_short_cal_wfrms_vsE->SetLineColor(colors[0]);
	eff_soft_short_cal_wfrms_box_vsE->SetLineColor(colors[1]);
	eff_soft_short_cal_wfrms_box_surf_vsE->SetLineColor(colors[2]);
	eff_soft_short_cal_wfrms_box_surf_rcut_vsE->SetLineColor(colors[3]);

	eff_soft_short_cal_wfrms_vsE->SetLineWidth(2.);
	eff_soft_short_cal_wfrms_box_vsE->SetLineWidth(2.);
	eff_soft_short_cal_wfrms_box_surf_vsE->SetLineWidth(2.);
	eff_soft_short_cal_wfrms_box_surf_rcut_vsE->SetLineWidth(2.);
	TLegend *leg2 = new TLegend(0.5,0.4,0.9,0.2);
	leg2->AddEntry(eff_soft_short_cal_wfrms_vsE,"Cut WFMRS","l");
	leg2->AddEntry(eff_soft_short_cal_wfrms_box_vsE,"+Cut Cal Pulser Reco","l");
	leg2->AddEntry(eff_soft_short_cal_wfrms_box_surf_vsE,"+Cut Surf & Top Surf","l");
	leg2->AddEntry(eff_soft_short_cal_wfrms_box_surf_rcut_vsE,"+Cut Peak/Corr","l");
	leg2->Draw();

	char save_title[400];
	// sprintf(save_title,"%s/optimize/A%d_config%d_Final_VSlope_%.2f_HSlope_%.2f_VInt_%.2f_Hint_%.2f.png",
	sprintf(save_title,"%s/%d.%d.%d_A%d_config%d_Final_VSlope_%.2f_HSlope_%.2f_VInt_%.2f_Hint_%.2f.png",
						plotPath,
						year_now, month_now, day_now,
						station,
						config,
						selected_slopes[0],
						selected_slopes[1],
						selected_intercepts[0],
						selected_intercepts[1]);
	cRcut->SaveAs(save_title);	


	////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////
	////////////////////////////////////////////////////////////////

	/*
		And now more plots thaty are more "thesis" quality
	*/
	// TCanvas *cEff = new TCanvas("","",2*850,850);
	// cEff->Divide(2,1);
	// for(int pol=0; pol<2; pol++){
	// 	cEff->cd(pol+1);
	// 	eff_soft_short_cal_wfrms[pol]->Draw("");
	// 	eff_soft_short_cal_wfrms_box[pol]->Draw("same");
	// 	eff_soft_short_cal_wfrms_box_surf[pol]->Draw("same");
	// 	eff_soft_short_cal_wfrms_box_surf_rcut[pol]->Draw("same");

	// 	eff_soft_short_cal_wfrms[pol]->GetXaxis()->SetTitle("3rd Highest Vpeak/RMS");
	// 	eff_soft_short_cal_wfrms[pol]->GetYaxis()->SetTitle("Efficiency (weighted)");

	// 	eff_soft_short_cal_wfrms[pol]->GetYaxis()->SetTitleOffset(1.2);
	// 	eff_soft_short_cal_wfrms[pol]->GetXaxis()->SetTitleOffset(1.2);
	// 	eff_soft_short_cal_wfrms[pol]->GetYaxis()->SetTitleOffset(1.2);
	// 	eff_soft_short_cal_wfrms[pol]->GetZaxis()->SetTitleOffset(1.2);
	// 	eff_soft_short_cal_wfrms[pol]->GetXaxis()->SetTitleSize(0.04);
	// 	eff_soft_short_cal_wfrms[pol]->GetYaxis()->SetTitleSize(0.04);
	// 	eff_soft_short_cal_wfrms[pol]->GetZaxis()->SetTitleSize(0.04);
	// 	eff_soft_short_cal_wfrms[pol]->GetXaxis()->SetLabelSize(0.04);
	// 	eff_soft_short_cal_wfrms[pol]->GetYaxis()->SetLabelSize(0.04);
	// 	eff_soft_short_cal_wfrms[pol]->GetZaxis()->SetLabelSize(0.04);

	// 	if(pol==0)
	// 		eff_soft_short_cal_wfrms[pol]->SetTitle("VPol Efficiency");
	// 	if(pol==1)
	// 		eff_soft_short_cal_wfrms[pol]->SetTitle("HPol Efficiency");		


	// 	eff_soft_short_cal_wfrms[pol]->SetLineColor(colors[0]);
	// 	eff_soft_short_cal_wfrms_box[pol]->SetLineColor(colors[1]);
	// 	eff_soft_short_cal_wfrms_box_surf[pol]->SetLineColor(colors[2]);
	// 	eff_soft_short_cal_wfrms_box_surf_rcut[pol]->SetLineColor(colors[3]);

	// 	eff_soft_short_cal_wfrms[pol]->SetLineWidth(2.);
	// 	eff_soft_short_cal_wfrms_box[pol]->SetLineWidth(2.);
	// 	eff_soft_short_cal_wfrms_box_surf[pol]->SetLineWidth(2.);
	// 	eff_soft_short_cal_wfrms_box_surf_rcut[pol]->SetLineWidth(2.);
	// 	if(pol==0){
	// 		TLegend *leg = new TLegend(0.5,0.4,0.9,0.2);
	// 		leg->AddEntry(eff_soft_short_cal_wfrms[pol],"Cut WFMRS","l");
	// 		leg->AddEntry(eff_soft_short_cal_wfrms_box[pol],"+Cut Cal Pulser Reco","l");
	// 		leg->AddEntry(eff_soft_short_cal_wfrms_box_surf[pol],"+Cut Surf & Top Surf","l");
	// 		leg->AddEntry(eff_soft_short_cal_wfrms_box_surf_rcut[pol],"+Cut Peak/Corr","l");
	// 		leg->Draw();
	// 	}
	// }
	// cEff->cd(1);
	// char pretty_title[400];
	// sprintf(pretty_title,"/users/PAS0654/osu0673/A23_analysis_new2/results/thesis/rcut_a%d_c%d_eff.pdf",station,config);
	// cEff->SaveAs(pretty_title);


	// for(int snrBin=0; snrBin<=eff_soft_short_cal_wfrms_box_surf_rcut[0]->GetNbinsX(); snrBin++){
	// 	double binCenter = eff_soft_short_cal_wfrms_box_surf_rcut[0]->GetBinCenter(snrBin);
	// 	double eff = eff_soft_short_cal_wfrms_box_surf_rcut[0]->GetBinContent(snrBin);
	// 	printf("VPol Efficiency for SNR bin %d with center %.2f is %.2f \n",snrBin,binCenter,eff);
	// }


	// TCanvas *cEffVsE = new TCanvas("","",1.1*850,850);
	// 	eff_soft_short_cal_wfrms_vsE->Draw("");
	// 	eff_soft_short_cal_wfrms_box_vsE->Draw("same");
	// 	eff_soft_short_cal_wfrms_box_surf_vsE->Draw("same");
	// 	eff_soft_short_cal_wfrms_box_surf_rcut_vsE->Draw("same");

	// 	eff_soft_short_cal_wfrms_vsE->GetXaxis()->SetTitle("log10(E) [eV]");
	// 	eff_soft_short_cal_wfrms_vsE->GetYaxis()->SetTitle("Efficiency (weighted)");

	// 	eff_soft_short_cal_wfrms_vsE->GetYaxis()->SetTitleOffset(1.2);
	// 	eff_soft_short_cal_wfrms_vsE->GetXaxis()->SetTitleOffset(1.2);
	// 	eff_soft_short_cal_wfrms_vsE->GetYaxis()->SetTitleOffset(1.2);
	// 	eff_soft_short_cal_wfrms_vsE->GetZaxis()->SetTitleOffset(1.2);
	// 	eff_soft_short_cal_wfrms_vsE->GetXaxis()->SetTitleSize(0.04);
	// 	eff_soft_short_cal_wfrms_vsE->GetYaxis()->SetTitleSize(0.04);
	// 	eff_soft_short_cal_wfrms_vsE->GetZaxis()->SetTitleSize(0.04);
	// 	eff_soft_short_cal_wfrms_vsE->GetXaxis()->SetLabelSize(0.04);
	// 	eff_soft_short_cal_wfrms_vsE->GetYaxis()->SetLabelSize(0.04);
	// 	eff_soft_short_cal_wfrms_vsE->GetZaxis()->SetLabelSize(0.04);

	// 	eff_soft_short_cal_wfrms_vsE->SetLineWidth(3.);
	// 	eff_soft_short_cal_wfrms_box_vsE->SetLineWidth(3.);
	// 	eff_soft_short_cal_wfrms_box_surf_vsE->SetLineWidth(3.);
	// 	eff_soft_short_cal_wfrms_box_surf_rcut_vsE->SetLineWidth(3.);
	// 	leg2->Draw();
	// sprintf(pretty_title,"/users/PAS0654/osu0673/A23_analysis_new2/results/thesis/rcut_a%d_c%d_eff_vs_energy.pdf",station,config);
	// cEffVsE->SaveAs(pretty_title);

	// for(int eBin=0; eBin<=eff_soft_short_cal_wfrms_box_surf_rcut_vsE->GetNbinsX(); eBin++){
	// 	double binCenter = eff_soft_short_cal_wfrms_box_surf_rcut_vsE->GetBinCenter(eBin);
	// 	double eff = eff_soft_short_cal_wfrms_box_surf_rcut_vsE->GetBinContent(eBin);
	// 	printf("Efficiency for energy bin %d with center %.2f is %.2f \n",eBin,binCenter,eff);
	// }


}
