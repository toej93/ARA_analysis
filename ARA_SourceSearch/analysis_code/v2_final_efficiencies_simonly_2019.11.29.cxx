////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////	v2_final_efficiencies_simonly.cxx
////
////	Nov 2019
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

	if(argc<2){
		cout<< "Usage\n" << argv[0] << " <1-station> <2-config>"<<endl;;
		return -1;
	}

	int station = atoi(argv[1]);
	int config = atoi(argv[2]);

	double selected_slopes[2];
	double selected_intercepts[2];

	getRCutValues(station, config, 0, selected_slopes[0], selected_intercepts[0]);
	getRCutValues(station, config, 1, selected_slopes[1], selected_intercepts[1]);

	if(station!=2 && station!=3){
		printf("No good! You asked for station %d, but this code only works for stations 2 and 3 \n",station);
		return -1;
	}
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
	// sprintf(the_sims,"/fs/project/PAS0654/ARA_DATA/A23/sim_v2/ValsForCuts/A%d/c%d/E%d/*.root",station,config,580);
	// printf(the_sims,"/fs/project/PAS0654/ARA_DATA/A23/sim_v2/ValsForCuts/A%d/c%d/E%d/*.root\n",station,config,580);
	
	vector<int> energiesToLoopOver;
	for(int i=560; i<=610; i+=5){
	// for(int i=600; i<=610; i+=5){
		cout<<"On i "<<i<<endl;
		energiesToLoopOver.push_back(i);
	}
	for(int i=0; i<energiesToLoopOver.size(); i++){
		sprintf(the_sims,"/fs/project/PAS0654/ARA_DATA/A23/sim_v2/ValsForCuts/A%d/c%d/E%d/*.root",station,config,energiesToLoopOver[i]);
		printf("/fs/project/PAS0654/ARA_DATA/A23/sim_v2/ValsForCuts/A%d/c%d/E%d/*.root\n",station,config,energiesToLoopOver[i]);
		simVTree.Add(the_sims);
		simHTree.Add(the_sims);
		simAllTree.Add(the_sims);
		simFilterTree.Add(the_sims);
	}

	// sprintf(the_sims,"/fs/project/PAS0654/ARA_DATA/A23/sim_v2/ValsForCuts/A%d/c%d/E*/*.root",station,config);
	// simVTree.Add(the_sims);
	// simHTree.Add(the_sims);
	// simAllTree.Add(the_sims);
	// simFilterTree.Add(the_sims);
	int numSimEvents = simVTree.GetEntries();
	printf("Num of sim entries is %d \n", numSimEvents);

	double max=0.05;
	TH2D *h2SNRvsCorr_sim[2]; // SNR on Y axis, Corr on X axis, like in the TB
	h2SNRvsCorr_sim[0]=new TH2D("","V Sim",100,0,max,30,0,30);
	h2SNRvsCorr_sim[1]=new TH2D("","H Sim",100,0,max,30,0,30);

	double num_total_sim=0.;
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

	TH1D *all_events_vsE = new TH1D("","",11,15.75,21.25);
	TH1D *pass_soft_short_cal_wfrms_vsE =  new TH1D("","",11,15.75,21.25);
	TH1D *pass_soft_short_cal_wfrms_box_vsE =  new TH1D("","",11,15.75,21.25);
	TH1D *pass_soft_short_cal_wfrms_box_surf_vsE =  new TH1D("","",11,15.75,21.25);
	TH1D *pass_soft_short_cal_wfrms_box_surf_rcut_vsE = new TH1D("","",11,15.75,21.25);
	TH1D *pass_custom_vsE = new TH1D("","",11,15.75,21.25);


	TH1D *eff_vsE = new TH1D("","",11,15.75,21.25);
	TH1D *eff_soft_short_cal_vsE =  new TH1D("","",11,15.75,21.25);
	TH1D *eff_soft_short_cal_wfrms_vsE =  new TH1D("","",11,15.75,21.25);
	TH1D *eff_soft_short_cal_wfrms_box_vsE =  new TH1D("","",11,15.75,21.25);
	TH1D *eff_soft_short_cal_wfrms_box_surf_vsE =  new TH1D("","",11,15.75,21.25);
	TH1D *eff_soft_short_cal_wfrms_box_surf_rcut_vsE =  new TH1D("","",11,15.75,21.25);
	TH1D *eff_custom_vsE =  new TH1D("","",11,15.75,21.25);


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
							// h2SNRvsCorr_sim[pol]->Fill(corr_val[pol],snr_val[pol],weight); // fill this now, after all cuts
							pass_soft_short_cal_wfrms_box_surf[pol]->Fill(this_SNR,weight);
							if(!failsRcut[pol])
								pass_soft_short_cal_wfrms_box_surf_rcut[pol]->Fill(this_SNR,weight);
						}
					}
				}
			} // loop over pol

			double logE = TMath::Log10(energy);

			// alternative (correct?) way of accounting
			bool pass_this_pol[2];
			pass_this_pol[0]=false;
			pass_this_pol[1]=false;
			for(int pol=0; pol<2; pol++){
				if(!WFRMS[pol] && !failsCWPowerCut[pol]){
					if(!isNewBox && !box300){
						if(!isSurf[0] && !isSurf[1] && !isSurfEvent_top[pol]){
							if(!failsRcut[pol]){
								pass_this_pol[pol]=true;
							}
						}
					}
				}
			}
			if(pass_this_pol[0] || pass_this_pol[1]){
				pass_custom_vsE->Fill(logE,weight);
				// num_pass_total_either+=weight;
			}

			// and now to do efficiencies as a function of energy, which requires, well, not pol-specific SNR information
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
		double pass_custom_this = pass_custom_vsE->GetBinContent(bin);
		if(thrown>0.){
			eff_soft_short_cal_wfrms_vsE->SetBinContent(bin,pass_soft_short_cal_wfrms_this/thrown);
			eff_soft_short_cal_wfrms_box_vsE->SetBinContent(bin,pass_soft_short_cal_wfrms_box_this/thrown);
			eff_soft_short_cal_wfrms_box_surf_vsE->SetBinContent(bin,pass_soft_short_cal_wfrms_box_surf_this/thrown);
			eff_soft_short_cal_wfrms_box_surf_rcut_vsE->SetBinContent(bin,pass_soft_short_cal_wfrms_box_surf_rcut_this/thrown);
			eff_custom_vsE->SetBinContent(bin,pass_custom_this/thrown);
		}
		else{
			eff_soft_short_cal_wfrms_vsE->SetBinContent(bin,0.);
			eff_soft_short_cal_wfrms_box_vsE->SetBinContent(bin,0.);
			eff_soft_short_cal_wfrms_box_surf_vsE->SetBinContent(bin,0.);
			eff_soft_short_cal_wfrms_box_surf_rcut_vsE->SetBinContent(bin,0.);
			eff_custom_vsE->SetBinContent(bin,0.);
		}
	}


	TCanvas *cEff = new TCanvas("eff_vs_snr","eff_vs_snr",2*850,850);
	cEff->Divide(2,1);
	for(int pol=0; pol<2; pol++){
		cEff->cd(pol+1);
		eff_soft_short_cal_wfrms[pol]->Draw("");
		eff_soft_short_cal_wfrms_box[pol]->Draw("same");
		eff_soft_short_cal_wfrms_box_surf[pol]->Draw("same");
		eff_soft_short_cal_wfrms_box_surf_rcut[pol]->Draw("same");

		eff_soft_short_cal_wfrms[pol]->GetXaxis()->SetTitle("3rd Highest Vpeak/RMS");
		eff_soft_short_cal_wfrms[pol]->GetYaxis()->SetTitle("Efficiency (weighted)");

		eff_soft_short_cal_wfrms[pol]->GetYaxis()->SetTitleOffset(1.2);
		eff_soft_short_cal_wfrms[pol]->GetXaxis()->SetTitleOffset(1.2);
		eff_soft_short_cal_wfrms[pol]->GetYaxis()->SetTitleOffset(1.2);
		eff_soft_short_cal_wfrms[pol]->GetZaxis()->SetTitleOffset(1.2);
		eff_soft_short_cal_wfrms[pol]->GetXaxis()->SetTitleSize(0.04);
		eff_soft_short_cal_wfrms[pol]->GetYaxis()->SetTitleSize(0.04);
		eff_soft_short_cal_wfrms[pol]->GetZaxis()->SetTitleSize(0.04);
		eff_soft_short_cal_wfrms[pol]->GetXaxis()->SetLabelSize(0.04);
		eff_soft_short_cal_wfrms[pol]->GetYaxis()->SetLabelSize(0.04);
		eff_soft_short_cal_wfrms[pol]->GetZaxis()->SetLabelSize(0.04);

		if(pol==0)
			eff_soft_short_cal_wfrms[pol]->SetTitle("VPol Efficiency");
		if(pol==1)
			eff_soft_short_cal_wfrms[pol]->SetTitle("HPol Efficiency");		


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
	cEff->cd(1);
	char pretty_title[400];
	sprintf(pretty_title,"/users/PAS0654/osu0673/A23_analysis_new2/results/proposal2019/a%d_c%d_eff_vs_snr.pdf",station,config);
	cEff->SaveAs(pretty_title);


	for(int snrBin=0; snrBin<=eff_soft_short_cal_wfrms_box_surf_rcut[0]->GetNbinsX(); snrBin++){
		double binCenter = eff_soft_short_cal_wfrms_box_surf_rcut[0]->GetBinCenter(snrBin);
		double eff = eff_soft_short_cal_wfrms_box_surf_rcut[0]->GetBinContent(snrBin);
		printf("VPol Efficiency for SNR bin %d with center %.2f is %.2f \n",snrBin,binCenter,eff);
	}


	TCanvas *cEffVsE = new TCanvas("eff_vs_energy","eff_vs_energy",1.1*850,850);
		eff_soft_short_cal_wfrms_vsE->Draw("");
		eff_soft_short_cal_wfrms_box_vsE->Draw("same");
		eff_soft_short_cal_wfrms_box_surf_vsE->Draw("same");
		eff_soft_short_cal_wfrms_box_surf_rcut_vsE->Draw("same");

		eff_soft_short_cal_wfrms_vsE->GetXaxis()->SetTitle("log10(E) [eV]");
		eff_soft_short_cal_wfrms_vsE->GetYaxis()->SetTitle("Efficiency (weighted)");

		eff_soft_short_cal_wfrms_vsE->GetYaxis()->SetTitleOffset(1.2);
		eff_soft_short_cal_wfrms_vsE->GetXaxis()->SetTitleOffset(1.2);
		eff_soft_short_cal_wfrms_vsE->GetYaxis()->SetTitleOffset(1.2);
		eff_soft_short_cal_wfrms_vsE->GetZaxis()->SetTitleOffset(1.2);
		eff_soft_short_cal_wfrms_vsE->GetXaxis()->SetTitleSize(0.04);
		eff_soft_short_cal_wfrms_vsE->GetYaxis()->SetTitleSize(0.04);
		eff_soft_short_cal_wfrms_vsE->GetZaxis()->SetTitleSize(0.04);
		eff_soft_short_cal_wfrms_vsE->GetXaxis()->SetLabelSize(0.04);
		eff_soft_short_cal_wfrms_vsE->GetYaxis()->SetLabelSize(0.04);
		eff_soft_short_cal_wfrms_vsE->GetZaxis()->SetLabelSize(0.04);

		eff_soft_short_cal_wfrms_vsE->SetLineWidth(3.);
		eff_soft_short_cal_wfrms_box_vsE->SetLineWidth(3.);
		eff_soft_short_cal_wfrms_box_surf_vsE->SetLineWidth(3.);
		eff_soft_short_cal_wfrms_box_surf_rcut_vsE->SetLineWidth(3.);
		// leg2->Draw();
	sprintf(pretty_title,"/users/PAS0654/osu0673/A23_analysis_new2/results/proposal2019/a%d_c%d_eff_vs_energy.pdf",station,config);
	cEffVsE->SaveAs(pretty_title);

	for(int eBin=0; eBin<=eff_soft_short_cal_wfrms_box_surf_rcut_vsE->GetNbinsX(); eBin++){
		double binCenter = eff_soft_short_cal_wfrms_box_surf_rcut_vsE->GetBinCenter(eBin);
		double eff = eff_soft_short_cal_wfrms_box_surf_rcut_vsE->GetBinContent(eBin);
		printf("Efficiency for energy bin %d with center %.2f is %.2f \n",eBin,binCenter,eff);
	}

	TCanvas *cEffVsE_custom = new TCanvas("eff_vs_energy_test","eff_vs_energy_test",1.1*850,850);
		eff_custom_vsE->Draw("");

		eff_custom_vsE->GetXaxis()->SetTitle("log10(E) [eV]");
		eff_custom_vsE->GetYaxis()->SetTitle("Efficiency (weighted)");

		eff_custom_vsE->GetYaxis()->SetTitleOffset(1.2);
		eff_custom_vsE->GetXaxis()->SetTitleOffset(1.2);
		eff_custom_vsE->GetYaxis()->SetTitleOffset(1.2);
		eff_custom_vsE->GetZaxis()->SetTitleOffset(1.2);
		eff_custom_vsE->GetXaxis()->SetTitleSize(0.04);
		eff_custom_vsE->GetYaxis()->SetTitleSize(0.04);
		eff_custom_vsE->GetZaxis()->SetTitleSize(0.04);
		eff_custom_vsE->GetXaxis()->SetLabelSize(0.04);
		eff_custom_vsE->GetYaxis()->SetLabelSize(0.04);
		eff_custom_vsE->GetZaxis()->SetLabelSize(0.04);

		eff_custom_vsE->SetLineWidth(3.);
	sprintf(pretty_title,"/users/PAS0654/osu0673/A23_analysis_new2/results/proposal2019/a%d_c%d_eff_vs_energy_test.pdf",station,config);
	cEffVsE_custom->SaveAs(pretty_title);

	for(int eBin=1; eBin<=eff_custom_vsE->GetNbinsX(); eBin++){
		double binCenter = eff_custom_vsE->GetBinCenter(eBin);
		double eff = eff_custom_vsE->GetBinContent(eBin);
		// printf("Test Efficiency for energy bin %d with center %.2f is %.2f \n",eBin,binCenter,eff);
		printf("%.10f\n",eff);
	}


}
