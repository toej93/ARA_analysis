////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////	v2_final_plots.cxx
////	A23 diffuse, make plots of the final cut parameter space
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
#include "TFitResult.h"

// analysis custom
#include "tools_Cuts.h"
#include "tools_Stats.h"
#include "tools_CommandLine.h"
#include "tools_outputObjects.h"

using namespace std;

int Optimize(int station, int config, int pol_select, double slope, int numBins_in, double intercepts_in[200], double (&background_out)[200], double (&signal_out)[200], double (&fitPar_out)[2], double (&fitParErr_out)[2], double &pval_out, double &cov_out, double &cor_out);

int main(int argc, char **argv)
{

	time_t time_now = time(0); //get the time now
	tm *time = localtime(&time_now);
	int year_now = time -> tm_year + 1900;
	int month_now = time -> tm_mon + 1;
	int day_now = time -> tm_mday;

	stringstream ss;
	gStyle->SetOptStat(11);

	char *plotPath(getenv("PLOT_PATH"));
	if (plotPath == NULL) std::cout << "Warning! $PLOT_PATH is not set!" << endl;

	if(argc<5){
		cout<< "Usage\n" << argv[0] << " <1-station> <2-pol> <3-slope> <4-output_location> "<<endl;;
		return -1;
	}

	int station = atoi(argv[1]);
	int pol_select=atoi(argv[2]);
	double slope=double(atof(argv[3]));

	if(station!=2 && station!=3){
		printf("No good! You asked for station %d, but this code only works for stations 2 and 3 \n",station);
		return -1;
	}

	char outfilename[500];
	sprintf(outfilename,"%s/A%d_optimize_pol%d_slope%d.root",argv[4],station,pol_select,int(slope));
	TFile *OutputFile = TFile::Open(outfilename,"RECREATE");
	TTree *OutputTree = new TTree("OutputTree","OutputTree");

	double intercept[200];
	double backgrounds[200];
	double signal[200];
	double pVal;
	double fitPar[2];
	double fitParErr[2];
	int fitConverge;
	double covariance;
	double correlation;

	OutputTree->Branch("intercept",&intercept,"intercept[200]/D");
	OutputTree->Branch("backgrounds",&backgrounds,"backgrounds[200]/D");
	OutputTree->Branch("signal",&signal,"signal[200]/D");
	OutputTree->Branch("fitPar0",&fitPar[0]);
	OutputTree->Branch("fitPar1",&fitPar[1]);
	OutputTree->Branch("fitParErr0",&fitParErr[0]);
	OutputTree->Branch("fitParErr1",&fitParErr[1]);
	OutputTree->Branch("covariance",&covariance);
	OutputTree->Branch("correlation",&correlation);
	OutputTree->Branch("fitConverge",&fitConverge);
	OutputTree->Branch("pVal",&pVal);

	// fill the intercepts array

	// back when I was considering doing it with histograms
	// stringstream ss1;
	// for(int i=0; i<5; i++){
	// 	ss1.str("");
	// 	ss1<<"data_config"<<i+1;
	// 	hDataEventsVsSNR->Branch(ss1.str().c_str(),&hDataEventsVsSNR[i]);
	// 	ss1.str("");
	// 	ss1<<"sim_config"<<i+1;
	// 	hSimEventsVsSNR->Branch(ss1.str().c_str(),&hDataEventsVsSNR[i]);
	// }

	// min intercept
	double min_intercept = 10.;
	double dIntercept = 0.1;

	// loop over all five configurations for this
	for(int this_config=1; this_config<2; this_config++){
	// for(int this_config=3; this_config<4; this_config++){
		// fill in intercepts array
		for(int bin=0; bin<200; bin++){
			intercept[bin] = (double(bin)*dIntercept)+min_intercept;
			// printf("Bin %d has intercept %.2f \n",bin,intercept[bin]);
			backgrounds[bin]=-10.;
			signal[bin]=-10.;
		}
		pVal=-10.;
		fitPar[0]=-100; fitPar[1]=-100.;
		fitParErr[0]=-100; fitParErr[1]=-100.;
		fitConverge=10.;
		covariance=-10.;
		correlation=-10.;

		fitConverge = Optimize(station,this_config, pol_select, slope, 200, intercept, backgrounds, signal, fitPar, fitParErr, pVal, covariance, correlation);
		OutputTree->Fill();
	}
	OutputFile->Write();
	OutputFile->Close();
}

/*
	To call the mega optimizer, you need to have "Vals_for_Cuts_Files" ready for both data and simulation
	It will try to loop through and do the exponetial fitting of the differential distribution
	Then, it will compute S over S_up, and select the optimal S/S_up
*/

int Optimize(int station, int config, int pol_select, double slope, int numBins_in, double intercepts_in[200], double (&background_out)[200], double (&signal_out)[200], double (&fitPar_out)[2], double (&fitParErr_out)[2], double &pval_out, double &cov_out, double &cor_out){

	if(config<1 || config>5){
		printf(RED"You asked for config %d, which is silly. Returning a fail.\n"RESET);
		return -1;
	}
	if(pol_select!=0 && pol_select!=1){
		printf(RED"You asked for pol %d, which is silly. Returning a fail.\n"RESET,pol_select);
		return -1;
	}
	if(slope>0){
		printf(RED"You have asked for a slope of %.2f, which is positive and silly. Returning a fail.\n"RESET,slope);
		return -1;
	}

	printf("Working on config %d \n", config);

	char *plotPath(getenv("PLOT_PATH"));
	if (plotPath == NULL) std::cout << "Warning! $PLOT_PATH is not set!" << endl;
	vector<int> BadRunList=BuildBadRunList(station);

	double select_slope=slope;

	// let's see if we can do it with arrays....
	int numSNRbins=300;
	double numEventsPassed[numSNRbins];
	double numEventsPassed_diff[numSNRbins];

	double dRcut=0.1; // SNR bin incremets (bins in 0.1 SNR units)
	double Rcutmin=0.;
	double intercept[numSNRbins];
	for(int bin=0; bin<numSNRbins; bin++){
		numEventsPassed[bin]=0.;
		numEventsPassed_diff[bin]=0.;
		intercept[bin] = Rcutmin + double(bin)*dRcut;
	}
	// for(int bin=0; bin<numSNRbins; bin++){
	// 	printf("SNR Bin %d has intercept value %.2f \n", bin,intercept[bin]);
	// }

	// need to be able to make the final 2D distribution

	/////////////////////////////////////////////////
	/////////////////////////////////////////////////
	/// Load all of the data in
	/////////////////////////////////////////////////
	/////////////////////////////////////////////////

	TChain dataVTree("VTree");
	TChain dataHTree("HTree");
	TChain dataAllTree("AllTree");
	TChain dataFilterTree("OutputTree");
	char the_data[500];
	// sprintf(the_data,"/fs/scratch/PAS0654/ara/10pct/ValsForCuts/A%d/c%d/cutvals_drop_snrbins_0_0_wfrmsvals_-1.3_-1.4_run_*.root",station,config);
	//sprintf(the_data,"/fs/project/PAS0654/ARA_DATA/A23/10pct/ValsForCuts/A%d/c%d/cutvals_drop_FiltSurface_snrbins_0_0_wfrmsvals_-1.3_-1.4_run_*.root",station,config);
	sprintf(the_data,"/fs/project/PAS0654/ARA_DATA/A23/10pct_redo/ValsForCuts/A%d/c%d/cutvals_drop_FiltSurface_snrbins_0_0_wfrmsvals_-1.3_-1.4_run_*.root",station,config); //latest update with correct pedestal stuff
	dataVTree.Add(the_data);
	dataHTree.Add(the_data);
	dataAllTree.Add(the_data);
	int numDataEvents = dataVTree.GetEntries();
	printf(BLUE"Num of data entries is %d \n"RESET, numDataEvents);

	double max=0.05;
	TH2D *h2SNRvsCorr_data[2]; // SNR on Y axis, Corr on X axis, like in the TB
	h2SNRvsCorr_data[0]=new TH2D("","V Data",100,0,max,300,0,30);
	h2SNRvsCorr_data[1]=new TH2D("","H Data",100,0,max,300,0,30);

	// do this inside brackets for scoping power and re-use of identical variable names when it comes time for simulation to happen
	{

		// just swap out for the "new" variables

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

		dataAllTree.SetBranchAddress("bad",&isBadEvent);
		dataAllTree.SetBranchAddress("weight",&weight);
		dataAllTree.SetBranchAddress("unixTime",&unixTime);
		dataAllTree.SetBranchAddress("isFirstFiveEvent",&isFirstFiveEvent);
		dataAllTree.SetBranchAddress("hasBadSpareChanIssue",&hasBadSpareChanIssue);
		dataAllTree.SetBranchAddress("hasBadSpareChanIssue2",&hasBadSpareChanIssue2);
		dataAllTree.SetBranchAddress("runNum",&runNum);

		int eventNumber;
		dataFilterTree.SetBranchAddress("eventNumber",&eventNumber);

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

		dataAllTree.GetEvent(0);
		int currentRunNum = runNum;
		bool isThisABadRun = isBadRun(station,runNum,BadRunList);

		for(int event=0; event<numDataEvents; event++){
			dataVTree.GetEvent(event);
			dataHTree.GetEvent(event);
			dataAllTree.GetEvent(event);
			dataFilterTree.GetEvent(event);
			if(runNum!=currentRunNum){
				// printf("Incrementing bad run number to %d \n",runNum);
				// std::cout<<"*";
				currentRunNum=runNum;
				isThisABadRun = isBadRun(station,runNum, BadRunList);
				if(isThisABadRun){
					printf(RED"*"RESET);
					// printf("     Yup, run %d is bad \n",runNum);
				}
				else{
					printf(GREEN"*"RESET);
				}

			}
			if( isSoft || isBadEvent || hasBadSpareChanIssue || hasBadSpareChanIssue2 ||  isFirstFiveEvent || isShort || isCal || isThisABadRun){
				continue;
			}
			if(isBadLivetime(station,unixTime)){
				continue;
			}
			for(int pol=0; pol<2; pol++){
				if(pol!=pol_select){
					continue;
				}
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
						h2SNRvsCorr_data[pol]->Fill(corr_val[pol],snr_val[pol],weight);
						// if(snr_val[pol]>6.5){
						// 	printf("Run %d, event %d has SNR %.2f \n", runNum, event, snr_val[pol]);
						// }
						for(int bin=0; bin<numSNRbins; bin++){ //check all potential intercepts
							double this_y_val = (slope * corr_val[pol] ) + intercept[bin]; // compute the SNR to pass at this intercept
							// printf("For bin %d, with intercept %.2f, SNR to pass is %.2f \n", bin, intercept[bin], this_y_val);
							if(snr_val[pol]>=this_y_val){ // does this event pass?
								// printf("     This event has SNR %.2f, so it passes!\n",snr_val[pol]);
								// printf("          Old number of events in this bin %5f \n", numEventsPassed[bin]);
								numEventsPassed[bin]+=1.;
								// printf(".         New number of events in this bin %5f \n", numEventsPassed[bin]);
							} // does event pass Rcut
						} // loop over SNR cuts
					}// not failing CW power cut?
				}// passes rest of analysis (not WFRMS, box, surface)
			}// loop over polarizations
		}// loop over events
	}
	std::cout<<endl;

	/////////////////////////////////////////////////
	/////////////////////////////////////////////////
	/// Now for differential distribution etc.
	/////////////////////////////////////////////////
	/////////////////////////////////////////////////

	// now to get the differential distribution up and running
	for(int bin=0; bin<numSNRbins-1; bin++){
		numEventsPassed_diff[bin] = numEventsPassed[bin] - numEventsPassed[bin+1];
		// printf("Bin %d at cut %.2f has %5.f events passing, and next bin has %5f, so diff is %.5f \n", bin, intercept[bin],numEventsPassed[bin],numEventsPassed[bin+1],numEventsPassed_diff[bin]);
	}

	TH1D *hEventsVsSNR = new TH1D("","",numSNRbins,0,30);
	for(int bin=0; bin<numSNRbins; bin++){
		// printf("Bin %d I'm in SNR bin %.2f in the histo and I'm going to fill with %.2f \n", bin, hEventsVsSNR->GetBinCenter(bin+1),numEventsPassed_diff[bin]);
		hEventsVsSNR->SetBinContent(bin+1,numEventsPassed_diff[bin]);
	}
	// int max_bin = hEventsVsSNR->GetMaximumBin();
	// int fit_start_bin = max_bin+14;
	// double start_of_fit = hEventsVsSNR->GetBinCenter(fit_start_bin);
	// int last_filled_bin = hEventsVsSNR->FindLastBinAbove(0.,1);
	// last_filled_bin+=5; // go up two more bins just to make sure the fit is over
	// double end_of_fit = hEventsVsSNR->GetBinCenter(last_filled_bin);

	// try with fit starting half-way between maximum bin and last filled bin
	// int max_bin = hEventsVsSNR->GetMaximumBin();
	// int last_filled_bin = hEventsVsSNR->FindLastBinAbove(0.,1);
	// int fit_start_bin=int((last_filled_bin - max_bin)/2) + max_bin; //start half-way between the peak bin and the last filled bin
	// double start_of_fit = hEventsVsSNR->GetBinCenter(fit_start_bin);
	// double end_of_fit = hEventsVsSNR->GetBinCenter(last_filled_bin+2.); //go two bins more just to make sure fit is over

	// and a third try, more robust to outliers
	// int max_bin=hEventsVsSNR->GetMaximumBin();
	// int last_filled_bin_above_2 = hEventsVsSNR->FindLastBinAbove(2.,1);
	// int fit_start_bin=int((last_filled_bin_above_2 - max_bin)/2) + max_bin + 5; //start half-way between the peak bin and last bin with >2 events, plus a little experimental extra
	// double start_of_fit = hEventsVsSNR->GetBinCenter(fit_start_bin);
	// int last_filled_bin = hEventsVsSNR->FindLastBinAbove(0.,1);
	// double end_of_fit = hEventsVsSNR->GetBinCenter(last_filled_bin+2.); //go two bins more just to make sure fit is over

	// anddddd, try four
	int max_bin=hEventsVsSNR->GetMaximumBin();
	int last_filled_bin_above_2 = hEventsVsSNR->FindLastBinAbove(2.,1) + 2;
	int fit_start_bin=int((last_filled_bin_above_2 - max_bin)/2) + max_bin; //start half-way between the peak bin and last bin with >2 events
	double start_of_fit = hEventsVsSNR->GetBinCenter(fit_start_bin);
	int last_filled_bin = hEventsVsSNR->FindLastBinAbove(0.,1);
	double end_of_fit = hEventsVsSNR->GetBinCenter(last_filled_bin+2.); //go two bins more just to make sure fit is over

	printf("Last filled bin is bin %d and value %.2f \n", last_filled_bin, hEventsVsSNR->GetBinCenter(last_filled_bin));
	printf("Max bin is bin %d and value %.2f \n", max_bin, hEventsVsSNR->GetBinCenter(max_bin));
	printf("Proposed start of fit is bin %d and value %.2f \n", fit_start_bin, hEventsVsSNR->GetBinCenter(fit_start_bin));

	// now we exponential fit
	char equation[150];
	sprintf(equation,"exp([0]*x+[1])");
	// sprintf(equation,"gaus");
	TF1 *fit = new TF1("ExpFit",equation,start_of_fit,end_of_fit);
	int status = hEventsVsSNR->Fit("ExpFit","LL,R");
	if(status!=0){
		printf("Something went wrong with the fit! Quitting...\n");
		return -1;
	}
	TFitResultPtr r = hEventsVsSNR->Fit("ExpFit","LL,R,S");  // TFitResultPtr contains the TFitResult
	r->Print("V");
	TMatrixDSym cov_matrix = r->GetCovarianceMatrix();
	TMatrixDSym cor_matrix = r->GetCorrelationMatrix();

	TCanvas *dump_canvas = new TCanvas("","",850,850);
	hEventsVsSNR->Draw("");
	gPad->SetLogy();
	dump_canvas->SaveAs("./plots/tester.png");

	double fitParams[2];
	fitParams[0] = fit->GetParameter(0);
	fitParams[1] = fit->GetParameter(1);
	double fitErrors[2];
	fitErrors[0] = fit->GetParError(0);
	fitErrors[1] = fit->GetParError(1);
	printf("Fit Parameters are %.2f and %.2f with error %.3f and %.3f \n", fitParams[0], fitParams[1], fitErrors[0], fitErrors[1]);

	// save the covariance and correlation
	cov_out=cov_matrix[0][1];
	cor_out=cor_matrix[0][1];
	printf("Covariance and Correlation are %.5f and %.5f \n", cov_out, cor_out);

	// save this out, we need this!
	fitPar_out[0] = fit->GetParameter(0);
	fitPar_out[1] = fit->GetParameter(1);
	fitParErr_out[0] = fit->GetParError(0);
	fitParErr_out[1] = fit->GetParError(1);

	double binWidthIntercept = hEventsVsSNR->GetBinWidth(1);
	double leftBoundary = start_of_fit - binWidthIntercept/2.;
	double rightBoundary = end_of_fit + binWidthIntercept/2.;
	int numBinsThisFit = (rightBoundary - leftBoundary)/binWidthIntercept + 1; // how many bins do we need in our histogram to actually do the fitting
	printf("Number of bins in this fit is %d \n", numBinsThisFit);
	char this_fit_title[400];
	sprintf(this_fit_title,"Fit_slope_%.2f ", slope);
	TH1D *hNumObserved = new TH1D(this_fit_title,"",numBinsThisFit,leftBoundary,rightBoundary);
	for(int bin=0; bin<numBinsThisFit; bin++){
		double originalContent = hEventsVsSNR->GetBinContent(bin+fit_start_bin);
		hNumObserved->SetBinContent(bin+1,originalContent);
	}

	/*
		Now we must prepare our *expectation* for the number of events
		in a bin given that we now have our exponential model
	*/

	double numExpected[numBinsThisFit];
	for(int bin=0; bin<numBinsThisFit; bin++){
		double modelPrediction = exp(fitParams[0]*(hNumObserved->GetBinCenter(bin+1)) + fitParams[1]);
		numExpected[bin] = modelPrediction;
	}

	/*
		Now we compute the log-likelihood by hand
	*/

	double logL=0.;
	double numObservedTotal=0.;
	double numExpectedTotal_sum=0;
	for(int bin=0; bin<numBinsThisFit; bin++){
		double thisObserved = hNumObserved->GetBinContent(bin+1);
		double thisExpected = numExpected[bin];
		// printf("At bin %d Observed %.2f and Expected %.2f \n", bin, thisObserved, thisExpected );
		numObservedTotal+=thisObserved;
		numExpectedTotal_sum+=thisExpected;
		logL += ReturnLogL_highN( thisObserved,thisExpected );
	}
	printf("The logL is %.3f \n", logL);

	// double numExpectedTotal_Integral = (1./(fitParams[0])) * ( exp(fitParams[0]*end_of_fit + fitParams[1]) - exp(fitParams[0]*start_of_fit + fitParams[1]));
	// double numExpectedTotal_Integral = (1./(fitParams[0]*binWidthIntercept)) * ( exp(fitParams[0]*end_of_fit + fitParams[1]) - exp(fitParams[0]*start_of_fit + fitParams[1]));
	double numExpectedTotal_Integral = (1./(fitParams[0]*binWidthIntercept)) * ( exp(fitParams[0]*rightBoundary + fitParams[1]) - exp(fitParams[0]*leftBoundary + fitParams[1]));
	printf("Best fit sum bins: %.2f. Best fit do integral: %.2f. Num observed: %.2f. \n",numExpectedTotal_sum, numExpectedTotal_Integral, numObservedTotal);

	TRandom3 *test_random = new TRandom3();

	/*
		Now for toy simulations
	*/
	sprintf(this_fit_title,"fCopyFit", slope);
	TF1 *fitCopy = new TF1(this_fit_title, "exp([0]*x+[1])", start_of_fit, end_of_fit);
	fitCopy->SetParameters(fitParams[0], fitParams[1]);
	double less_BestFit_logL = 0.; // values lower than BestFit_logL
	double Total_Toy_logL = 0.; // total logL values from Toy

	int num_Toy = 10000;
	int Toy_logL_bin = 150;
	double min_Toy_logL = 0.;
	double max_Toy_logL = 150.;
	TH1D *hToy_logL = new TH1D("hToy_logL", "", Toy_logL_bin, min_Toy_logL, max_Toy_logL );
	char test_title[400];
	for(int num=0; num<num_Toy; num++){
		// fill this toy pseudo experiment with a poisson fluctuations of the events observed
		sprintf(test_title, "hToy %d ", num);
		TH1D *hToy = new TH1D(test_title,"",numBinsThisFit,leftBoundary,rightBoundary);
		int Evts_Poisson = test_random->Poisson(numExpectedTotal_Integral);
		hToy->FillRandom("fCopyFit",Evts_Poisson);
		double logL_log_Toy=0.; // get logL for this toy
		for(int bin=0; bin<numBinsThisFit; bin++){
			logL_log_Toy+=ReturnLogL_highN(hToy->GetBinContent(bin+1), numExpected[bin]);
		}
		// TCanvas *cToyHist = new TCanvas ("cToyHist","", 800, 600);
		// cToyHist->cd();
		// 	cToyHist->cd()->SetLogy();
		// 	sprintf( test_title, "Toy hist, evts : %d, -2Ln(L): %.2f", Evts_Poisson, logL_log_Toy );
		// 	hToy->SetTitle(test_title);
		// 	hToy->Draw();
		// 	fit->Draw("same");
		// char this_save_title[400];
		// sprintf(this_save_title,"./plots/toy%d.png",num);
		// cToyHist->SaveAs(this_save_title);
		// delete cToyHist;
		delete hToy;
		hToy_logL->Fill(logL_log_Toy);
		if ( logL_log_Toy <= logL ){
			less_BestFit_logL += logL_log_Toy;
		}
		Total_Toy_logL += logL_log_Toy;
	}

	// vertical line for log likelihood
	double P_value = less_BestFit_logL / Total_Toy_logL;
	pval_out = P_value;
	double DataLogL_x[2] = { logL, logL };
	double DataLogL_y[2] = { 0, 5 };
	TGraph *gDataLogL = new TGraph (2, DataLogL_x, DataLogL_y);

	printf(BLUE"About to do background estimation\n"RESET);
	/*
		Now, we must find our background estimate
		Which is where we integrate the exponential above our cut value
		And then use that to get s_up
	*/

	for(int bin=0; bin<numBins_in; bin++){
		double cut = intercepts_in[bin];
		double this_back_estimate = (1./(fitParams[0]*binWidthIntercept)) * (-exp(fitParams[0]*cut + fitParams[1]));

		// include uncertainties--to make back estimate bigger always make the slope shallower
		// which, because slope is negative, more shallow means *add* the slope error
		// double this_back_estimate = (1./((fitParams[0]+fitErrors[0])*binWidthIntercept)) * (-exp((fitParams[0]+fitErrors[0])*cut + fitParams[1]));
		this_back_estimate*=10.;
		background_out[bin] = this_back_estimate;
	}

	/////////////////////////////////////////////////
	/////////////////////////////////////////////////
	/// Now, S
	/////////////////////////////////////////////////
	/////////////////////////////////////////////////

	/*
		Now loop over simulation to get the S
	*/

	TChain simVTree("VTree");
	TChain simHTree("HTree");
	TChain simAllTree("AllTree");
	char the_sims[500];
	// sprintf(the_sims,"/fs/scratch/PAS0654/ara/sim/ValsForCuts/A%d/c%d/E%d/cutvals_drop_snrbins_0_0_wfrmsvals_-1.3_-1.4_run_*.root",station,config,224);
	//sprintf(the_sims,"/fs/project/PAS0654/ARA_DATA/A23/sim/ValsForCuts/A%d/c%d/E%d/cutvals_drop_FiltSurface_snrbins_0_0_wfrmsvals_-1.3_-1.4_run_*.root",station,config,224);
	sprintf(the_sims,"/fs/project/PAS0654/ARA_DATA/A23/sim/ValsForCuts_UsedInA2FinalOpt/A%d/c%d/E%d/cutvals_drop_FiltSurface_snrbins_0_0_wfrmsvals_-1.3_-1.4_run_*.root",station,config,224);
	simVTree.Add(the_sims);
	simHTree.Add(the_sims);
	simAllTree.Add(the_sims);
	int numSimEvents = simVTree.GetEntries();
	printf(BLUE"Number of sim entries is %d\n"RESET, numSimEvents);

	TH2D *h2SNRvsCorr_sim[2]; // SNR on Y axis, Corr on X axis, like in the TB
	h2SNRvsCorr_sim[0]=new TH2D("","V Sim",100,0,max,30,0,30);
	h2SNRvsCorr_sim[1]=new TH2D("","H Sim",100,0,max,30,0,30);

	// and now get values out
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

		simAllTree.SetBranchAddress("cal",&isCal);
		simAllTree.SetBranchAddress("soft",&isSoft);
		simAllTree.SetBranchAddress("short",&isShort);
		simAllTree.SetBranchAddress("CW",&isCW);
		simAllTree.SetBranchAddress("box",&isNewBox);
		simAllTree.SetBranchAddress("surf_V_new",&isSurf[0]);
		simAllTree.SetBranchAddress("surf_H_new",&isSurf[1]);
		simAllTree.SetBranchAddress("bad",&isBadEvent);
		simAllTree.SetBranchAddress("weight",&weight);
		simAllTree.SetBranchAddress("surf_top_V",&isSurfEvent_top[0]);
		simAllTree.SetBranchAddress("surf_top_H",&isSurfEvent_top[1]);
		simAllTree.SetBranchAddress("unixTime",&unixTime);
		simAllTree.SetBranchAddress("isFirstFiveEvent",&isFirstFiveEvent);
		simAllTree.SetBranchAddress("hasBadSpareChanIssue",&hasBadSpareChanIssue);
		simAllTree.SetBranchAddress("hasBadSpareChanIssue2",&hasBadSpareChanIssue2);

		stringstream ss;
		for(int i=0; i<8; i++){
			ss.str("");
			ss<<"PowerNotch_Chan"<<i;
			simVTree.SetBranchAddress(ss.str().c_str(),&frac_of_power_notched_V[i]);
		}
		for(int i=8; i<16; i++){
			ss.str("");
			ss<<"PowerNotch_Chan"<<i;
			simHTree.SetBranchAddress(ss.str().c_str(),&frac_of_power_notched_H[i-8]);
		}

		for(int event=0; event<numSimEvents; event++){

			simVTree.GetEvent(event);
			simHTree.GetEvent(event);
			simAllTree.GetEvent(event);
			for(int pol=0; pol<2; pol++){

				h2SNRvsCorr_sim[pol]->Fill(corr_val[pol], snr_val[pol],weight);
				if(pol!=pol_select){
					continue;
				}

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

				double this_SNR=snr_val[pol];
				double this_corr=corr_val[pol];

				if(!WFRMS[pol] && !failsCWPowerCut){
					if(!isNewBox){
						if(!isSurf[0] && !isSurf[1] && !isSurfEvent_top[pol]){
							// loop over every bin (intercept value), and figure out if this event would have passed or not

							for(int bin=0; bin<numBins_in; bin++){
								double failsRcut=false;
								double thisIntercept = intercepts_in[bin];
								double this_y_val = this_corr*select_slope + thisIntercept;
								if(this_SNR>=this_y_val){
									signal_out[bin]+=weight;
								} // passes RCut
							}
						} // passes surface
					} // passes new box
				} // passes WFRMS and CW power cut
			} //loop over polarizations
		} // loop over events
	} // scoping
	delete hToy_logL;
	delete hNumObserved;
	delete h2SNRvsCorr_sim[0]; delete h2SNRvsCorr_sim[1];
	delete h2SNRvsCorr_data[0]; delete h2SNRvsCorr_data[1];
	delete hEventsVsSNR;
	return 1;
}
