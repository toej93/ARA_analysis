////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////	v2_safety_cuts.cxx 
////	A23 diffuse, how to design vertical and horizontal line cut
////
////	Aug 2019
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
	// sprintf(the_data,"/fs/project/PAS0654/ARA_DATA/A23/10pct/ValsForCuts/A%d/c%d/cutvals_drop_FiltSurface_snrbins_0_0_wfrmsvals_-1.3_-1.4_run_23*.root",station,config);
	sprintf(the_data,"/fs/project/PAS0654/ARA_DATA/A23/10pct/ValsForCuts_UsedInA2FinalOpt/A%d/c%d/cutvals_drop_FiltSurface_snrbins_0_0_wfrmsvals_-1.3_-1.4_run_11*.root",station,config);	
	dataVTree.Add(the_data);
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

		for(int event=0; event<numDataEvents; event++){
			dataVTree.GetEvent(event);
			dataHTree.GetEvent(event);
			dataAllTree.GetEvent(event);
			if(runNum!=currentRunNum){
				// printf("Incrementing bad run number to %d \n",runNum);
				// std::cout<<"*";
				currentRunNum=runNum;
				isThisABadRun = isBadRun(station,runNum, BadRunList);
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
					}// not failing CW power cut?
				}// passes rest of analysis (not WFRMS, box, surface)
			}// loop over polarizations
		}// loop over events
	}

	TChain simVTree("VTree");
	TChain simHTree("HTree");
	TChain simAllTree("AllTree");
	TChain simFilterTree("OutputTree"); // need this for energy distribution
	char the_sims[500];
	// sprintf(the_sims,"/fs/scratch/PAS0654/ara/sim/ValsForCuts/A%d/c%d/E%d/cutvals_drop_snrbins_0_0_wfrmsvals_-1.3_-1.4_run_*.root",station,config,224);
	// sprintf(the_sims,"/fs/project/PAS0654/ARA_DATA/A23/sim/ValsForCuts/A%d/c%d/E%d/cutvals_drop_FiltSurface_snrbins_0_0_wfrmsvals_-1.3_-1.4_run_*.root",station,config,224);
	sprintf(the_sims,"/fs/project/PAS0654/ARA_DATA/A23/sim/ValsForCuts_UsedInA2FinalOpt/A%d/c%d/E%d/cutvals_drop_FiltSurface_snrbins_0_0_wfrmsvals_-1.3_-1.4_run_*.root",station,config,224);
	simVTree.Add(the_sims);
	simHTree.Add(the_sims);
	simAllTree.Add(the_sims);
	simFilterTree.Add(the_sims);
	int numSimEvents = simVTree.GetEntries();
	printf("Num of sim entries is %d \n", numSimEvents);

	TH2D *h2SNRvsCorr_sim[2]; // SNR on Y axis, Corr on X axis, like in the TB
	h2SNRvsCorr_sim[0]=new TH2D("","V Sim",100,0,max,30,0,30);
	h2SNRvsCorr_sim[1]=new TH2D("","H Sim",100,0,max,30,0,30);

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

		double energy;
		simFilterTree.SetBranchAddress("energy",&energy);

		for(int event=0; event<numSimEvents; event++){

			simVTree.GetEvent(event);
			simHTree.GetEvent(event);
			simAllTree.GetEvent(event);
			simFilterTree.GetEvent(event);

			bool failsCWPowerCut[2] = {false};
			bool failsRcut[2] = {false};

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

				// if (this_SNR>29.) this_SNR=29.;
				if(!WFRMS[pol] && !failsCWPowerCut[pol]){
					if(!isNewBox){
						if(!isSurf[0] && !isSurf[1] && !isSurfEvent_top[pol]){
							h2SNRvsCorr_sim[pol]->Fill(corr_val[pol],snr_val[pol],weight); // fill this now, after all cuts

							if(!failsRcut[pol] && corr_val[pol] <= 0.005){
								printf("Warning! Event %d, weight %.4f, with corr %.4f in pol %d is cut unnecessarily by corr cut \n", event, weight, corr_val[pol], pol);
							}
							if(!failsRcut[pol] && snr_val[pol] <= 4.){
								printf("Warning! Event %d, weight %.4f, with snr %.4f in pol %d is cut unnecessarily by snr cut \n", event, weight, snr_val[pol], pol);
							}

						}
					}
				}
			} // loop over pol

		} //loop over sim events
	}

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

	double vert_cuts[2] = {0.005, 0.005};
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

	double horz_cuts[2] = {4., 4.};
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

	vector<TGraph*> horz_lines2;
	for(int pol=0; pol<2; pol++){
		vector <double> x_vals_for_line;
		vector <double> y_vals_for_line;
		for(double x=0; x<0.05; x+=0.01){
			y_vals_for_line.push_back(horz_cuts[pol]);
			x_vals_for_line.push_back(x);
		}
		horz_lines2.push_back(new TGraph(x_vals_for_line.size(), &x_vals_for_line[0], &y_vals_for_line[0]));
	}

	// okay, now save out the 2D histogram
	TCanvas *cSNRvsCorr = new TCanvas("","",2.1*850,2.1*850);
	cSNRvsCorr->Divide(2,2);
	// first, data
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
	// then, sim
	for(int pol=0; pol<2; pol++){
		cSNRvsCorr->cd(pol+3); // because I want the second row for sim theoretically, no need to keept his permanently
		h2SNRvsCorr_sim[pol]->Draw("colz");
		h2SNRvsCorr_sim[pol]->GetYaxis()->SetTitle("3rd Highest VPeak/RMS");
		h2SNRvsCorr_sim[pol]->GetXaxis()->SetTitle("Peak Corr");
		gPad->SetLogz();
		cut_lines[pol]->Draw("same");
		vert_lines[pol]->Draw("same");
		horz_lines2[pol]->Draw("same");
		horz_lines2[pol]->SetLineColor(kBlue);
	}
	char title[300];
	sprintf(title, "%s/A%d_config%d_SafetyCut_SNRvsCorr.png",plotPath,station,config,numTotal);
	cSNRvsCorr->SaveAs(title);
	delete cSNRvsCorr;

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

	// char fit_title_words[2][400];
	// TCanvas *cRcut = new TCanvas("","",6*850,2*850);
	// cRcut->Divide(6,2);
	// for(int pol=0; pol<2; pol++){
	// 	cRcut->cd(pol+1+(pol==0 ? 0 : 5)); // for corr vs snr, data
	// 		h2SNRvsCorr[pol]->Draw("colz");
	// 		h2SNRvsCorr[pol]->GetXaxis()->SetTitle("Correlation Value");
	// 		h2SNRvsCorr[pol]->GetYaxis()->SetTitle("SNR");
	// 		gPad->SetLogz();
	// 		cut_lines[pol]->Draw("same");
	// 		cut_lines[pol]->SetLineColor(kRed);
	// 	cRcut->cd(pol+2+(pol==0 ? 0 : 5)); // for differential distribution, zoom out
	// 		hEventsVsSNR[pol]->Draw("");
	// 		hEventsVsSNR[pol]->GetXaxis()->SetTitle("SNR Cut (y-intercept value)");
	// 		hEventsVsSNR[pol]->GetYaxis()->SetTitle("Number of Events Cut");
	// 		hEventsVsSNR[pol]->SetTitle("Differential Distribution");
	// 		gPad->SetLogy();
	// 	cRcut->cd(pol+3+(pol==0 ? 0 : 5)); // for differential distribution, zoom in
	// 		hNumObserved[pol]->Draw("HIST");
	// 		hNumObserved[pol]->GetXaxis()->SetTitle("SNR Cut (y-intercept value)");
	// 		hNumObserved[pol]->GetYaxis()->SetTitle("Number of Events Cut");
	// 		sprintf(fit_title_words[pol],"Fit exp(%.2fx + %.2f)",fitParams[pol][0], fitParams[pol][1]);
	// 		hNumObserved[pol]->SetTitle(fit_title_words[pol]);
	// 		fit[pol]->Draw("same");
	// 		fit[pol]->SetLineColor(kRed);
	// 		gPad->SetLogy();
	// 	cRcut->cd(pol+4+(pol==0 ? 0 : 5)); // for corr vs snr, sim
	// 		h2SNRvsCorr_sim[pol]->Draw("colz");
	// 		h2SNRvsCorr_sim[pol]->GetXaxis()->SetTitle("Correlation Value");
	// 		h2SNRvsCorr_sim[pol]->GetYaxis()->SetTitle("SNR");
	// 		gPad->SetLogz();
	// 		cut_lines[pol]->Draw("same");
	// 		cut_lines[pol]->SetLineColor(kRed);
	// 	cRcut->cd(pol+5+(pol==0 ? 0 : 5)); // for efficiencies vs snr
	// 		eff_soft_short_cal_wfrms[pol]->Draw("");
	// 		eff_soft_short_cal_wfrms_box[pol]->Draw("same");
	// 		eff_soft_short_cal_wfrms_box_surf[pol]->Draw("same");
	// 		eff_soft_short_cal_wfrms_box_surf_rcut[pol]->Draw("same");

	// 		eff_soft_short_cal_wfrms[pol]->GetXaxis()->SetTitle("3rd Highest Vpeak/RMS");
	// 		eff_soft_short_cal_wfrms[pol]->GetYaxis()->SetTitle("Efficiency (weighted)");

	// 		eff_soft_short_cal_wfrms[pol]->SetLineColor(colors[0]);
	// 		eff_soft_short_cal_wfrms_box[pol]->SetLineColor(colors[1]);
	// 		eff_soft_short_cal_wfrms_box_surf[pol]->SetLineColor(colors[2]);
	// 		eff_soft_short_cal_wfrms_box_surf_rcut[pol]->SetLineColor(colors[3]);

	// 		eff_soft_short_cal_wfrms[pol]->SetLineWidth(2.);
	// 		eff_soft_short_cal_wfrms_box[pol]->SetLineWidth(2.);
	// 		eff_soft_short_cal_wfrms_box_surf[pol]->SetLineWidth(2.);
	// 		eff_soft_short_cal_wfrms_box_surf_rcut[pol]->SetLineWidth(2.);
	// 		if(pol==0){
	// 			TLegend *leg = new TLegend(0.5,0.4,0.9,0.2);
	// 			leg->AddEntry(eff_soft_short_cal_wfrms[pol],"Cut WFMRS","l");
	// 			leg->AddEntry(eff_soft_short_cal_wfrms_box[pol],"+Cut Cal Pulser Reco","l");
	// 			leg->AddEntry(eff_soft_short_cal_wfrms_box_surf[pol],"+Cut Surf & Top Surf","l");
	// 			leg->AddEntry(eff_soft_short_cal_wfrms_box_surf_rcut[pol],"+Cut Peak/Corr","l");
	// 			leg->Draw();
	// 		}
	// }
	// cRcut->cd(6);
	// // last, but no least, add efficiency vs energy
	// eff_soft_short_cal_wfrms_vsE->Draw("");
	// eff_soft_short_cal_wfrms_box_vsE->Draw("same");
	// eff_soft_short_cal_wfrms_box_surf_vsE->Draw("same");
	// eff_soft_short_cal_wfrms_box_surf_rcut_vsE->Draw("same");

	// eff_soft_short_cal_wfrms_vsE->GetXaxis()->SetTitle("log10(E) [eV]");
	// eff_soft_short_cal_wfrms_vsE->GetYaxis()->SetTitle("Efficiency (weighted)");

	// eff_soft_short_cal_wfrms_vsE->SetLineColor(colors[0]);
	// eff_soft_short_cal_wfrms_box_vsE->SetLineColor(colors[1]);
	// eff_soft_short_cal_wfrms_box_surf_vsE->SetLineColor(colors[2]);
	// eff_soft_short_cal_wfrms_box_surf_rcut_vsE->SetLineColor(colors[3]);

	// eff_soft_short_cal_wfrms_vsE->SetLineWidth(2.);
	// eff_soft_short_cal_wfrms_box_vsE->SetLineWidth(2.);
	// eff_soft_short_cal_wfrms_box_surf_vsE->SetLineWidth(2.);
	// eff_soft_short_cal_wfrms_box_surf_rcut_vsE->SetLineWidth(2.);
	// TLegend *leg2 = new TLegend(0.5,0.4,0.9,0.2);
	// leg2->AddEntry(eff_soft_short_cal_wfrms_vsE,"Cut WFMRS","l");
	// leg2->AddEntry(eff_soft_short_cal_wfrms_box_vsE,"+Cut Cal Pulser Reco","l");
	// leg2->AddEntry(eff_soft_short_cal_wfrms_box_surf_vsE,"+Cut Surf & Top Surf","l");
	// leg2->AddEntry(eff_soft_short_cal_wfrms_box_surf_rcut_vsE,"+Cut Peak/Corr","l");
	// leg2->Draw();

	// char save_title[400];
	// sprintf(save_title,"%s/optimize/A%d_config%d_Final_VSlope_%.2f_HSlope_%.2f_VInt_%.2f_Hint_%.2f.png",
	// 					plotPath,
	// 					station,
	// 					config,
	// 					selected_slopes[0],
	// 					selected_slopes[1],
	// 					selected_intercepts[0],
	// 					selected_intercepts[1]);
	// cRcut->SaveAs(save_title);

}
