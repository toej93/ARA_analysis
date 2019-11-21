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
// #include "tools_Cuts.h"
#include "tools_Stats.h"
#include "tools_CommandLine.h"
#include "tools_outputObjects.h"

//AraRoot includes
//AraRoot includes
#include "RawAtriStationEvent.h"
#include "UsefulAtriStationEvent.h"
#include "Settings.h"
#include "Detector.h"
#include "Report.h"
#include "RayTraceCorrelator.h"
#include "AraQualCuts.h"
AraAntPol::AraAntPol_t Vpol = AraAntPol::kVertical;
AraAntPol::AraAntPol_t Hpol = AraAntPol::kHorizontal;
#include "tools_PlottingFns.h"
#include "tools_RecoFns.h"
#include "tools_CW.h"

using namespace std;

int PlotThisEvent(int station, int config, int runNum, int event, int problempol, Settings *settings, Detector *detector, RayTraceCorrelator *theCorrelators[2]);


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
	double corrValThres_V[5]={0.007,0.007,0.0085,0.009,0.008};
	double corrValThres_H[5]={0.008,0.008,0.009,0.009,0.009};
	double SNRValThres_V[5]={7,7,7,7,6.5};
	double SNRValThres_H[5]={8,8,8,7.5,7};

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


	//set up the ray tracer
	Settings *settings = new Settings();
	string setupfile = "setup.txt";
	settings->ReadFile(setupfile);
	cout << "Read " << setupfile << " file!" << endl;
	settings->NOFZ=1;
	Detector *detector=0;
	RayTraceCorrelator *theCorrelators[2];
	theCorrelators[0] =  new RayTraceCorrelator(station, 41., settings, 1, 4); //41 m, cal puser
	theCorrelators[1] =  new RayTraceCorrelator(station, 300., settings, 1, 4);//300 m, far reco
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
	h2SNRvsCorr[0]=new TH2D("","V Data",100,0,max,300,0,30);
	h2SNRvsCorr[1]=new TH2D("","H Data",100,0,max,300,0,30);


	// load the data up
	TChain dataVTree("VTree");
	TChain dataHTree("HTree");
	TChain dataAllTree("AllTree");
	char the_data[500];
	// sprintf(the_data,"/fs/scratch/PAS0654/ara/10pct/ValsForCuts/A%d/c%d/cutvals_drop_snrbins_0_0_wfrmsvals_-1.3_-1.4_run_*.root",station,config);
	if (config==1) sprintf(the_data,"/fs/project/PAS0654/ARA_DATA/A23/10pct_redo/ValsForCuts_v2/A%d/c%d/cutvals_drop_FiltSurface_CWThresh2.0_snrbins_0_1_wfrmsvals_-1.2_-1.3_run_*.root",station,config);
	if (config==2) sprintf(the_data,"/fs/project/PAS0654/ARA_DATA/A23/10pct_redo/ValsForCuts_v2/A%d/c%d/cutvals_drop_FiltSurface_CWThresh2.0_snrbins_0_1_wfrmsvals_-1.3_-1.4_run_*.root",station,config);
	if (config==3 || config==4) sprintf(the_data,"/fs/project/PAS0654/ARA_DATA/A23/10pct_redo/ValsForCuts_v2/A%d/c%d/cutvals_drop_FiltSurface_CWThresh2.0_snrbins_0_1_wfrmsvals_-1.0_-1.1_run_*.root",station,config);
	if (config==5) sprintf(the_data,"/fs/project/PAS0654/ARA_DATA/A23/10pct_redo/ValsForCuts_v2/A%d/c%d/cutvals_drop_FiltSurface_CWThresh2.0_snrbins_0_1_wfrmsvals_-0.7_-0.8_run_*.root",station,config);
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

		dataAllTree.SetBranchAddress("surf_V_new2",&isSurf[0]);
		dataAllTree.SetBranchAddress("surf_H_new2",&isSurf[1]);

		dataAllTree.SetBranchAddress("surf_top_V",&isSurfEvent_top[0]);
		dataAllTree.SetBranchAddress("surf_top_H",&isSurfEvent_top[1]);

		int isBadEvent; // does it fail a quality cut?
		double weight; // what is the weight (just 1.0 for data)
		int unixTime; // what is the unixTime
		int isFirstFiveEvent; // is this event in the first 5 in the run?
		int hasBadSpareChanIssue; // does it have a bad spare channel glitch?
		int hasBadSpareChanIssue2; // and a second version of the glitch detector I whipped up late in the game
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
		bool isThisABadRun; // find out if it was a bad run
		bool isThisASoftDomRun;
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
				isThisASoftDomRun= false;
				isThisABadRun = isBadRun(station,runNum,BadRunList);
				isThisASoftDomRun = isSoftwareDominatedRun("/users/PCON0003/cond0068/ARA/AraRoot/analysis/a23_analysis_tools", station, runNum);
				if(isThisASoftDomRun) printf(RED"run:%i"RESET,runNum);
				// if(runNum==1924 || runNum==1925 || runNum==1926 || runNum==2531 || runNum==2781) isThisABadRun=true;

				// if((config==3) && (runNum>4500 || runNum<3500)) isThisABadRun=true; //bad runs
				// if((config==4) && (runNum>6500 || runNum<6000)) isThisABadRun=true;
				// if((config==5) && (runNum>2200 || runNum<1900)) isThisABadRun=true;
				//
				// if((config==3) && (runNum<4500 && runNum>3500)) isThisABadRun=true; //good runs
				// if((config==4) && (runNum<6500 && runNum>6000)) isThisABadRun=true;
				// if((config==5) && (runNum<2200)) isThisABadRun=true;


				if(isThisABadRun)
					printf(RED"*"RESET);
					// printf("     Yup, run %d is bad \n",runNum);
				else
					printf(GREEN"*"RESET);

			}
			if(!isRFEvent || isSoft || isBadEvent || hasBadSpareChanIssue || hasBadSpareChanIssue2 || isFirstFiveEvent || isShort || isCal || isThisASoftDomRun || isThisABadRun || isSpikey || isCliff || OutofBandIssue || bad_v2 || isPayloadBlast2 || box300){
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

						if((pol==0 && (corr_val[0]>corrValThres_V[config-1] || snr_val[0]>SNRValThres_V[config-1])) || (pol==1 && (corr_val[1]>corrValThres_H[config-1] || snr_val[1]>SNRValThres_H[config-1]))){
							printf(RED"eventNumber %d \n"RESET, eventNumber);
							// cout << eventNumber << endl; //PlotThisEvent(station, config, runNum, event, pol, settings, detector, theCorrelators);
 							PlotThisEvent(station, config, runNum, eventNumber, pol, settings, detector, theCorrelators);
						}
						// PlotThisEvent(station, config, runNum, event, pol, settings, detector, theCorrelators);
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
	sprintf(title, "%s/optimize/A%d_config%d_%dEvents_SNRvsCorr.png",plotPath,station,config,numTotal);
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
			hEventsVsSNR[pol]->SetTitle("Differential Distribution");
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
	sprintf(save_title,"%s/optimize/%d.%d.%d_A%d_config%d_Final_VSlope_%.2f_HSlope_%.2f_VInt_%.2f_Hint_%.2f.png",
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



	int PlotThisEvent(int station, int config, int runNum, int event, int problempol, Settings *settings, Detector *detector, RayTraceCorrelator *theCorrelators[2]){
		time_t time_now = time(0); //get the time now
		tm *time = localtime(&time_now);
		int year_now = time -> tm_year + 1900;
		int month_now = time -> tm_mon + 1;
		int day_now = time -> tm_mday;

		char *DataDirPath(getenv("DATA_DIR_PROJECT"));
		if (DataDirPath == NULL) std::cout << "Warning! $DATA_DIR is not set!" << endl;
		char *PedDirPath(getenv("PED_DIR"));
		if (PedDirPath == NULL) std::cout << "Warning! $DATA_DIR is not set!" << endl;
		char *plotPath(getenv("PLOT_PATH"));
		if (plotPath == NULL) std::cout << "Warning! $PLOT_PATH is not set!" << endl;
		char *AuxDirPath(getenv("AUX_DIR"));
		if (AuxDirPath == NULL){
			std::cout << "Warning! $AUX_DIR is not set! You need this for CWID and RunSummary files" << endl;
			return -1;
		}

		char run_file_name[400];
		sprintf(run_file_name,"%s/RawData/A%d/all_runs/event%d.root",DataDirPath,station,runNum);
		printf("Data file is: %s/RawData/A%d/all_runs/event%d.root\n",DataDirPath,station,runNum);
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

		// RawAtriStationEvent *rawPtr;
		RawAtriStationEvent *rawPtr =0;
		eventTree->SetBranchAddress("event",&rawPtr);

		int numEntriesLocal = eventTree->GetEntries();
		int whichIndexIsIt=-10;
		for(int i=0; i<numEntriesLocal; i++){
			eventTree->GetEvent(i);
			if(rawPtr->eventNumber==event){
				whichIndexIsIt=i;
				break;
			}
		}
		eventTree->GetEvent(whichIndexIsIt);

		int stationID = station;
		printf("Station ID is %i \n",stationID);
		printf("Run is %i \n",runNum);

		// char ped_file_name[400];
		// sprintf(ped_file_name,"%s/run_specific_peds/A%d/all_peds/event%d_specificPeds.dat",PedDirPath,station,runNum);
		// AraEventCalibrator *calibrator = AraEventCalibrator::Instance();
		// calibrator->setAtriPedFile(ped_file_name,stationID); //because someone had a brain (!!), this will error handle itself if the pedestal doesn't exist

		AraQualCuts *qualCut = AraQualCuts::Instance();
		cout<<"About to make the real event pointer "<<endl;
		UsefulAtriStationEvent *realAtriEvPtr = new UsefulAtriStationEvent(rawPtr,AraCalType::kLatestCalib);
		cout<<"But, I never get past that"<<endl;
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

		char cw_file_name[400];
		sprintf(cw_file_name,"%s/CWID/A%d/all_runs/CWID_station_%d_run_%d.root",AuxDirPath,station,station,runNum);
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
		vector<vector<double> > *badFreqs_baseline_TB=0;

		NewCWTree->SetBranchAddress("badFreqs_fwd",&badFreqs_fwd);
		NewCWTree->SetBranchAddress("badSigmas_fwd",&badSigmas_fwd);
		NewCWTree->SetBranchAddress("badFreqs_back",&badFreqs_back);
		NewCWTree->SetBranchAddress("badSigmas_back",&badSigmas_back);
		NewCWTree->SetBranchAddress("badFreqs_baseline_TB",&badFreqs_baseline_TB);

		//deal w/ CW cut
		//inputTree_CW->GetEntry(event);
		NewCWTree->GetEntry(event);

		bool isCutonCW_fwd[2]; isCutonCW_fwd[0]=false; isCutonCW_fwd[1]=false;
		bool isCutonCW_back[2]; isCutonCW_back[0]=false; isCutonCW_back[1]=false;
		bool isCutonCW_baseline[2]; isCutonCW_baseline[0]=false; isCutonCW_baseline[1]=false;

		for(int pol=0; pol<badFreqs_baseline_TB->size(); pol++){
			vector<double> badFreqListLocal_baseline = badFreqs_baseline_TB->at(pol);
			if(badFreqListLocal_baseline.size()>0) isCutonCW_baseline[pol]=true;
		}
		for(int pol=0; pol<2; pol++){
			char run_summary_filename[400];
			sprintf(run_summary_filename,"%s/RunSummary/A%d/all_runs/run_summary_station_%d_run_%d.root",AuxDirPath,station,station,runNum);
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
				vector<double> badFreqListLocal_baseline = badFreqs_baseline_TB->at(pol);
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
				cout << "trying to print" << endl;
				sprintf(save_temp_title,"%s/trouble_events/c%d/Run%d_Ev%d_ProblemPol%d_WaveformsNotch.png",plotPath,config,runNum,event,problempol);
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

				sprintf(save_temp_title,"%s/trouble_events/c%i/Run%d_Ev%d_ProblemPol%d_SpectraNotch.png",plotPath,config,runNum,event,problempol);
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
				sprintf(save_temp_title,"%s/trouble_events/c%i/Run%d_Ev%d_ProblemPol%d_FilteredMaps.png",plotPath,config,runNum,event,problempol);
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

		bool do_reco=true;
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
			sprintf(save_temp_title,"%s/trouble_events/c%i/Run%d_Ev%d_ProblemPol%d_Maps.png",plotPath,config,runNum,event,problempol);
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
			sprintf(save_temp_title,"%s/trouble_events/c%i/Run%d_Ev%d_ProblemPol%d_MapsTop.png",plotPath,config,runNum,event,problempol);
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
			sprintf(save_temp_title,"%s/trouble_events/c%i/Run%d_Ev%d_ProblemPol%d_MapsBottom.png",plotPath,config,runNum,event,problempol);
			cMaps_bottom->SaveAs(save_temp_title);
			delete cMaps_bottom;
			delete map_300m_bottom_V; delete map_300m_bottom_H;
		}

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


		char save_temp_title[300];
		sprintf(save_temp_title,"%s/trouble_events/c%i/Run%d_Ev%d_ProblemPol%d_Waveforms.png",plotPath,config,runNum,event,problempol);
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

		sprintf(save_temp_title,"%s/trouble_events/c%i/Run%d_Ev%d_ProblemPol%d_Spectra.png",plotPath,config,runNum,event,problempol);
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
	}
