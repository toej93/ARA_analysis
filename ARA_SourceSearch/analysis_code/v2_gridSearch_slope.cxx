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
//#include "TTMatrixDSym.h"

// analysis custom
#include "tools_Cuts.h"
#include "tools_Stats.h"
#include "tools_CommandLine.h"
#include "tools_outputObjects.h"

using namespace std;

#include <mutex>//Multithreads writing simultaneously to file handled by mutex.
#define synchronized(m) \
    for(std::unique_lock<std::recursive_mutex> lk(m); lk; lk.unlock())

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

	if(argc<6){
		cout<< "Usage\n" << argv[0] << " <1-station> <2-config> <3-year_or_energy> <4-slope> <5-pol_select> <6-ValForCuts filename>"<<endl;;
		return -1;
	}

	int station = atoi(argv[1]);
	int config = atoi(argv[2]);
	double year_or_energy = double(atof(argv[3]));
	double slope=double(atof(argv[4]));
	int pol_select=atoi(argv[5]);


	if(station!=2 && station!=3){
		printf("No good! You asked for station %d, but this code only works for stations 2 and 3 \n",station);
		return -1;
	}

	vector<int> BadRunList=BuildBadRunList(station);

	bool version2=true;
	if(version2){

		/*
			Now, we also need a way to deal with the rotate cross correlation cut
		*/

		int numTotal=0;

		// just for V for a hot minute

		// let's see if we can do it with arrays....
		int numSNRbins=200;
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
		double max=0.05;
		TH2D *h2SNRvsCorr[2]; // SNR on Y axis, Corr on X axis, like in the TB
		h2SNRvsCorr[0]=new TH2D("","V Data",100,0,max,300,0,30);
		h2SNRvsCorr[1]=new TH2D("","H Data",100,0,max,300,0,30);

		// first, we go through the events once to construct the rotated cut
		for(int file_num=6; file_num<argc; file_num++){

			string chRun = "run";
			string file = string(argv[file_num]);
			size_t foundRun = file.find(chRun);
			string strRunNum = file.substr(foundRun+4,4);
			int runNum = atoi(strRunNum.c_str());

			TFile *inputFile = TFile::Open(argv[file_num]);
			if(!inputFile){
				cout<<"Can't open val for cuts file!"<<endl;
				return -1;
			}
			printf("Fitting loop data File %d: run %d \n", file_num, runNum);

			TTree *trees[4];
			trees[0] = (TTree*) inputFile->Get("VTree");
			trees[1] = (TTree*) inputFile->Get("HTree");
			trees[2] = (TTree*) inputFile->Get("AllTree");

			double corr_val_org[2];
			double snr_val_org[2];
			int WFRMS_org[2];
			int theta_300_org[2];
			int phi_300_org[2];
			int theta_41_org[2];
			int phi_41_org[2];

			trees[0]->SetBranchAddress("corr_val_V_org",&corr_val_org[0]);
			trees[0]->SetBranchAddress("snr_val_V_org",&snr_val_org[0]);
			trees[0]->SetBranchAddress("wfrms_val_V_org",&WFRMS_org[0]);
			trees[0]->SetBranchAddress("theta_300_V_org",&theta_300_org[0]);
			trees[0]->SetBranchAddress("theta_41_V_org",&theta_41_org[0]);
			trees[0]->SetBranchAddress("phi_300_V_org",&phi_300_org[0]);
			trees[0]->SetBranchAddress("phi_41_V_org",&phi_41_org[0]);

			trees[1]->SetBranchAddress("corr_val_H_org",&corr_val_org[1]);
			trees[1]->SetBranchAddress("snr_val_H_org",&snr_val_org[1]);
			trees[1]->SetBranchAddress("wfrms_val_H_org",&WFRMS_org[1]);
			trees[1]->SetBranchAddress("theta_300_H_org",&theta_300_org[1]);
			trees[1]->SetBranchAddress("theta_41_H_org",&theta_41_org[1]);
			trees[1]->SetBranchAddress("phi_300_H_org",&phi_300_org[1]);
			trees[1]->SetBranchAddress("phi_41_H_org",&phi_41_org[1]);

			double corr_val[2];
			double snr_val[2];
			int WFRMS[2];
			int theta_300_new[2];
			int phi_300_new[2];
			int theta_41_new[2];
			int phi_41_new[2];

			trees[0]->SetBranchAddress("corr_val_V_new",&corr_val[0]);
			trees[0]->SetBranchAddress("snr_val_V_new",&snr_val[0]);
			trees[0]->SetBranchAddress("wfrms_val_V_new",&WFRMS[0]);
			trees[0]->SetBranchAddress("theta_300_V_new",&theta_300_new[0]);
			trees[0]->SetBranchAddress("theta_41_V_new",&theta_41_new[0]);
			trees[0]->SetBranchAddress("phi_300_V_new",&phi_300_new[0]);
			trees[0]->SetBranchAddress("phi_41_V_new",&phi_41_new[0]);

			trees[1]->SetBranchAddress("corr_val_H_new",&corr_val[1]);
			trees[1]->SetBranchAddress("snr_val_H_new",&snr_val[1]);
			trees[1]->SetBranchAddress("wfrms_val_H_new",&WFRMS[1]);
			trees[1]->SetBranchAddress("theta_300_H_new",&theta_300_new[1]);
			trees[1]->SetBranchAddress("theta_41_H_new",&theta_41_new[1]);
			trees[1]->SetBranchAddress("phi_300_H_new",&phi_300_new[1]);
			trees[1]->SetBranchAddress("phi_41_H_new",&phi_41_new[1]);

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

			trees[2]->SetBranchAddress("cal",&isCal);
			trees[2]->SetBranchAddress("soft",&isSoft);
			trees[2]->SetBranchAddress("short",&isShort);
			trees[2]->SetBranchAddress("CW",&isCW);
			trees[2]->SetBranchAddress("box",&isNewBox);
			trees[2]->SetBranchAddress("surf_V_new",&isSurf[0]);
			trees[2]->SetBranchAddress("surf_H_new",&isSurf[1]);
			trees[2]->SetBranchAddress("bad",&isBadEvent);
			trees[2]->SetBranchAddress("weight",&weight);
			trees[2]->SetBranchAddress("surf_top_V",&isSurfEvent_top[0]);
			trees[2]->SetBranchAddress("surf_top_H",&isSurfEvent_top[1]);
			trees[2]->SetBranchAddress("unixTime",&unixTime);
			trees[2]->SetBranchAddress("isFirstFiveEvent",&isFirstFiveEvent);
			trees[2]->SetBranchAddress("hasBadSpareChanIssue",&hasBadSpareChanIssue);

			// double corr_val[2];
			// double snr_val[2];
			// int WFRMS[2];
			double frac_of_power_notched_V[8];
			double frac_of_power_notched_H[8];
			int Refilt[2];
			stringstream ss;
			
			
			for(int i=0; i<8; i++){
				ss.str("");
				ss<<"PowerNotch_Chan"<<i;
				trees[0]->SetBranchAddress(ss.str().c_str(),&frac_of_power_notched_V[i]);
			}
			for(int i=8; i<16; i++){
				ss.str("");
				ss<<"PowerNotch_Chan"<<i;
				trees[1]->SetBranchAddress(ss.str().c_str(),&frac_of_power_notched_H[i-8]);
			}
			
			int numEntries = trees[0]->GetEntries();
			numTotal+=numEntries;

			if(isBadRun(station,runNum,BadRunList)){
				continue;
			}

			//now to loop over events
			// numEntries=10000;
			for(int event=0; event<numEntries; event++){

				trees[0]->GetEvent(event);
				trees[1]->GetEvent(event);
				trees[2]->GetEvent(event);

				if( (isSoft || isBadEvent || hasBadSpareChanIssue || isFirstFiveEvent || isShort || isCal)){
					continue;
				}
					

				if(isBadLivetime(station,unixTime)){
					continue;
				}
				if(runNum==3663 && event==6){
					continue;
				}
		
				for(int pol=0; pol<2; pol++){
					if(!WFRMS_org[pol] && !isNewBox && !isSurf[0] && !isSurf[1] && !isSurfEvent_top[pol]){
						bool failsCWPowerCut=false;
						if(Refilt[pol] && !WFRMS[pol]){
							// cout << "Here" << endl;

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
							if(corr_val[0]>0.0068 && pol==0){
								printf(RED"Run %d, Event %d \n"RESET,runNum, event);
							}

							if(pol!=pol_select)
								continue;
							
							// only V, for the moment, populate the differential distribution
							for(int bin=0; bin<numSNRbins; bin++){ //check all potential intercepts
								double this_y_val = (slope * corr_val[pol] ) + intercept[bin]; // compute the SNR to pass at this intercept
								// printf("For bin %d, with intercept %.2f, SNR to pass is %.2f \n", bin, intercept[bin], this_y_val);
								if(snr_val[pol]>=this_y_val){ // does this event pass?
									// printf("     This event has SNR %.2f, so it passes!\n",snr_val[pol]);
									// printf("          Old number of events in this bin %5f \n", numEventsPassed[bin]);
									numEventsPassed[bin]+=1.;
									// printf(".         New number of events in this bin %5f \n", numEventsPassed[bin]);
								}
							}
						}
					}
				}
			} // loop over events
			inputFile->Close();
			delete inputFile;
		} // loop over files

		// okay, now save out the 2D histogram
		// TCanvas *cSNRvsCorr = new TCanvas("","",2.1*850, 850);
		// cSNRvsCorr->Divide(2,1);
		// for(int pol=0; pol<2; pol++){
		// 	cSNRvsCorr->cd(pol+1);
		// 	h2SNRvsCorr[pol]->Draw("colz");
		// 	h2SNRvsCorr[pol]->GetYaxis()->SetTitle("3rd Highest VPeak/RMS");
		// 	h2SNRvsCorr[pol]->GetXaxis()->SetTitle("Peak Corr");
		// 	gPad->SetLogz();
		// }
		// char title[300];
		// sprintf(title, "%s/optimize/A%d_config%d_%dEvents_SNRvsCorr.png",plotPath,station,config,numTotal);
		// // sprintf(title, "%s/optimize/%d.%d.%d_A%d_config%d_%dEvents_SNRvsCorr.png",plotPath,year_now, month_now, day_now,station,config,numTotal);
		// cSNRvsCorr->SaveAs(title);
		// delete cSNRvsCorr;

		// for(int bin=0; bin<numSNRbins; bin++){
		// 	printf("Bin %d at cut %.2f has %5f events passing \n",bin,intercept[bin], numEventsPassed[bin]);
		// }

		// now to get the differential distribution up and running
		for(int bin=0; bin<numSNRbins-1; bin++){
			numEventsPassed_diff[bin] = numEventsPassed[bin] - numEventsPassed[bin+1];
			// printf("Bin %d at cut %.2f has %5.f events passing, and next bin has %5f, so diff is %.5f \n", bin, intercept[bin],numEventsPassed[bin],numEventsPassed[bin+1],numEventsPassed_diff[bin]);
		}

		TH1D *hEventsVsSNR = new TH1D("","",numSNRbins,0,20);
		for(int bin=0; bin<numSNRbins; bin++){
			// printf("Bin %d I'm in SNR bin %.2f in the histo and I'm going to fill with %.2f \n", bin, hEventsVsSNR->GetBinCenter(bin+1),numEventsPassed_diff[bin]);
			hEventsVsSNR->SetBinContent(bin+1,numEventsPassed_diff[bin]);
		}

		int max_bin=hEventsVsSNR->GetMaximumBin();
		int last_filled_bin_above_2 = hEventsVsSNR->FindLastBinAbove(2.,1) + 2;
		int fit_start_bin=int((last_filled_bin_above_2 - max_bin)/2) + max_bin; //start half-way between the peak bin and last bin with >2 events
		double start_of_fit = hEventsVsSNR->GetBinCenter(fit_start_bin);
		int last_filled_bin = hEventsVsSNR->FindLastBinAbove(0.,1);
		double end_of_fit = hEventsVsSNR->GetBinCenter(last_filled_bin+2.); //go two bins more just to make sure fit is over


		// printf("Last filled bin is bin %d and value %.2f \n", last_filled_bin, hEventsVsSNR->GetBinCenter(last_filled_bin));
		// printf("Last filled bin above 2 is bin %d and value %.2f \n",last_filled_bin_above_2, hEventsVsSNR->GetBinCenter(last_filled_bin_above_2));
		// printf("Max bin is bin %d and value %.2f \n", max_bin, hEventsVsSNR->GetBinCenter(max_bin));
		// printf("Proposed start of fit is bin %d and value %.2f \n", fit_start_bin, hEventsVsSNR->GetBinCenter(fit_start_bin));
		// printf("Proposed end of fit is bin %d and value %.2f \n", end_of_fit, hEventsVsSNR->GetBinCenter(end_of_fit));

		// now we exponential fit
		char equation[150];
		sprintf(equation,"exp([0]*x+[1])");
		// sprintf(equation,"gaus");
		TF1 *fit = new TF1("ExpFit",equation,start_of_fit,end_of_fit);
		int status = hEventsVsSNR->Fit("ExpFit","LL,R");
		TFitResultPtr r = hEventsVsSNR->Fit("ExpFit","LL,R,S");  // TFitResultPtr contains the TFitResult
		r->Print("V");
		TMatrixDSym cov = r->GetCovarianceMatrix();
		TMatrixDSym cor = r->GetCorrelationMatrix(); 
		printf("Covariance is %.5f \n", cov[0][1]);
		if(status!=0){
			printf("Something went wrong with the fit! Quitting...\n");
			// return 0;
		}
		double fitParams[2];
		double fitParamErrors[2];
		fitParams[0] = fit->GetParameter(0);
		fitParams[1] = fit->GetParameter(1);
		fitParamErrors[0] = fit->GetParError(0);
		fitParamErrors[1] = fit->GetParError(1);
		printf("Fit Parameters are %.2f and %.2f \n", fitParams[0], fitParams[1]);

		double binWidthIntercept = hEventsVsSNR->GetBinWidth(1);


		// now to do some toy experiments to get the distribution of number of backgrounds
		double test_cut = 10.5;
		double back_estimate_central = 10.*(1./(fitParams[0]*binWidthIntercept)) * (-exp(fitParams[0]*test_cut + fitParams[1]));
		double corr_coeff=cor[0][1];
		cout<<"Expected number of backgrounds is"<<back_estimate_central<<endl;

		TRandom3 *Rand = new TRandom3();
		TH1D *toyBackgrounds = new TH1D("","",100,0,10*back_estimate_central);

		gStyle->SetOptStat(111111);

		for(int toy=0; toy<5000; toy++){

			double rand_slope = Rand->Gaus();
			double new_slope = fitParams[0] 
								+ (fitParamErrors[0]*rand_slope);

			double rand_amp = Rand->Gaus();
			double new_amp = 
							(fitParams[1])
							+ (fitParamErrors[1] * rand_slope * corr_coeff)
							+ (fitParamErrors[1] * rand_amp * sqrt(1-pow(corr_coeff,2.)));

			double new_back = 10.*(1./(new_slope*binWidthIntercept)) * (-exp(new_slope*test_cut + new_amp));
			toyBackgrounds->Fill(new_back);
		}

		double RealBack_x[2] = { back_estimate_central, back_estimate_central };
		double RealBack_Y[2] = { 0, 200 };
		TGraph *gRealBackLine = new TGraph (2, RealBack_x, RealBack_Y);

		// TCanvas *ctoyBack = new TCanvas("","",850,850);
		// toyBackgrounds->Draw();
		// gRealBackLine->Draw("same");
		// gRealBackLine->SetLineColor(kRed);
		// toyBackgrounds->GetYaxis()->SetTitle("Number of PseudoExperiments");
		// toyBackgrounds->GetXaxis()->SetTitle("Background Estimate");
		// toyBackgrounds->GetYaxis()->SetTitleOffset(1.3);
		// stringstream myTitle;
		// myTitle.str("");
		// myTitle<<"Expected from Central Value is "<<back_estimate_central;
		// toyBackgrounds->SetTitle(myTitle.str().c_str());
		// gPad->SetLogy();
		// ctoyBack->SaveAs("toy_background_distro.png");

		// return 0;

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
		printf("Do integral the automatic way is %.4f \n",hNumObserved->Integral());

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
			// printf("At bin %d with intercept %.2f Observed %.2f and Expected %.2f \n", bin, hNumObserved->GetBinCenter(bin+1), thisObserved, thisExpected );
			numObservedTotal+=thisObserved;
			numExpectedTotal_sum+=thisExpected;
			logL += ReturnLogL_highN( thisObserved,thisExpected );
		}
		// printf("The logL is %.3f \n", logL);
		
		// double numExpectedTotal_Integral = (1./(fitParams[0])) * ( exp(fitParams[0]*rightBoundary + fitParams[1]) - exp(fitParams[0]*leftBoundary + fitParams[1]));
		double numExpectedTotal_Integral = (1./(fitParams[0]*binWidthIntercept)) * ( exp(fitParams[0]*rightBoundary + fitParams[1]) - exp(fitParams[0]*leftBoundary + fitParams[1]));
		// printf("Best fit sum bins: %.2f. Best fit do integral: %.2f. Num observed: %.2f. \n",numExpectedTotal_sum, numExpectedTotal_Integral, numObservedTotal);

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
			// int Evts_Poisson = test_random->Poisson(numExpectedTotal_sum);
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
			// sprintf(this_save_title,"toy%d.png",num);
			// cToyHist->SaveAs(this_save_title);
			// delete cToyHist;
			delete hToy;
			hToy_logL->Fill(logL_log_Toy);
			if ( logL_log_Toy <= logL )
				less_BestFit_logL += logL_log_Toy;
			Total_Toy_logL += logL_log_Toy;
		}

		// vertical line for log likelihood
		double P_value = less_BestFit_logL / Total_Toy_logL;
		double DataLogL_x[2] = { logL, logL };
		double DataLogL_y[2] = { 0, 5 };
		TGraph *gDataLogL = new TGraph (2, DataLogL_x, DataLogL_y);

		printf(BLUE"About to do background estimation\n"RESET);
		/*
			Now, we must find our background estimate
			Which is where we integrate the exponential above our cut value
			And then use that to get s_up
		*/

		double S_up_array[numSNRbins];
		double S_array[numSNRbins];
		for(int bin=0; bin<numSNRbins; bin++){
			S_up_array[bin]=0.;
			S_array[bin]=0.;
		}
		int startBin = 80;
		for(int bin=startBin; bin<numSNRbins; bin++){
			double cut = intercept[bin];
			double back_estimate = (1./(fitParams[0]*binWidthIntercept)) * (-exp(fitParams[0]*cut + fitParams[1]));
			back_estimate*=10.; // make it 10 times bigger, for switch to 100% sample
			double s_up; //save time computing s_up if we know the answer is 2.3...
			if(back_estimate<1e-5){
				s_up=2.3;
			}
			else{
				double achieved_alpha;
				// double s_up = GetS_up_TMath(back_estimate,achieved_alpha, 0.9); // compute S_up for this background
				s_up = GetS_up(back_estimate,achieved_alpha, 0.9); // compute S_up for this backgroun
			}
			S_up_array[bin] = s_up;
			// printf("For cut %.2f background estimate is %.3f with sup %.2f \n",cut,back_estimate,S_up_array[bin]);
		}

		// for(double cut=8.; cut<14; cut+=0.1){
		// 	double back_estimate = (1./(fitParams[0]*binWidthIntercept)) * (-exp(fitParams[0]*cut + fitParams[1]));
		// 	back_estimate*=10; // make it 10 times bigger, for switch to 100% sample
		// 	double achieved_alpha;
		// 	double s_up = GetS_up_TMath(back_estimate,achieved_alpha, 0.9); // compute 90% CL UL for this many background
		// 	printf("For cut %.2f background estimate is %.3f with sup %.2f \n",cut,back_estimate,s_up);
		// }

		double select_slope=slope;

		/*
			Now we must loop over data and simulation
		*/

		TChain simVTree("VTree");
		TChain simHTree("HTree");
		TChain simAllTree("AllTree");
		char the_sims[500];
		// sprintf(the_sims,"/fs/project/PAS0654/ARA_DATA/A23/sim_SourceSearch/A%d/ValsForCuts/cutvals_drop_FiltSurface_CWThresh2.0_snrbins_0_1_wfrmsvals_0.0_0.0_run_*.root",station);
		sprintf(the_sims,"/fs/project/PAS0654/ARA_DATA/A23/sim/ValsForCuts_UsedInA2FinalOpt/A2/c1/E224/cutvals_drop_FiltSurface_snrbins_0_0_wfrmsvals_-1.3_-1.4_run_*.root",station);//Diffuse sims for X-checking
		simVTree.Add(the_sims);
		simHTree.Add(the_sims);
		simAllTree.Add(the_sims);
		int numSimEvents = simVTree.GetEntries();
		// printf("Num of sim entries is %d \n", numSimEvents);

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
								for(int bin=startBin; bin<numSNRbins; bin++){
									double failsRcut=false;
									double thisIntercept = intercept[bin];
									double this_y_val = this_corr*select_slope + thisIntercept;
									if(this_SNR>=this_y_val){
										S_array[bin]+=weight;
									}
								}
							}
						}
					}
				} //loop over polarizations
			}
		}
		double SoverSup[numSNRbins];
		for(int bin=0; bin<numSNRbins; bin++){
			double this_S = S_array[bin];
			double this_Sup = S_up_array[bin];
			double this_SoverSup;
			if(!this_Sup>0)
				this_SoverSup=0.;
			else
				this_SoverSup = this_S/this_Sup;

			SoverSup[bin] = this_SoverSup;
			// printf("For bin %d, intercept %.2f, S is %.2f and S_up is %.2f for S/S_up of %.2f  \n", bin,intercept[bin],this_S, this_Sup, this_SoverSup);
		}
		double max_SoverSup=0.;
		double optimal_intercept=0.;
		for(int bin=0; bin<numSNRbins; bin++){
			double this_intercept = intercept[bin];
			if(this_intercept<8. || this_intercept>17.){
				continue;
			}
			else{
				double this_SoverSup=SoverSup[bin];
				if(this_SoverSup>max_SoverSup){
					// printf("At bin %d, for intercept %.2f, new S/Sup of %.2f is greater than current %.2f \n",bin, intercept[bin], this_SoverSup,max_SoverSup);
					optimal_intercept = this_intercept;
					max_SoverSup=this_SoverSup;
				}
			}
		}
    char title[300];
		sprintf(title, "/users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/ARA_analysis/ARA_SourceSearch/results/gridSearch/A%i/c%i/result_%.1f.txt",station,config,abs(slope));
    FILE *fout = fopen(title, "w+");//open file
    fprintf(fout, "%f,%f",slope,max_SoverSup);
    fclose(fout);

    cout << max_SoverSup << endl;
		// TGraph *gSoverSup = new TGraph(numSNRbins,intercept,SoverSup);
    // 
		// printf("Found optimal intercept at %.2f \n", optimal_intercept);
		// double select_inter=optimal_intercept;
    // 
		// printf(BLUE"Now to loop back through the data and compute cut tables\n"RESET);
    // 
		// /*
		// 	We must now also loop through the data one more time to compute the "as last cut"
		// 	VPol for now, just to get a feeling for what the filter is doing.
		// */
		// double num_total_data=0.;
		// double remove_bad_runs_and_livetime_data=0.;
		// double and_remove_soft_data=0.;
		// double and_remove_short_and_glitch_data=0.;
		// double and_remove_tagged_cal_data=0.;
    // 
		// double fails_WFRMS_first_data[2]={0.,0.};
		// double fails_box_first_data[2]={0.,0.};
		// double fails_surface_first_data[2]={0.,0.};
		// double fails_rcut_first_data[2]={0.,0.};
    // 
		// double fails_WFRMS_last_data[2]={0.,0.};
		// double fails_box_last_data[2]={0.,0.};
		// double fails_surface_last_data[2]={0.,0.};
		// double fails_rcut_last_data[2]={0.,0.};
    // 
		// double fails_WFRMS_insequence_data[2]={0.,0.};
		// double fails_box_insequence_data[2]={0.,0.};
		// double fails_surface_insequence_data[2]={0.,0.};
		// double fails_rcut_insequence_data[2]={0.,0.};
    // 
		// // now, we go back through the data a second time to get "as last cut" tables
		// for(int file_num=6; file_num<argc; file_num++){
    // 
		// 	string chRun = "run";
		// 	string file = string(argv[file_num]);
		// 	size_t foundRun = file.find(chRun);
		// 	string strRunNum = file.substr(foundRun+4,4);
		// 	int runNum = atoi(strRunNum.c_str());
    // 
		// 	TFile *inputFile = TFile::Open(argv[file_num]);
		// 	if(!inputFile){
		// 		cout<<"Can't open val for cuts file!"<<endl;
		// 		return -1;
		// 	}
		// 	printf("As last cut loop data file %d: run %d \n", file_num, runNum);
    // 
		// 	TTree *trees[3];
		// 	trees[0] = (TTree*) inputFile->Get("VTree");
		// 	trees[1] = (TTree*) inputFile->Get("HTree");
		// 	trees[2] = (TTree*) inputFile->Get("AllTree");
    // 
		// 	double corr_val[2];
		// 	double snr_val[2];
		// 	int WFRMS[2];
		// 	double frac_of_power_notched_V[8];
		// 	double frac_of_power_notched_H[8];
		// 	int Refilt[2];
    // 
		// 	trees[0]->SetBranchAddress("corr_val_V_new",&corr_val[0]);
		// 	trees[0]->SetBranchAddress("snr_val_V_new",&snr_val[0]);
		// 	trees[0]->SetBranchAddress("wfrms_val_V_new",&WFRMS[0]);
		// 	trees[0]->SetBranchAddress("Refilt_V",&Refilt[0]);
		// 	trees[1]->SetBranchAddress("corr_val_H_new",&corr_val[1]);
		// 	trees[1]->SetBranchAddress("snr_val_H_new",&snr_val[1]);
		// 	trees[1]->SetBranchAddress("wfrms_val_H_new",&WFRMS[1]);
		// 	trees[1]->SetBranchAddress("Refilt_H",&Refilt[1]);
    // 
		// 	int isCal;
		// 	int isSoft;
		// 	int isShort;
		// 	int isCW;
		// 	int isNewBox;
		// 	int isSurf[2];
		// 	int isBadEvent;
		// 	double weight;
		// 	int isSurfEvent_top[2];
		// 	int unixTime;
		// 	int isFirstFiveEvent;
		// 	int hasBadSpareChanIssue;
    // 
		// 	trees[2]->SetBranchAddress("cal",&isCal);
		// 	trees[2]->SetBranchAddress("soft",&isSoft);
		// 	trees[2]->SetBranchAddress("short",&isShort);
		// 	trees[2]->SetBranchAddress("CW",&isCW);
		// 	trees[2]->SetBranchAddress("box",&isNewBox);
		// 	trees[2]->SetBranchAddress("surf_V_new",&isSurf[0]);
		// 	trees[2]->SetBranchAddress("surf_H_new",&isSurf[1]);
		// 	trees[2]->SetBranchAddress("bad",&isBadEvent);
		// 	trees[2]->SetBranchAddress("weight",&weight);
		// 	trees[2]->SetBranchAddress("surf_top_V",&isSurfEvent_top[0]);
		// 	trees[2]->SetBranchAddress("surf_top_H",&isSurfEvent_top[1]);
		// 	trees[2]->SetBranchAddress("unixTime",&unixTime);
		// 	trees[2]->SetBranchAddress("isFirstFiveEvent",&isFirstFiveEvent);
		// 	trees[2]->SetBranchAddress("hasBadSpareChanIssue",&hasBadSpareChanIssue);
    // 
		// 	stringstream ss;
		// 	for(int i=0; i<8; i++){
		// 		ss.str("");
		// 		ss<<"PowerNotch_Chan"<<i;
		// 		trees[0]->SetBranchAddress(ss.str().c_str(),&frac_of_power_notched_V[i]);
		// 	}
		// 	for(int i=8; i<16; i++){
		// 		ss.str("");
		// 		ss<<"PowerNotch_Chan"<<i;
		// 		trees[1]->SetBranchAddress(ss.str().c_str(),&frac_of_power_notched_H[i-8]);
		// 	}
    // 
		// 	int numEntries = trees[0]->GetEntries();
		// 	numTotal+=numEntries;
    // 
		// 	if(isBadRun(station,runNum,BadRunList)){
		// 		continue;
		// 	}
    // 
		// 	//now to loop over events
		// 	for(int event=0; event<numEntries; event++){
    // 
		// 		trees[0]->GetEvent(event);
		// 		trees[1]->GetEvent(event);
		// 		trees[2]->GetEvent(event);
    // 
		// 		num_total_data+=weight;
    // 
    // 
		// 		if(isBadLivetime(station,unixTime)){
		// 			continue;
		// 		}
		// 		remove_bad_runs_and_livetime_data+=weight;
    // 
		// 		if(isSoft){
		// 			continue;
		// 		}
		// 		and_remove_soft_data+=weight;
    // 
		// 		if(
		// 			(isBadEvent
		// 			|| isFirstFiveEvent
		// 			|| hasBadSpareChanIssue
		// 			|| isShort)
		// 			){
		// 			continue;
		// 		}
		// 		and_remove_short_and_glitch_data+=weight;
    // 
		// 		if(isCal){
		// 			continue;
		// 		}
		// 		and_remove_tagged_cal_data+=weight;
    // 
		// 		for(int pol=0; pol<2; pol++){
		// 			bool failsCWPowerCut=false;
		// 			if(Refilt[pol] && !WFRMS[pol]){
		// 				vector<double> frac;
		// 				for(int i=0; i<8; i++){
		// 					if(pol==0) frac.push_back(frac_of_power_notched_V[i]);
		// 					else if(pol==1) frac.push_back(frac_of_power_notched_H[i]);
		// 				}
		// 				sort(frac.begin(), frac.end(), std::greater<double>());
		// 				if(frac[2]>0.06){
		// 					failsCWPowerCut=true;
		// 				}
		// 			} //refiltered?
    // 
		// 			bool failsRcut=false;
		// 			double this_SNR=snr_val[pol];
		// 			double this_corr=corr_val[pol];
		// 			double this_y_val = this_corr*select_slope + select_inter;
		// 			if(this_SNR < this_y_val){
		// 				failsRcut=true;
		// 			}
    // 
		// 			// "as first cut"
		// 				// fail WFRMS first?
		// 				if(WFRMS[pol] || failsCWPowerCut){
		// 					fails_WFRMS_first_data[pol]+=weight;
		// 				}
		// 				// fail box first?
		// 				if(isNewBox){
		// 					fails_box_first_data[pol]+=weight;
		// 				}
		// 				// fail surface first?
		// 				if(isSurf[0] || isSurf[1] || isSurfEvent_top[pol]){
		// 					fails_surface_first_data[pol]+=weight;
		// 				}
		// 				if(failsRcut){
		// 					fails_rcut_first_data[pol]+=weight;
		// 				}
    // 
    // 
		// 			// "as last cut"
		// 				// fails as last cut with surface?
		// 				// survives WFRMS and box and Rcut, but doesn't survive surface
		// 				if(!WFRMS[pol] && !failsCWPowerCut && !isNewBox && !failsRcut){
		// 					if(isSurf[0] || isSurf[1] || isSurfEvent_top[pol]){
		// 						fails_surface_last_data[pol]+=weight;
		// 					}
		// 				}
		// 				// fails as last cut with WFRMS?
		// 				// survives box and surface, but doesn't survive WFRMS
		// 				if(!isNewBox && !isSurf[0] && !isSurf[1] && !isSurfEvent_top[pol] && !failsRcut){
		// 					if(WFRMS[pol] || failsCWPowerCut){
		// 						fails_WFRMS_last_data[pol]+=weight;
		// 					}
		// 				}
		// 				// fails as last cut with box?
		// 				// survives surface and WFRMS, but not the box
		// 				if(!isSurf[0] && !isSurf[1] && !isSurfEvent_top[pol] && !WFRMS[pol] && !failsCWPowerCut && !failsRcut){
		// 					if(isNewBox){
		// 						fails_box_last_data[pol]+=weight;
		// 					}
		// 				}
		// 				// fails as last cust with Rcut?
		// 				if(!isSurf[0] && !isSurf[1] && !isSurfEvent_top[pol] && !WFRMS[pol] && !failsCWPowerCut && !isNewBox){
		// 					if(failsRcut){
		// 						fails_rcut_last_data[pol]+=weight;
		// 					}
		// 				}
    // 
		// 			// "in sequence"
		// 				// fails WFRMS first? (same as "as first" for this cut only)
		// 				if(WFRMS[pol] || failsCWPowerCut){
		// 					fails_WFRMS_insequence_data[pol]+=weight;
		// 				}
		// 				// passes WFRMS, but fails box
		// 				if(!WFRMS[pol] && !failsCWPowerCut && isNewBox){
		// 					fails_box_insequence_data[pol]+=weight;
		// 				}
		// 				// passes WFRMS and box, but fails surface
		// 				if(!WFRMS[pol] && !failsCWPowerCut && !isNewBox && (isSurf[0] || isSurf[1] || isSurfEvent_top[pol])){
		// 					fails_surface_insequence_data[pol]+=weight;
		// 				}
		// 				// passes WFRMS, box, and surface, but fails Rcut (same as "as last" for this cut only)
		// 				if(!WFRMS[pol] && !failsCWPowerCut && !isNewBox && (!isSurf[0] && !isSurf[1] && !isSurfEvent_top[pol]) && failsRcut){
		// 					fails_rcut_insequence_data[pol]+=weight;
		// 				}
		// 		}
		// 	} // loop over events
		// 	inputFile->Close();
		// 	delete inputFile;
		// } // loop over files
    // 
		// printf("Num total          :           %7.1f\n",num_total_data);
		// printf("Livetime           :           %7.1f\n",remove_bad_runs_and_livetime_data);
		// printf("Soft Trig          :           %7.1f\n",and_remove_soft_data);
		// printf("Short and Glitch   :           %7.1f\n",and_remove_short_and_glitch_data);
		// printf("Tagged Cal         :           %7.1f\n",and_remove_tagged_cal_data);
		// printf("------------------------------------------\n");
		// printf("WFRMS              :           %7.1f, %7.1f, %7.1f | %7.1f, %7.1f, %7.1f \n",fails_WFRMS_first_data[0],fails_WFRMS_insequence_data[0],fails_WFRMS_last_data[0],fails_WFRMS_first_data[1],fails_WFRMS_insequence_data[1],fails_WFRMS_last_data[1]);
		// printf("Box                :           %7.1f, %7.1f, %7.1f | %7.1f, %7.1f, %7.1f \n",fails_box_first_data[0],fails_box_insequence_data[0],fails_box_last_data[0],fails_box_first_data[1],fails_box_insequence_data[1],fails_box_last_data[1]);
		// printf("Surf               :           %7.1f, %7.1f, %7.1f | %7.1f, %7.1f, %7.1f \n",fails_surface_first_data[0],fails_surface_insequence_data[0],fails_surface_last_data[0],fails_surface_first_data[1],fails_surface_insequence_data[1],fails_surface_last_data[1]);
		// printf("Rcut               :           %7.1f, %7.1f, %7.1f | %7.1f, %7.1f, %7.1f \n",fails_rcut_first_data[0],fails_rcut_insequence_data[0],fails_rcut_last_data[0],fails_rcut_first_data[1],fails_rcut_insequence_data[1],fails_rcut_last_data[1]);
    // 
		// printf(RED"Now to try and go over the simulation again\n"RESET);
		// /*
		// 	And now we go through the simulation again to get our as last cut table and to compute efficiencies
		// */
		// double num_total_sim=0.;
    // 
		// double fails_WFRMS_first_sim[2]={0.,0.};
		// double fails_box_first_sim[2]={0.,0.};
		// double fails_surface_first_sim[2]={0.,0.};
		// double fails_rcut_first_sim[2]={0.,0.};
    // 
		// double fails_WFRMS_last_sim[2]={0.,0.};
		// double fails_box_last_sim[2]={0.,0.};
		// double fails_surface_last_sim[2]={0.,0.};
		// double fails_rcut_last_sim[2]={0.,0.};
    // 
		// double fails_WFRMS_insequence_sim[2]={0.,0.};
		// double fails_box_insequence_sim[2]={0.,0.};
		// double fails_surface_insequence_sim[2]={0.,0.};
		// double fails_rcut_insequence_sim[2]={0.,0.};
    // 
		// TH1D *all_events[2];
		// TH1D *pass_soft_short_cal_wfrms[2];
		// TH1D *pass_soft_short_cal_wfrms_box[2];
		// TH1D *pass_soft_short_cal_wfrms_box_surf[2];
		// TH1D *pass_soft_short_cal_wfrms_box_surf_rcut[2];
    // 
		// TH1D *eff[2];
		// TH1D *eff_soft_short_cal[2];
		// TH1D *eff_soft_short_cal_wfrms[2];
		// TH1D *eff_soft_short_cal_wfrms_box[2];
		// TH1D *eff_soft_short_cal_wfrms_box_surf[2];
		// TH1D *eff_soft_short_cal_wfrms_box_surf_rcut[2];
    // 
		// for(int i=0; i<2; i++){
		// 	all_events[i] = new TH1D("","",30,0,30);
		// 	pass_soft_short_cal_wfrms[i] = new TH1D("","",30,0,30);
		// 	pass_soft_short_cal_wfrms_box[i] = new TH1D("","",30,0,30);
		// 	pass_soft_short_cal_wfrms_box_surf[i] = new TH1D("","",30,0,30);
		// 	pass_soft_short_cal_wfrms_box_surf_rcut[i] = new TH1D("","",30,0,30);
    // 
		// 	eff_soft_short_cal_wfrms[i] = new TH1D("","",30,0,30);
		// 	eff_soft_short_cal_wfrms_box[i] = new TH1D("","",30,0,30);
		// 	eff_soft_short_cal_wfrms_box_surf[i] = new TH1D("","",30,0,30);
		// 	eff_soft_short_cal_wfrms_box_surf_rcut[i] = new TH1D("","",30,0,30);
		// }
    // 
    // 
		// {
		// 	double corr_val[2];
		// 	double snr_val[2];
		// 	int WFRMS[2];
		// 	double frac_of_power_notched_V[8];
		// 	double frac_of_power_notched_H[8];
		// 	int Refilt[2];
    // 
		// 	simVTree.SetBranchAddress("corr_val_V_new",&corr_val[0]);
		// 	simVTree.SetBranchAddress("snr_val_V_new",&snr_val[0]);
		// 	simVTree.SetBranchAddress("wfrms_val_V_new",&WFRMS[0]);
		// 	simVTree.SetBranchAddress("Refilt_V",&Refilt[0]);
		// 	simHTree.SetBranchAddress("corr_val_H_new",&corr_val[1]);
		// 	simHTree.SetBranchAddress("snr_val_H_new",&snr_val[1]);
		// 	simHTree.SetBranchAddress("wfrms_val_H_new",&WFRMS[1]);
		// 	simHTree.SetBranchAddress("Refilt_H",&Refilt[1]);
    // 
		// 	int isCal;
		// 	int isSoft;
		// 	int isShort;
		// 	int isCW;
		// 	int isNewBox;
		// 	int isSurf[2];
		// 	int isBadEvent;
		// 	double weight;
		// 	int isSurfEvent_top[2];
		// 	int unixTime;
		// 	int isFirstFiveEvent;
		// 	int hasBadSpareChanIssue;
    // 
		// 	simAllTree.SetBranchAddress("cal",&isCal);
		// 	simAllTree.SetBranchAddress("soft",&isSoft);
		// 	simAllTree.SetBranchAddress("short",&isShort);
		// 	simAllTree.SetBranchAddress("CW",&isCW);
		// 	simAllTree.SetBranchAddress("box",&isNewBox);
		// 	simAllTree.SetBranchAddress("surf_V_new",&isSurf[0]);
		// 	simAllTree.SetBranchAddress("surf_H_new",&isSurf[1]);
		// 	simAllTree.SetBranchAddress("bad",&isBadEvent);
		// 	simAllTree.SetBranchAddress("weight",&weight);
		// 	simAllTree.SetBranchAddress("surf_top_V",&isSurfEvent_top[0]);
		// 	simAllTree.SetBranchAddress("surf_top_H",&isSurfEvent_top[1]);
		// 	simAllTree.SetBranchAddress("unixTime",&unixTime);
		// 	simAllTree.SetBranchAddress("isFirstFiveEvent",&isFirstFiveEvent);
		// 	simAllTree.SetBranchAddress("hasBadSpareChanIssue",&hasBadSpareChanIssue);
    // 
		// 	stringstream ss;
		// 	for(int i=0; i<8; i++){
		// 		ss.str("");
		// 		ss<<"PowerNotch_Chan"<<i;
		// 		simVTree.SetBranchAddress(ss.str().c_str(),&frac_of_power_notched_V[i]);
		// 	}
		// 	for(int i=8; i<16; i++){
		// 		ss.str("");
		// 		ss<<"PowerNotch_Chan"<<i;
		// 		simHTree.SetBranchAddress(ss.str().c_str(),&frac_of_power_notched_H[i-8]);
		// 	}
    // 
		// 	for(int event=0; event<numSimEvents; event++){
    // 
		// 		simVTree.GetEvent(event);
		// 		simHTree.GetEvent(event);
		// 		simAllTree.GetEvent(event);
    // 
		// 		num_total_sim+=weight;
    // 
		// 		for(int pol=0; pol<2; pol++){
		// 			bool failsCWPowerCut=false;
		// 			if(Refilt[pol] && !WFRMS[pol]){
		// 				vector<double> frac;
		// 				for(int i=0; i<8; i++){
		// 					if(pol==0) frac.push_back(frac_of_power_notched_V[i]);
		// 					else if(pol==1) frac.push_back(frac_of_power_notched_H[i]);
		// 				}
		// 				sort(frac.begin(), frac.end(), std::greater<double>());
		// 				if(frac[2]>0.06){
		// 					failsCWPowerCut=true;
		// 				}
		// 			} //refiltered?
    // 
		// 			bool failsRcut=false;
		// 			double this_SNR=snr_val[pol];
		// 			double this_corr=corr_val[pol];
		// 			double this_y_val = this_corr*select_slope + select_inter;
		// 			if(this_SNR < this_y_val){
		// 				failsRcut=true;
		// 			}
    // 
		// 			if (this_SNR>30.) this_SNR=30.;
		// 			all_events[pol]->Fill(this_SNR,weight);
		// 			if(!WFRMS[pol] && !failsCWPowerCut){
		// 				pass_soft_short_cal_wfrms[pol]->Fill(this_SNR,weight);
		// 				if(!isNewBox){
		// 					pass_soft_short_cal_wfrms_box[pol]->Fill(this_SNR,weight);
		// 					if(!isSurf[0] && !isSurf[1] && !isSurfEvent_top[pol]){
		// 						pass_soft_short_cal_wfrms_box_surf[pol]->Fill(this_SNR,weight);
		// 						if(!failsRcut)
		// 							pass_soft_short_cal_wfrms_box_surf_rcut[pol]->Fill(this_SNR,weight);
		// 					}
		// 				}
		// 			}
    // 
		// 			// "as first cut"
		// 				// fail WFRMS first?
		// 				if(WFRMS[pol] || failsCWPowerCut){
		// 					fails_WFRMS_first_sim[pol]+=weight;
		// 				}
		// 				// fail box first?
		// 				if(isNewBox){
		// 					fails_box_first_sim[pol]+=weight;
		// 				}
		// 				// fail surface first?
		// 				if(isSurf[0] || isSurf[1] || isSurfEvent_top[pol]){
		// 					fails_surface_first_sim[pol]+=weight;
		// 				}
		// 				if(failsRcut){
		// 					fails_rcut_first_sim[pol]+=weight;
		// 				}
    // 
    // 
		// 			// "as last cut"
		// 				// fails as last cut with surface?
		// 				// survives WFRMS and box, but doesn't survive surface
		// 				if(!WFRMS[pol] && !failsCWPowerCut && !isNewBox && !failsRcut){
		// 					if(isSurf[0] || isSurf[1] || isSurfEvent_top[pol]){
		// 						fails_surface_last_sim[pol]+=weight;
		// 					}
		// 				}
		// 				// fails as last cut with WFRMS?
		// 				// survives box and surface, but doesn't survive WFRMS
		// 				if(!isNewBox && !isSurf[0] && !isSurf[1] && !isSurfEvent_top[pol] && !failsRcut){
		// 					if(WFRMS[pol] || failsCWPowerCut){
		// 						fails_WFRMS_last_sim[pol]+=weight;
		// 					}
		// 				}
		// 				// fails as last cut with box?
		// 				// survives surface and WFRMS, but not the box
		// 				if(!isSurf[0] && !isSurf[1] && !isSurfEvent_top[pol] && !WFRMS[pol] && !failsCWPowerCut && !failsRcut){
		// 					if(isNewBox){
		// 						fails_box_last_sim[pol]+=weight;
		// 					}
		// 				}
		// 				// fails as last cust with Rcut?
		// 				if(!isSurf[0] && !isSurf[1] && !isSurfEvent_top[pol] && !WFRMS[pol] && !failsCWPowerCut && !isNewBox){
		// 					if(failsRcut){
		// 						fails_rcut_last_sim[pol]+=weight;
		// 					}
		// 				}
    // 
		// 			// "in sequence"
		// 				// fails WFRMS first? (same as "as first" for this cut only)
		// 				if(WFRMS[pol] || failsCWPowerCut){
		// 					fails_WFRMS_insequence_sim[pol]+=weight;
		// 				}
		// 				// passes WFRMS, but fails box
		// 				if(!WFRMS[pol] && !failsCWPowerCut && isNewBox){
		// 					fails_box_insequence_sim[pol]+=weight;
		// 				}
		// 				// passes WFRMS and box, but fails surface
		// 				if(!WFRMS[pol] && !failsCWPowerCut && !isNewBox && (isSurf[0] || isSurf[1] || isSurfEvent_top[pol])){
		// 					fails_surface_insequence_sim[pol]+=weight;
		// 				}
		// 				// passes WFRMS, box, and surface, but fails Rcut (same as "as last" for this cut only)
		// 				if(!WFRMS[pol] && !failsCWPowerCut && !isNewBox && (!isSurf[0] && !isSurf[1] && !isSurfEvent_top[pol]) && failsRcut){
		// 					fails_rcut_insequence_sim[pol]+=weight;
		// 				}
		// 		} // loop over pol
		// 	} //loop over sim events
    // 
		// }
    // 
		// printf("Sim Num total          :           %7.1f\n",num_total_sim);
		// printf("------------------------------------------\n");
		// printf("Sim WFRMS              :           %7.1f, %7.1f, %7.1f | %7.1f, %7.1f, %7.1f \n",fails_WFRMS_first_sim[0],fails_WFRMS_insequence_sim[0],fails_WFRMS_last_sim[0],fails_WFRMS_first_sim[1],fails_WFRMS_insequence_sim[1],fails_WFRMS_last_sim[1]);
		// printf("Sim Box                :           %7.1f, %7.1f, %7.1f | %7.1f, %7.1f, %7.1f \n",fails_box_first_sim[0],fails_box_insequence_sim[0],fails_box_last_sim[0],fails_box_first_sim[1],fails_box_insequence_sim[1],fails_box_last_sim[1]);
		// printf("Sim Surf               :           %7.1f, %7.1f, %7.1f | %7.1f, %7.1f, %7.1f \n",fails_surface_first_sim[0],fails_surface_insequence_sim[0],fails_surface_last_sim[0],fails_surface_first_sim[1],fails_surface_insequence_sim[1],fails_surface_last_sim[1]);
		// printf("Sim Rcut               :           %7.1f, %7.1f, %7.1f | %7.1f, %7.1f, %7.1f \n",fails_rcut_first_sim[0],fails_rcut_insequence_sim[0],fails_rcut_last_sim[0],fails_rcut_first_sim[1],fails_rcut_insequence_sim[1],fails_rcut_last_sim[1]);
    // 
		// printf("Pol %d Fit Parameters are %.2f and %.2f \n", pol_select, fitParams[0], fitParams[1]);
		// printf("Found optimal pol %d intercept at %.2f \n", pol_select, optimal_intercept);
    // 
		// int colors [28] = { kBlue, kRed, kGreen, kMagenta, kCyan};
		// for(int pol=0; pol<2; pol++){
		// 	for(int bin=0; bin<=all_events[pol]->GetNbinsX(); bin++){
		// 		double thrown = all_events[pol]->GetBinContent(bin);
		// 		double pass_soft_short_cal_wfrms_this = pass_soft_short_cal_wfrms[pol]->GetBinContent(bin);
		// 		double pass_soft_short_cal_wfrms_box_this = pass_soft_short_cal_wfrms_box[pol]->GetBinContent(bin);
		// 		double pass_soft_short_cal_wfrms_box_surf_this = pass_soft_short_cal_wfrms_box_surf[pol]->GetBinContent(bin);
		// 		double pass_soft_short_cal_wfrms_box_surf_rcut_this = pass_soft_short_cal_wfrms_box_surf_rcut[pol]->GetBinContent(bin);
		// 		if(thrown>0.){
		// 			eff_soft_short_cal_wfrms[pol]->SetBinContent(bin,pass_soft_short_cal_wfrms_this/thrown);
		// 			eff_soft_short_cal_wfrms_box[pol]->SetBinContent(bin,pass_soft_short_cal_wfrms_box_this/thrown);
		// 			eff_soft_short_cal_wfrms_box_surf[pol]->SetBinContent(bin,pass_soft_short_cal_wfrms_box_surf_this/thrown);
		// 			eff_soft_short_cal_wfrms_box_surf_rcut[pol]->SetBinContent(bin,pass_soft_short_cal_wfrms_box_surf_rcut_this/thrown);
		// 		}
		// 		else{
		// 			eff_soft_short_cal_wfrms[pol]->SetBinContent(bin,0.);
		// 			eff_soft_short_cal_wfrms_box[pol]->SetBinContent(bin,0.);
		// 			eff_soft_short_cal_wfrms_box_surf[pol]->SetBinContent(bin,0.);
		// 			eff_soft_short_cal_wfrms_box_surf_rcut[pol]->SetBinContent(bin,0.);
		// 		}
		// 	}
		// }
    // 
		// TCanvas *c3 = new TCanvas("mycanv","mycanv",2*850,850);
		// c3->Divide(2,1);
		// for(int pol=0; pol<2; pol++){
		// 	if(pol==0){
		// 		eff_soft_short_cal_wfrms[pol]->SetTitle("Efficiency VPol");
		// 	}
		// 	if(pol==1){
		// 		eff_soft_short_cal_wfrms[pol]->SetTitle("Efficiency HPol");
		// 	}
    // 
		// 	c3->cd(pol+1);
		// 		eff_soft_short_cal_wfrms[pol]->Draw("");
		// 		eff_soft_short_cal_wfrms_box[pol]->Draw("same");
		// 		eff_soft_short_cal_wfrms_box_surf[pol]->Draw("same");
		// 		eff_soft_short_cal_wfrms_box_surf_rcut[pol]->Draw("same");
    // 
    // 
		// 		eff_soft_short_cal_wfrms[pol]->SetLineColor(colors[0]);
		// 		eff_soft_short_cal_wfrms_box[pol]->SetLineColor(colors[1]);
		// 		eff_soft_short_cal_wfrms_box_surf[pol]->SetLineColor(colors[2]);
		// 		eff_soft_short_cal_wfrms_box_surf_rcut[pol]->SetLineColor(colors[3]);
    // 
		// 		eff_soft_short_cal_wfrms[pol]->SetLineWidth(2.);
		// 		eff_soft_short_cal_wfrms_box[pol]->SetLineWidth(2.);
		// 		eff_soft_short_cal_wfrms_box_surf[pol]->SetLineWidth(2.);
		// 		eff_soft_short_cal_wfrms_box_surf_rcut[pol]->SetLineWidth(2.);
    // 
		// 		// if(pol+1==1){
		// 		// 	TLegend *leg = new TLegend(0.48,0.6,0.9,0.9);
		// 		// 	leg->AddEntry(eff_soft_short_cal_wfrms[pol],"Cut WFMRS","l");
		// 		// 	leg->AddEntry(eff_soft_short_cal_wfrms_box[pol],"+Cut Cal Pulser Reco","l");
		// 		// 	leg->AddEntry(eff_soft_short_cal_wfrms_box_surf[pol],"+Cut Surface","l");
		// 		// 	leg->AddEntry(eff_soft_short_cal_wfrms_box_surf_rcut[pol],"+Cut Peak/Corr","l");
		// 		// 	leg->Draw();
		// 		// }
    // 
		// 	eff_soft_short_cal_wfrms[pol]->GetXaxis()->SetTitle("3rd Highest Vpeak/RMS");
		// 	eff_soft_short_cal_wfrms[pol]->GetYaxis()->SetTitle("Efficiency (weighted)");
    // 
		// }
		// char efficiency_title[400];
		// sprintf(efficiency_title,
		// 	"%s/optimize/A%d_config%d_E%2.1f_Pol%d_Efficiency.png",plotPath,station,config,224.,pol_select);
		// 		 // "%s/optimize/%d.%d.%d_A%d_config%d_E%2.1f_Efficiency.png",plotPath,year_now, month_now, day_now,station,config,224.);
		// c3->SaveAs(efficiency_title);
		// delete c3;
    // 
		// /*
		// 	And now a big multi-panel plot at the end to put all of this information together in one place
		// */
    // 
		// vector <double> x_vals_for_line;
		// vector <double> y_vals_for_line;
		// for(double x=0; x<0.020; x+=0.00001){
		// 	double y_val = (slope * x ) + optimal_intercept;
		// 	x_vals_for_line.push_back(x);
		// 	y_vals_for_line.push_back(y_val);
		// }
		// TGraph *cut_line = new TGraph(x_vals_for_line.size(), &x_vals_for_line[0], &y_vals_for_line[0]);
    // 
		// double optimal_intercept_line_x[2] = { optimal_intercept, optimal_intercept };
		// double optimal_intercept_line_y[2] = { 0, 3e3 };
		// TGraph *optimal_intercept_line = new TGraph (2, optimal_intercept_line_x, optimal_intercept_line_y);
    // 
		// TCanvas *cRcut = new TCanvas("","",4*850,2*850);
		// cRcut->Divide(4,2);
		// cRcut->cd(1);
		// 	h2SNRvsCorr[pol_select]->Draw("colz");
		// 	h2SNRvsCorr[pol_select]->GetXaxis()->SetTitle("Correlation Value");
		// 	h2SNRvsCorr[pol_select]->GetYaxis()->SetTitle("SNR");
		// 	gPad->SetLogz();
		// 	cut_line->Draw("same");
		// 	cut_line->SetLineColor(kRed);
		// cRcut->cd(2);
		// 	hEventsVsSNR->Draw("");
		// 	hEventsVsSNR->GetXaxis()->SetTitle("SNR Cut (y-intercept value)");
		// 	hEventsVsSNR->GetYaxis()->SetTitle("Number of Events Cut");
		// 	hEventsVsSNR->SetTitle("Differential Distribution");
		// 	gPad->SetLogy();
		// 	// hEventsVsSNR->GetXaxis()->SetRangeUser(8.6,10.);
		// 	// hEventsVsSNR->GetYaxis()->SetRangeUser(8e1,1e4);
		// cRcut->cd(3);
		// 	hNumObserved->Draw("HIST");
		// 	hNumObserved->GetXaxis()->SetTitle("SNR Cut (y-intercept value)");
		// 	hNumObserved->GetYaxis()->SetTitle("Number of Events Cut");
		// 	char fit_title_words[400];
		// 	sprintf(fit_title_words,"Fit exp(%.3fx + %.3f) and %.3f, %.3f ",fitParams[0], fitParams[1], fitParamErrors[0], fitParamErrors[1]);
		// 	hNumObserved->SetTitle(fit_title_words);
		// 	// hNumObserved->GetXaxis()->SetRangeUser(8.6,10.);
		// 	// hNumObserved->GetYaxis()->SetRangeUser(8e1,1e4);
		// 	fit->Draw("same");
		// 	gPad->SetLogy();
		// cRcut->cd(4);
		// 	sprintf( test_title, "data logL: %.2f, P-value: %f", logL, P_value );
		// 	hToy_logL->SetTitle(test_title);
		// 	hToy_logL->Draw();
		// 	hToy_logL->GetYaxis()->SetTitle("Number of Pseudo Experiments");
		// 	hToy_logL->GetXaxis()->SetTitle("-2log(L)");
		// 	gDataLogL->SetLineColor(kRed);
		// 	gDataLogL->Draw("l");
		// 	gPad->SetLogy();
		// cRcut->cd(5);
		// 	h2SNRvsCorr_sim[pol_select]->Draw("colz");
		// 	h2SNRvsCorr_sim[pol_select]->GetXaxis()->SetTitle("Correlation Value");
		// 	h2SNRvsCorr_sim[pol_select]->GetYaxis()->SetTitle("SNR");
		// 	gPad->SetLogz();
		// 	cut_line->Draw("same");
		// 	cut_line->SetLineColor(kRed);
		// cRcut->cd(6);
		// 	gSoverSup->Draw("ALP");
		// 	gSoverSup->GetXaxis()->SetRangeUser(8.,17.);
		// 	gSoverSup->GetYaxis()->SetRangeUser(0.,3e3);
		// 	gSoverSup->GetYaxis()->SetTitle("S/S_up");
		// 	gSoverSup->GetYaxis()->SetTitleOffset(1.8);
		// 	gSoverSup->GetXaxis()->SetTitle("SNR Cut (y-intercept value)");
		// 	optimal_intercept_line->Draw("same");
		// 	optimal_intercept_line->SetLineColor(kRed);
		// 	char sup_plot_words[400];
		// 	sprintf(sup_plot_words,"Peak S/S_up %.2f ",optimal_intercept);
		// 	gSoverSup->SetTitle(sup_plot_words);
		// cRcut->cd(7);
		// 	eff_soft_short_cal_wfrms[pol_select]->Draw("");
		// 	eff_soft_short_cal_wfrms_box[pol_select]->Draw("same");
		// 	eff_soft_short_cal_wfrms_box_surf[pol_select]->Draw("same");
		// 	eff_soft_short_cal_wfrms_box_surf_rcut[pol_select]->Draw("same");
		// 		TLegend *leg = new TLegend(0.5,0.4,0.9,0.2);
		// 		leg->AddEntry(eff_soft_short_cal_wfrms[pol_select],"Cut WFMRS","l");
		// 		leg->AddEntry(eff_soft_short_cal_wfrms_box[pol_select],"+Cut Cal Pulser Reco","l");
		// 		leg->AddEntry(eff_soft_short_cal_wfrms_box_surf[pol_select],"+Cut Surface","l");
		// 		leg->AddEntry(eff_soft_short_cal_wfrms_box_surf_rcut[pol_select],"+Cut Peak/Corr","l");
		// 		leg->Draw();
		// char save_title[400];
		// sprintf(save_title,"%s/optimize/A%d_config%d_Pol%d_Optimization_RCutSlope%.4f.png",plotPath,station,config,pol_select,slope);
		// cRcut->SaveAs(save_title);
	}
}
