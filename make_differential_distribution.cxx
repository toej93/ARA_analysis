////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////	v2_final_plots.cxx
////	A23 diffuse, make plots of the final cut parameter space
////	At this point, you must pass it the final slope and intercept that you want for the Rcut
////	Because it's going to assume you've already optimized them elsewhere
////	This will generate the big mega finale canvas that has all our cut information contained
////	make plots less hideous
////
////	Nov 2018
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

	int numTotal=0;

	// just for V for a hot minute

	// let's see if we can do it with arrays....
	int numSNRbins=300; //let this go all the way up to 30
	double numEventsPassed[2][numSNRbins]; // number of events passing in a polarization, and for that snr bin
	double numEventsPassed_diff[2][numSNRbins]; // the difference between the number of events cut between this bin and the next

	double dRcut=0.1; // SNR bin incremets (bins in 0.1 SNR units)
	double Rcutmin=0.; //mininum value is 0
	double intercept[2][numSNRbins]; // what numerical value corresponds to that bin in the snr (intercept) scan
	for(int pol=0; pol<2; pol++){
		for(int bin=0; bin<numSNRbins; bin++){
			numEventsPassed[pol][bin]=0.; //initialize...
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
	h2SNRvsCorr[0]=new TH2D("","V Data, good runs",100,0,max,300,0,30);
	h2SNRvsCorr[1]=new TH2D("","H Data, good runs",100,0,max,300,0,30);


	// load the data up
	TChain dataVTree("VTree");
	TChain dataHTree("HTree");
	TChain dataAllTree("AllTree");
	char the_data[500];
	// sprintf(the_data,"/fs/scratch/PAS0654/ara/10pct/ValsForCuts/A%d/c%d/cutvals_drop_snrbins_0_0_wfrmsvals_-1.3_-1.4_run_*.root",station,config);
	sprintf(the_data,"/fs/project/PAS0654/ARA_DATA/A23/10pct_redo/ValsForCuts/A%d_actuallyCWThresh2.0/c%d/cutvals_drop_FiltSurface_CWThresh2.5_snrbins_0_1_wfrmsvals_-1.0_-1.1_run_*.root",station,config);
	if(config==5) sprintf(the_data,"/fs/project/PAS0654/ARA_DATA/A23/10pct_redo/ValsForCuts/A%d_actuallyCWThresh2.0/c%d/cutvals_drop_FiltSurface_CWThresh2.5_snrbins_0_1_wfrmsvals_-0.7_-0.8_run_*.root",station,config);
	int result = dataVTree.Add(the_data);
	dataHTree.Add(the_data);
	dataAllTree.Add(the_data);
	int numDataEvents = dataVTree.GetEntries();

	// do this inside brackets for scoping power and re-use of identical variable names when it comes time for simulation to happen
	{

		// I store copies of the variable (original = org) for what they were *before* any filtering
		// and a copy "new" for what they were after filtering. we only use the "new" values
		// you might want to change these to "old"


		double corr_val[2]; // the correlation value, one for each polarization
		double snr_val[2]; // the snr value, one for each polarization
		int WFRMS[2]; // if the event passed or didn't pass the wavefront RMS cut
		int theta_300[2]; // the 300m theta value, one for each polarization
		int phi_300[2]; // the 300m, phi value, one for each polarization
		int theta_41[2]; // the 41m theta value, one for each polarization
		int phi_41[2]; // the 41m, phi value, one for each polarization

		int Refilt[2]; // was the event tagged as having cw, and subsequently filtered of that CW, in this polarization?
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

		int isCal; // was it a tagged cal pulser?
		int isSoft; // is it a software trigger?
		int isShort; // does it have a short waveform?
		int isCW; // was it flagged as being CW (outdated, do not use as a cut flag)
		int isNewBox; // was it inside the new cal pulser box for CP5 or CP6?

		dataAllTree.SetBranchAddress("cal",&isCal);
		dataAllTree.SetBranchAddress("soft",&isSoft);
		dataAllTree.SetBranchAddress("short",&isShort);
		dataAllTree.SetBranchAddress("CW",&isCW);
		dataAllTree.SetBranchAddress("box",&isNewBox);

		int isSurf[2]; // a surface event after filtering?
		int isSurfEvent_top[2]; // a top face event?

		dataAllTree.SetBranchAddress("surf_V_new",&isSurf[0]);
		dataAllTree.SetBranchAddress("surf_H_new",&isSurf[1]);

		dataAllTree.SetBranchAddress("surf_top_V",&isSurfEvent_top[0]);
		dataAllTree.SetBranchAddress("surf_top_H",&isSurfEvent_top[1]);

		int isBadEvent; // does it fail a quality cut?
		double weight; // what is the weight (just 1.0 for data)
		int unixTime; // what is the unixTime
		int isFirstFiveEvent; // is this event in the first 5 in the run?
		int hasBadSpareChanIssue; // does it have a bad spare channel glitch?
		int hasBadSpareChanIssue2; // and a second version of the glitch detector I whipped up late in the game
		int runNum;

		dataAllTree.SetBranchAddress("bad",&isBadEvent);
		dataAllTree.SetBranchAddress("weight",&weight);
		dataAllTree.SetBranchAddress("unixTime",&unixTime);
		dataAllTree.SetBranchAddress("isFirstFiveEvent",&isFirstFiveEvent);
		dataAllTree.SetBranchAddress("hasBadSpareChanIssue",&hasBadSpareChanIssue);
		dataAllTree.SetBranchAddress("hasBadSpareChanIssue2",&hasBadSpareChanIssue2);
		dataAllTree.SetBranchAddress("runNum",&runNum);

		// if the event was re-filtered, what fraction of the power was filtered in each channel?
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
		bool isThisABadRun = isBadRun(station,runNum,BadRunList); // find out if it was a bad run

		// loop over events
		for(int event=0; event<numDataEvents; event++){
			dataVTree.GetEvent(event);
			dataHTree.GetEvent(event);
			dataAllTree.GetEvent(event);
			if(runNum!=currentRunNum){
				// printf("Incrementing bad run number to %d \n",runNum);
				// std::cout<<"*";
				currentRunNum=runNum;
				isThisABadRun = false;
				isThisABadRun = isBadRun(station,runNum,BadRunList);
				// if((config==3) && (runNum>4500 || runNum<3500)) isThisABadRun=true; //bad runs
				// if((config==4) && (runNum>6500 || runNum<6000)) isThisABadRun=true;
				// if((config==5) && (runNum>2200 || runNum<1900)) isThisABadRun=true;

				if((config==3) && (runNum<4500 && runNum>3500)) isThisABadRun=true; //good runs
				if((config==4) && (runNum<6500 && runNum>6000)) isThisABadRun=true;
				if((config==5) && (runNum<2200)) isThisABadRun=true;


				if(isThisABadRun)
					printf(RED"*"RESET);
					// printf("     Yup, run %d is bad \n",runNum);
				else
					printf(GREEN"*"RESET);

			}
			if( isSoft || isBadEvent || hasBadSpareChanIssue || hasBadSpareChanIssue2 || isFirstFiveEvent || isShort || isCal || isThisABadRun){
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
						h2SNRvsCorr[pol]->Fill(corr_val[pol],snr_val[pol],weight);
						// if(snr_val[pol]>6.5){
						// 	printf("Run %d, event %d has SNR %.2f \n", runNum, event, snr_val[pol]);
						// }

						// scan over the choices of intercept, and record if this event would be cut by this choice of intercept
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
	sprintf(title, "%s/optimize/A%d_config%d_%dEvents_SNRvsCorr_good.png",plotPath,station,config,numTotal);
	// sprintf(title, "%s/optimize/%d.%d.%d_A%d_config%d_%dEvents_SNRvsCorr.png",plotPath,year_now, month_now, day_now,station,config,numTotal);
	cSNRvsCorr->SaveAs(title);
	delete cSNRvsCorr;

	// now, loop over all the bins, and make the "differetial distribution"
	// that is, how many events are cut by a given movement in the snr cut
	// that's why it's a differential
	for(int pol=0; pol<2; pol++){
		for(int bin=0; bin<numSNRbins-1; bin++){
			numEventsPassed_diff[pol][bin] = numEventsPassed[pol][bin] - numEventsPassed[pol][bin+1];
			// printf("Pol %d Bin %d at cut %.2f has %5.f events passing, and next bin has %5f, so diff is %.5f \n", pol, bin, intercept[pol][bin],numEventsPassed[pol][bin],numEventsPassed[pol][bin+1],numEventsPassed_diff[pol][bin]);
		}
	}

	TH1D *hEventsVsSNR[2];
	hEventsVsSNR[0] = new TH1D("DiffDistroV","DiffDistroV",numSNRbins,0,30);
	hEventsVsSNR[1] = new TH1D("DiffDistroH","DiffDistroH",numSNRbins,0,30);

	// now, we have to do the exponential fit
	// which I chose to code as half-way down the distribution between the maximum bin and the last filled bin

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


	// now we actually do the exponential fit
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

	// and we record some of the information about the fit
	// like the name, the number of obsered events, etc.
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
	double intercept_[2]={(log(-0.05*binWidthIntercept[0]*fitParams[0][0]/10)-fitParams[0][1])/fitParams[0][0],
		(log(-0.05*binWidthIntercept[0]*fitParams[1][0]/10)-fitParams[1][1])/fitParams[1][0]};

	// at this point, you can save out the figures you need.

	/*
		and now we need a super mega canvas at the end
		where we can plot everything we know about the search in this configuration
		this will include
			-- the plot of corr_vs_snr for data in both pols
			-- the plot of rotated cut "zoomed out" for data in both pols
			-- the plot of rotated cut "zoomed in" for data in both pols
	*/

	vector<TGraph*> cut_lines;
	for(int pol=0; pol<2; pol++){
		vector <double> x_vals_for_line;
		vector <double> y_vals_for_line;
		for(double x=0; x<0.020; x+=0.00001){
			double y_val = (selected_slopes[pol] * x ) + intercept_[pol];
			x_vals_for_line.push_back(x);
			y_vals_for_line.push_back(y_val);
			// cout << y_val << endl;
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
			hEventsVsSNR[pol]->SetTitle("Differential Distribution, good runs");
			hEventsVsSNR[pol]->GetXaxis()->SetRangeUser(10,15);
			gPad->SetLogy();
		cRcut->cd(pol+3+(pol==0 ? 0 : 5)); // for differential distribution, zoom in
			// hNumObserved[pol]->GetXaxis()->SetRangeUser(7,20);
			// hNumObserved[pol]->GetYaxis()->SetRangeUser(0,10000);
			// hEventsVsSNR[pol]->GetXaxis()->SetRangeUser(0,20);
			// hEventsVsSNR[pol]->Draw("");
			hEventsVsSNR[pol]->GetXaxis()->SetTitle("SNR Cut (y-intercept value)");
			hEventsVsSNR[pol]->GetYaxis()->SetTitle("Number of Events Cut");

			sprintf(fit_title_words[pol],"Fit exp((%.2f+-%.2f)x + (%.2f+-%.2f))",fitParams[pol][0],fitParamErrors[pol][0], fitParams[pol][1],fitParamErrors[pol][1]);
			hEventsVsSNR[pol]->SetTitle(fit_title_words[pol]);
			// fit[pol]->Draw("same");
			fit[pol]->SetLineColor(kRed);
			gPad->SetLogy();

	char save_title[400];
	// sprintf(save_title,"%s/optimize/A%d_config%d_Final_VSlope_%.2f_HSlope_%.2f_VInt_%.2f_Hint_%.2f.png",
	sprintf(save_title,"%s/optimize/%d.%d.%d_A%d_config%d_Final_VSlope_%.2f_HSlope_%.2f_VInt_%.2f_Hint_%.2f_good.png",
						plotPath,
						year_now, month_now, day_now,
						station,
						config,
						selected_slopes[0],
						selected_slopes[1],
						selected_intercepts[0],
						selected_intercepts[1]);
	cRcut->SaveAs(save_title);
		}
	}
