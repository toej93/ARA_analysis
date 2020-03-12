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
#include "tools_Cuts.h"

using namespace std;

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
		cout<< "Usage\n" << argv[0] << " <isSim> <station> <config> <year_or_energy> <ValForCuts filename>"<<endl;;
		return -1;
	}

	int isSim = atoi(argv[1]);
	int station = atoi(argv[2]);
	int config = atoi(argv[3]);
	double year_or_energy = double(atof(argv[4]));

	if(station!=2 && station!=3){
		printf("No good! You asked for station %d, but this code only works for stations 2 and 3 \n",station);
		return -1;
	}

	// double max=1.;
	double max=0.05;

	TH2D *PeakCorr_vs_SNR_all[2];
	PeakCorr_vs_SNR_all[0]=new TH2D("","V",100,0,max,300,0,30);
	PeakCorr_vs_SNR_all[1]=new TH2D("","H",100,0,max,300,0,30);

	TH2D *PeakCorr_vs_SNR_cutCal[2];
	PeakCorr_vs_SNR_cutCal[0]=new TH2D("","V",100,0,max,300,0,30);
	PeakCorr_vs_SNR_cutCal[1]=new TH2D("","H",100,0,max,300,0,30);

	TH2D *PeakCorr_vs_SNR_cutCal_cutSoft[2];
	PeakCorr_vs_SNR_cutCal_cutSoft[0]=new TH2D("","V",100,0,max,300,0,30);
	PeakCorr_vs_SNR_cutCal_cutSoft[1]=new TH2D("","H",100,0,max,300,0,30);

	TH2D *PeakCorr_vs_SNR_cutCal_cutSoft_cutShort[2];
	PeakCorr_vs_SNR_cutCal_cutSoft_cutShort[0]=new TH2D("","V",100,0,max,300,0,30);
	PeakCorr_vs_SNR_cutCal_cutSoft_cutShort[1]=new TH2D("","H",100,0,max,300,0,30);

	TH2D *PeakCorr_vs_SNR_cutCal_cutSoft_cutShort_cutWRMS[2];
	PeakCorr_vs_SNR_cutCal_cutSoft_cutShort_cutWRMS[0]=new TH2D("","V",100,0,max,300,0,30);
	PeakCorr_vs_SNR_cutCal_cutSoft_cutShort_cutWRMS[1]=new TH2D("","H",100,0,max,300,0,30);

	TH2D *PeakCorr_vs_SNR_cutCal_cutSoft_cutShort_cutWRMS_cutBox[2];
	PeakCorr_vs_SNR_cutCal_cutSoft_cutShort_cutWRMS_cutBox[0]=new TH2D("","V",100,0,max,300,0,30);
	PeakCorr_vs_SNR_cutCal_cutSoft_cutShort_cutWRMS_cutBox[1]=new TH2D("","H",100,0,max,300,0,30);

	TH2D *PeakCorr_vs_SNR_cutCal_cutSoft_cutShort_cutWRMS_cutBox_cutSurf[2];
	PeakCorr_vs_SNR_cutCal_cutSoft_cutShort_cutWRMS_cutBox_cutSurf[0]=new TH2D("","V",100,0,max,300,0,30);
	PeakCorr_vs_SNR_cutCal_cutSoft_cutShort_cutWRMS_cutBox_cutSurf[1]=new TH2D("","H",100,0,max,300,0,30);

	TH1D *all_events[2];
	TH1D *pass_soft_short_cal[2];
	TH1D *pass_soft_short_cal_wfrms[2];
	TH1D *pass_soft_short_cal_wfrms_box[2];
	TH1D *pass_soft_short_cal_wfrms_box_surf[2];

	TH1D *eff[2];
	TH1D *eff_soft_short_cal[2];
	TH1D *eff_soft_short_cal_wfrms[2];
	TH1D *eff_soft_short_cal_wfrms_box[2];
	TH1D *eff_soft_short_cal_wfrms_box_surf[2];


	for(int i=0; i<2; i++){
		all_events[i] = new TH1D("","",30,0,30);
		pass_soft_short_cal[i] = new TH1D("","",30,0,30);
		pass_soft_short_cal_wfrms[i] = new TH1D("","",30,0,30);
		pass_soft_short_cal_wfrms_box[i] = new TH1D("","",30,0,30);
		pass_soft_short_cal_wfrms_box_surf[i] = new TH1D("","",30,0,30);

		eff_soft_short_cal[i] = new TH1D("","",30,0,30);
		eff_soft_short_cal_wfrms[i] = new TH1D("","",30,0,30);
		eff_soft_short_cal_wfrms_box[i] = new TH1D("","",30,0,30);
		eff_soft_short_cal_wfrms_box_surf[i] = new TH1D("","",30,0,30);
	}

	TH1D *fracs_power_cut[2];
	fracs_power_cut[0]=new TH1D("","V",100,0,1);
	fracs_power_cut[1]=new TH1D("","H",100,0,1);

	vector<int> BadRunList=BuildBadRunList(station);

	bool version2=false;
	/*
	if(version2){
		double num_total=0.;

		// cuts applying to all events
		double remove_bad_runs_and_livetime=0.;
		double and_remove_soft=0.;
		double and_remove_short_and_glitch=0.;
		double and_remove_tagged_cal=0.;

		double fails_WFRMS_first[2]={0.,0.};
		double fails_box_first[2]={0.,0.};
		double fails_surface_first[2]={0.,0.};

		double fails_WFRMS_last[2]={0.,0.};
		double fails_box_last[2]={0.,0.};
		double fails_surface_last[2]={0.,0.};

		double fails_WFRMS_insequence[2]={0.,0.};
		double fails_box_insequence[2]={0.,0.};
		double fails_surface_insequence[2]={0.,0.};

		for(int file_num=5; file_num<argc; file_num++){

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
			printf("File %d: run %d \n", file_num, runNum);

			TTree *trees[3];
			trees[0] = (TTree*) inputFile->Get("VTree");
			trees[1] = (TTree*) inputFile->Get("HTree");
			trees[2] = (TTree*) inputFile->Get("AllTree");

			double corr_val[2];
			double snr_val[2];
			int WFRMS[2];
			double frac_of_power_notched_V[8];
			double frac_of_power_notched_H[8];
			int Refilt[2];

			trees[0]->SetBranchAddress("corr_val_V",&corr_val[0]);
			trees[0]->SetBranchAddress("snr_val_V",&snr_val[0]);
			trees[0]->SetBranchAddress("wfrms_val_V",&WFRMS[0]);
			trees[0]->SetBranchAddress("Refilt_V",&Refilt[0]);
			trees[1]->SetBranchAddress("corr_val_H",&corr_val[1]);
			trees[1]->SetBranchAddress("snr_val_H",&snr_val[1]);
			trees[1]->SetBranchAddress("wfrms_val_H",&WFRMS[1]);
			trees[1]->SetBranchAddress("Refilt_H",&Refilt[1]);

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
			trees[2]->SetBranchAddress("surf_V",&isSurf[0]);
			trees[2]->SetBranchAddress("surf_H",&isSurf[1]);
			trees[2]->SetBranchAddress("bad",&isBadEvent);
			trees[2]->SetBranchAddress("weight",&weight);
			trees[2]->SetBranchAddress("surf_top_V",&isSurfEvent_top[0]);
			trees[2]->SetBranchAddress("surf_top_H",&isSurfEvent_top[1]);
			trees[2]->SetBranchAddress("unixTime",&unixTime);
			trees[2]->SetBranchAddress("isFirstFiveEvent",&isFirstFiveEvent);
			trees[2]->SetBranchAddress("hasBadSpareChanIssue",&hasBadSpareChanIssue);

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

			if(isBadRun(station,runNum,BadRunList) && !isSim){
				continue;
			}

			//now to loop over events
			for(int event=0; event<trees[0]->GetEntries(); event++){

				trees[0]->GetEvent(event);
				trees[1]->GetEvent(event);
				trees[2]->GetEvent(event);

				num_total+=weight;

				if(isBadLivetime(station,unixTime) && !isSim){
					continue;
				}
				remove_bad_runs_and_livetime+=weight;

				if(isSoft){
					continue;
				}
				and_remove_soft+=weight;

				if(
					(isBadEvent
					|| isFirstFiveEvent
					|| hasBadSpareChanIssue
					|| isShort)
					&& !isSim
					){
					continue;
				}
				and_remove_short_and_glitch+=weight;

				if(isCal){
					continue;
				}
				and_remove_tagged_cal+=weight;

				//okay, now the "as first cut", "as last cut" and "in sequence" matters

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

					// "as first cut"
						// fail WFRMS first?
						if(WFRMS[pol] || failsCWPowerCut){
							fails_WFRMS_first[pol]+=weight;
						}
						// fail box first?
						if(isNewBox){
							fails_box_first[pol]+=weight;
						}
						// fail surface first?
						if(isSurf[0] || isSurf[1] || isSurfEvent_top[pol]){
							fails_surface_first[pol]+=weight;
						}


					// "as last cut"
						// fails as last cut with surface?
						// survives WFRMS and box, but doesn't survive surface
						if(!WFRMS[pol] && !failsCWPowerCut && !isNewBox){
							if(isSurf[0] || isSurf[1] || isSurfEvent_top[pol]){
								fails_surface_last[pol]+=weight;
							}
						}
						// fails as last cut with WFRMS?
						// survives box and surface, but doesn't survive WFRMS
						if(!isNewBox && !isSurf[0] && !isSurf[1] && !isSurfEvent_top[pol]){
							if(WFRMS[pol] || failsCWPowerCut){
								fails_WFRMS_last[pol]+=weight;
							}
						}
						// fails as last cut with box?
						// survives surface and WFRMS, but not the box
						if(!isSurf[0] && !isSurf[1] && !isSurfEvent_top[pol] && !WFRMS[pol] && !failsCWPowerCut){
							if(isNewBox){
								fails_box_last[pol]+=weight;
							}
						}

					// "in sequence"
						// fails WFRMS first? (same as "as first" for this cut only)
						if(WFRMS[pol] || failsCWPowerCut){
							fails_WFRMS_insequence[pol]+=weight;
						}
						// passes WFRMS, but fails box
						if(!WFRMS[pol] && !failsCWPowerCut && isNewBox){
							fails_box_insequence[pol]+=weight;
						}
						// passes WFRMS and box, but fails surface
						if(!WFRMS[pol] && !failsCWPowerCut && !isNewBox && !isSurf[0] && !isSurf[1] && !isSurfEvent_top[pol]){
							fails_surface_insequence[pol]+=weight;
						}
					// yes, orphan tab for organization
				}
			}
			inputFile->Close();
			delete inputFile;
		}

		printf("Num total          :           %7.1f\n",num_total);
		printf("Livetime           :           %7.1f\n",remove_bad_runs_and_livetime);
		printf("Soft Trig          :           %7.1f\n",and_remove_soft);
		printf("Short and Glitch   :           %7.1f\n",and_remove_short_and_glitch);
		printf("Tagged Cal         :           %7.1f\n",and_remove_tagged_cal);
		printf("------------------------------------------\n");
		printf("WFRMS              :           %7.1f, %7.1f, %7.1f | %7.1f, %7.1f, %7.1f \n",fails_WFRMS_first[0],fails_WFRMS_insequence[0],fails_WFRMS_last[0],fails_WFRMS_first[1],fails_WFRMS_insequence[1],fails_WFRMS_last[1]);
		printf("Box                :           %7.1f, %7.1f, %7.1f | %7.1f, %7.1f, %7.1f \n",fails_box_first[0],fails_box_insequence[0],fails_box_last[0],fails_box_first[1],fails_box_insequence[1],fails_box_last[1]);
		printf("Surf               :           %7.1f, %7.1f, %7.1f | %7.1f, %7.1f, %7.1f \n",fails_surface_first[0],fails_surface_insequence[0],fails_surface_last[0],fails_surface_first[1],fails_surface_insequence[1],fails_surface_last[1]);
	}
	*/

	bool version1=true;
	if(version1){

		double num_total=0.;
		double num_tag_cal=0.;
		double num_soft=0.;
		double num_short=0.;
		double num_box=0.;
		double num_glitch=0.;
		double num_pass_either=0.; //sim only

		double num_surf_org[2]={0., 0.};
		double num_surf_new[2]={0., 0.};
		double num_surf_top[2]={0., 0.};
		double num_filtered[2] = {0., 0.};
		double num_surf_either=0.;

		for(int file_num=5; file_num<argc; file_num++){

			string chRun = "run";
			string file = string(argv[file_num]);
			size_t foundRun = file.find(chRun);
			string strRunNum = file.substr(foundRun+4,4);
			int runNum = atoi(strRunNum.c_str());

			// if(isBadRun(station,runNum,BadRunList) || runNum==3437){
			if(isBadRun(station,runNum,BadRunList) && !isSim){
				continue;
			}

			TFile *inputFile = TFile::Open(argv[file_num]);
			if(!inputFile){
				cout<<"Can't open val for cuts file!"<<endl;
				return -1;
			}
			printf("File %d: run %d \n", file_num, runNum);

			TTree *trees[4];
			trees[0] = (TTree*) inputFile->Get("VTree");
			trees[1] = (TTree*) inputFile->Get("HTree");
			trees[2] = (TTree*) inputFile->Get("AllTree");
			trees[3] = (TTree*) inputFile->Get("OutputTree");

			bool original_error;
			trees[3]->SetBranchAddress("hasDigitizerError",&original_error);

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

			double corr_val_new[2];
			double snr_val_new[2];
			int WFRMS_new[2];
			int theta_300_new[2];
			int phi_300_new[2];
			int theta_41_new[2];
			int phi_41_new[2];

			trees[0]->SetBranchAddress("corr_val_V_new",&corr_val_new[0]);
			trees[0]->SetBranchAddress("snr_val_V_new",&snr_val_new[0]);
			trees[0]->SetBranchAddress("wfrms_val_V_new",&WFRMS_new[0]);
			trees[0]->SetBranchAddress("theta_300_V_new",&theta_300_new[0]);
			trees[0]->SetBranchAddress("theta_41_V_new",&theta_41_new[0]);
			trees[0]->SetBranchAddress("phi_300_V_new",&phi_300_new[0]);
			trees[0]->SetBranchAddress("phi_41_V_new",&phi_41_new[0]);

			trees[1]->SetBranchAddress("corr_val_H_new",&corr_val_new[1]);
			trees[1]->SetBranchAddress("snr_val_H_new",&snr_val_new[1]);
			trees[1]->SetBranchAddress("wfrms_val_H_new",&WFRMS_new[1]);
			trees[1]->SetBranchAddress("theta_300_H_new",&theta_300_new[1]);
			trees[1]->SetBranchAddress("theta_41_H_new",&theta_41_new[1]);
			trees[1]->SetBranchAddress("phi_300_H_new",&phi_300_new[1]);
			trees[1]->SetBranchAddress("phi_41_H_new",&phi_41_new[1]);

			int Refilt[2];
			trees[0]->SetBranchAddress("Refilt_V",&Refilt[0]);
			trees[1]->SetBranchAddress("Refilt_H",&Refilt[1]);

			double frac_of_power_notched_V[8];
			double frac_of_power_notched_H[8];

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

			int isCal;
			int isSoft;
			int isShort;
			int isCW;
			int isNewBox;
			int isSurfEvent_org_out[2]; // originally a surf event?
			int isSurfEvent_new_out[2]; // a surface event after filtering?
			int isSurfEvent_top[2]; // a top event?

			trees[2]->SetBranchAddress("cal",&isCal);
			trees[2]->SetBranchAddress("soft",&isSoft);
			trees[2]->SetBranchAddress("short",&isShort);
			trees[2]->SetBranchAddress("CW",&isCW);
			trees[2]->SetBranchAddress("box",&isNewBox);
			trees[2]->SetBranchAddress("surf_V_org",&isSurfEvent_org_out[0]);
			trees[2]->SetBranchAddress("surf_H_org",&isSurfEvent_org_out[1]);
			trees[2]->SetBranchAddress("surf_V_new",&isSurfEvent_new_out[0]);
			trees[2]->SetBranchAddress("surf_H_new",&isSurfEvent_new_out[1]);
			trees[2]->SetBranchAddress("surf_top_V",&isSurfEvent_top[0]);
			trees[2]->SetBranchAddress("surf_top_H",&isSurfEvent_top[1]);

			int isBadEvent;
			double weight;
			int unixTime;
			int hasBadSpareChanIssue;
			int hasBadSpareChanIssue2;
			int isFirstFiveEvent;
			int eventNumber;

			trees[2]->SetBranchAddress("bad",&isBadEvent);
			trees[2]->SetBranchAddress("weight",&weight);
			trees[2]->SetBranchAddress("unixTime",&unixTime);
			trees[2]->SetBranchAddress("isFirstFiveEvent",&isFirstFiveEvent);
			trees[2]->SetBranchAddress("hasBadSpareChanIssue",&hasBadSpareChanIssue);
			trees[2]->SetBranchAddress("hasBadSpareChanIssue2",&hasBadSpareChanIssue2);
			trees[2]->SetBranchAddress("eventNumber",&eventNumber);

			int numEntries = trees[0]->GetEntries();
			// numEntries=100;

			//now to loop over events
			for(int event=0; event<numEntries; event++){
				trees[0]->GetEvent(event);
				trees[1]->GetEvent(event);
				trees[2]->GetEvent(event);
				trees[3]->GetEvent(event);

				num_total+=weight;

				if(isBadLivetime(station,unixTime)){
					continue;
				}

				// now to do some accounting

				if(!isSim){
					if(isBadEvent || isFirstFiveEvent || hasBadSpareChanIssue || hasBadSpareChanIssue2){
						num_glitch+=weight;
						continue;
					}
				}

				if(isCal)
					num_tag_cal+=weight;
				if(isSoft)
					num_soft+=weight;
				if(isNewBox)
					num_box+=weight;
				for(int pol=0; pol<2; pol++){
					if(isSurfEvent_org_out[pol])
						num_surf_org[pol]+=weight;
					if(isSurfEvent_new_out[pol])
						num_surf_new[pol]+=weight;
					if(isSurfEvent_top[pol])
						num_surf_top[pol]+=weight;
				}

				if(snr_val_new[0]>=29.) snr_val_new[0]=29.;
				if(snr_val_new[1]>=29.) snr_val_new[1]=29.;

				/*
				if(isSim){
					bool this_pass[2]={false};
					for(int pol=0; pol<2; pol++){
						all_events[pol]->Fill(snr_val[pol],weight);
						if(!isCal && !isSoft && !isShort){
							pass_soft_short_cal[pol]->Fill(snr_val[pol],weight);
							if(!WFRMS[pol]){
								pass_soft_short_cal_wfrms[pol]->Fill(snr_val[pol],weight);
								if(!isNewBox){
									pass_soft_short_cal_wfrms_box[pol]->Fill(snr_val[pol],weight);
									if((!isSurf[0] && !isSurf[1]) && !isSurfEvent_top[pol]){
									// if((!isSurf[pol]) && !isSurfEvent_top[pol]){
										pass_soft_short_cal_wfrms_box_surf[pol]->Fill(snr_val[pol],weight);
										num_pass_pol[pol]+=weight;
										this_pass[pol]=true;
									}
								}
							}
						}
					}
					if(this_pass[0] || this_pass[1])
						num_pass_either+=weight;
				}
				*/

				for(int pol=0; pol<2; pol++){

					// if(pol==0)
					// 	printf("Event %d, pol %d: cal %d, soft %d, short %d, WFRMS %d, box %d, surf 0 %d (%3d), surf 1 %d (%3d), surf top %d, refilt %d\n", event, pol, isCal, isSoft, isShort, WFRMS_new[pol], isNewBox, isSurfEvent_new_out[0], theta_300_new[0], isSurfEvent_new_out[1], theta_300_new[1], isSurfEvent_top[pol], Refilt[pol]);

					PeakCorr_vs_SNR_all[pol]->Fill(corr_val_new[pol],snr_val_new[pol],weight);

					if(!isCal){ //cut cal pulsers
						PeakCorr_vs_SNR_cutCal[pol]->Fill(corr_val_new[pol],snr_val_new[pol],weight);

						if(!isSoft){ //cut software triggers
							PeakCorr_vs_SNR_cutCal_cutSoft[pol]->Fill(corr_val_new[pol],snr_val_new[pol],weight);

							if(!isShort){ //cut short
								PeakCorr_vs_SNR_cutCal_cutSoft_cutShort[pol]->Fill(corr_val_new[pol],snr_val_new[pol],weight);

								if(!WFRMS_new[pol]){ //cut WRMS
									PeakCorr_vs_SNR_cutCal_cutSoft_cutShort_cutWRMS[pol]->Fill(corr_val_new[pol],snr_val_new[pol],weight);

									if(!isNewBox){ //cut cal box
										PeakCorr_vs_SNR_cutCal_cutSoft_cutShort_cutWRMS_cutBox[pol]->Fill(corr_val_new[pol],snr_val_new[pol],weight);

										// if((!isSurf[pol]) && !isSurfEvent_top[pol]){
										if((!isSurfEvent_new_out[0] && !isSurfEvent_new_out[1]) && !isSurfEvent_top[pol]){

											if(Refilt[pol]){
												num_filtered[pol]++;

												vector<double> frac;
												for(int i=0; i<8; i++){
													if(pol==0) frac.push_back(frac_of_power_notched_V[i]);
													else if(pol==1) frac.push_back(frac_of_power_notched_H[i]);
												}
												sort(frac.begin(), frac.end(), std::greater<double>());
												fracs_power_cut[pol]->Fill(frac[2]);
												// if(frac[2]>0.06)
												// 	printf("This event had lots of power cut!\n");
												// if(frac[2]<=0.06){
												// 	PeakCorr_vs_SNR_cutCal_cutSoft_cutShort_cutWRMS_cutBox_cutSurf[pol]->Fill(corr_val_new[pol],snr_val_new[pol],weight);
												// }

												/*
												if(corr_val_new[pol]>0.04){
													printf("Run %d, event %d, unixTime %d \n", runNum, event, unixTime);
												}
												*/

											} //refiltered?
											else{
												PeakCorr_vs_SNR_cutCal_cutSoft_cutShort_cutWRMS_cutBox_cutSurf[pol]->Fill(corr_val_new[pol],snr_val_new[pol],weight);

												// if(pol==0)
												  // printf("Event %d, pol %d: SNR %.3f, Corr %.5f\n",event,pol,corr_val_new[pol],snr_val_new[pol]);
												/*
												if(corr_val_new[pol]>0.04){
													printf("Run %d, event %d, unixTime %d and qual flag is %d but original error is %d \n", runNum, event, unixTime, isBadEvent, original_error);
												}
												*/
											}
										}
									}
								}
							}
						}
					}
				}
			}
			inputFile->Close();
			delete inputFile;
		}
		// cout<<"Num total is "<<num_total<<endl;
		// cout<<"Num in final plot "<<num_in_final_plot<<endl;
		// cout<<"Num re-filtered in vpol is "<<num_refilt[0]<<" and in hpol is "<<num_refilt[1]<<endl;

		// printf("Num cal is %d -- %.2f %\n", num_cal, double(num_cal)/double(num_total)*100.);
		// printf("Num box is %d -- %.2f %\n", num_box, double(num_box)/double(num_total)*100.);
		// printf("Num soft is %d -- %.2f %\n", num_soft, double(num_soft)/double(num_total)*100.);
		// printf("Num short is %d -- %.2f %\n", num_short, double(num_short)/double(num_total)*100.);
		// printf("Num surf is %d and %d -- %.2f %\n", num_surf_new[0], double(num_surf)/double(num_total)*100.);

		gStyle->SetOptStat(1);
		gStyle->SetStatY(0.9);
		gStyle->SetStatX(0.9);
		gStyle->SetStatW(0.2);
		gStyle->SetStatH(0.2);

		int colors [28] = { kBlue, kRed, kGreen, kMagenta, kCyan};

		/*
		if(isSim){
			for(int pol=0; pol<2; pol++){
				for(int bin=0; bin<=all_events[pol]->GetNbinsX(); bin++){
					double thrown = all_events[pol]->GetBinContent(bin);
					double pass_soft_short_cal_this = pass_soft_short_cal[pol]->GetBinContent(bin);
					double pass_soft_short_cal_wfrms_this = pass_soft_short_cal_wfrms[pol]->GetBinContent(bin);
					double pass_soft_short_cal_wfrms_box_this = pass_soft_short_cal_wfrms_box[pol]->GetBinContent(bin);
					double pass_soft_short_cal_wfrms_box_surf_this = pass_soft_short_cal_wfrms_box_surf[pol]->GetBinContent(bin);
					if(thrown>0.){
						eff_soft_short_cal[pol]->SetBinContent(bin,pass_soft_short_cal_this/thrown);
						eff_soft_short_cal_wfrms[pol]->SetBinContent(bin,pass_soft_short_cal_wfrms_this/thrown);
						eff_soft_short_cal_wfrms_box[pol]->SetBinContent(bin,pass_soft_short_cal_wfrms_box_this/thrown);
						eff_soft_short_cal_wfrms_box_surf[pol]->SetBinContent(bin,pass_soft_short_cal_wfrms_box_surf_this/thrown);
					}
					else{
						eff_soft_short_cal[pol]->SetBinContent(bin,0.);
						eff_soft_short_cal_wfrms[pol]->SetBinContent(bin,0.);
						eff_soft_short_cal_wfrms_box[pol]->SetBinContent(bin,0.);
						eff_soft_short_cal_wfrms_box_surf[pol]->SetBinContent(bin,0.);
					}
				}
			}

			TCanvas *c2 = new TCanvas("","",1100,850);
			c2->Divide(2,2);
			for(int pol=0; pol<2; pol++){

				if(pol==0){
					all_events[pol]->SetTitle("Events Passing Cuts VPol");
					eff_soft_short_cal[pol]->SetTitle("Efficiency VPol");
				}

				if(pol==1){
					all_events[pol]->SetTitle("Events Passing Cuts HPol");
					eff_soft_short_cal[pol]->SetTitle("Efficiency HPol");
				}
				all_events[pol]->GetXaxis()->SetTitle("3rd Highest Vpeak/RMS");
				all_events[pol]->GetYaxis()->SetTitle("Events (weighted)");
				eff_soft_short_cal[pol]->GetXaxis()->SetTitle("3rd Highest Vpeak/RMS");
				eff_soft_short_cal[pol]->GetYaxis()->SetTitle("Events (weighted)");

				c2->cd(pol+1);
					all_events[pol]->Draw("");
					all_events[pol]->GetYaxis()->SetRangeUser(1,3e3);
					gPad->SetLogy();
					pass_soft_short_cal[pol]->Draw("same");
					pass_soft_short_cal_wfrms[pol]->Draw("same");
					pass_soft_short_cal_wfrms_box[pol]->Draw("same");
					pass_soft_short_cal_wfrms_box_surf[pol]->Draw("same");
					pass_soft_short_cal[pol]->SetLineColor(colors[0]);
					pass_soft_short_cal_wfrms[pol]->SetLineColor(colors[1]);
					pass_soft_short_cal_wfrms_box[pol]->SetLineColor(colors[2]);
					pass_soft_short_cal_wfrms_box_surf[pol]->SetLineColor(colors[3]);
					pass_soft_short_cal[pol]->SetLineWidth(2.);
					pass_soft_short_cal_wfrms[pol]->SetLineWidth(2.);
					pass_soft_short_cal_wfrms_box[pol]->SetLineWidth(2.);
					pass_soft_short_cal_wfrms_box_surf[pol]->SetLineWidth(2.);

					if(pol+1==1){
						TLegend *leg = new TLegend(0.48,0.6,0.9,0.9);
						leg->AddEntry(all_events[pol],"All Events","l");
						leg->AddEntry(pass_soft_short_cal[pol],"Cut Soft, Short, and Tagged Cal","l");
						leg->AddEntry(pass_soft_short_cal_wfrms[pol],"+Cut WFMRS","l");
						leg->AddEntry(pass_soft_short_cal_wfrms_box[pol],"+Cut Cal Pulser Reco","l");
						leg->AddEntry(pass_soft_short_cal_wfrms_box_surf[pol],"+Cut Surface","l");
						leg->Draw();
					}

				c2->cd(pol+3);
					eff_soft_short_cal[pol]->Draw("");
					eff_soft_short_cal_wfrms[pol]->Draw("same");
					eff_soft_short_cal_wfrms_box[pol]->Draw("same");
					eff_soft_short_cal_wfrms_box_surf[pol]->Draw("same");
					eff_soft_short_cal[pol]->SetLineColor(colors[0]);
					eff_soft_short_cal_wfrms[pol]->SetLineColor(colors[1]);
					eff_soft_short_cal_wfrms_box[pol]->SetLineColor(colors[2]);
					eff_soft_short_cal_wfrms_box_surf[pol]->SetLineColor(colors[3]);
					eff_soft_short_cal[pol]->SetLineWidth(2.);
					eff_soft_short_cal_wfrms[pol]->SetLineWidth(2.);
					eff_soft_short_cal_wfrms_box[pol]->SetLineWidth(2.);
					eff_soft_short_cal_wfrms_box_surf[pol]->SetLineWidth(2.);
			}

			char efficiency_title[400];
			sprintf(efficiency_title,
					 "%s/%d.%d.%d_A%d_c%d_E%2.1f_%dEvents_Efficiency.png",plotPath,year_now, month_now, day_now,station,config,year_or_energy,num_total);
			c2->SaveAs(efficiency_title);
			delete c2;
		}

		if(isSim){
			for(int pol=0; pol<2; pol++){
				printf("Eff on pol %d is %.3f/%.3f = %.3f \n", pol, num_pass_pol[pol], num_total_trig,num_pass_pol[pol]/num_total_trig);
			}
		}
		printf("Eff on both pols combined is %.3f / %.3f = %.3f \n", num_pass_either, num_total_trig, num_pass_either/num_total_trig);
		*/

		//save out SNR vs WavefrontRMS plot
		char graph_title[2][300];
		char title[300];

		int cal=0;
		int soft=0;
		int Short=0;
		int wrms=0;
		int box = 0;
		int surf=0;
		int cw=0;

		// gStyle->SetOptStat(1111111);
		gStyle->SetOptStat(1);
		gStyle->SetOptStat(0);

		//save out the Corr vs SNR plot for all
		sprintf(graph_title[0],"VPol: cal %d, soft %d ,short %d , wrms  %d , box %d , surf %d, cw %d",cal,soft,Short,wrms,box,surf,cw);
		sprintf(graph_title[1],"HPol: cal %d, soft %d ,short %d , wrms  %d , box %d , surf %d, cw %d",cal,soft,Short,wrms,box,surf,cw);
		TCanvas *c2 = new TCanvas("","",2.1*850,850);
		c2->Divide(2,1);
		for(int pol=0; pol<2; pol++){
			c2->cd(pol+1);
			PeakCorr_vs_SNR_all[pol]->Draw("colz");

			PeakCorr_vs_SNR_all[pol]->GetYaxis()->SetTitle("Peak Correlation Value");
			PeakCorr_vs_SNR_all[pol]->GetXaxis()->SetTitle("3rd Highest VPeak/RMS");
			PeakCorr_vs_SNR_all[pol]->SetTitle(graph_title[pol]);
			gPad->SetLogz();
		}
		if(isSim)
			sprintf(title, "%s/%d.%d.%d_A%d_c%d_E%2.1f_%dEvents_Correlation_vs_SNR_cal%dF_soft%d_short%d_wrms%d_newbox%d_surf%d.png",plotPath,year_now, month_now, day_now,station,config,year_or_energy, int(num_total),cal,soft,Short,wrms,box,surf);
		else
			sprintf(title, "%s/%d.%d.%d_A%d_c%d_%dEvents_Correlation_vs_SNR_cal%dF_soft%d_short%d_wrms%d_newbox%d_surf%d.png",plotPath,year_now, month_now, day_now,station,config,int(num_total),cal,soft,Short,wrms,box,surf);
		c2->SaveAs(title);
		delete c2;
		delete PeakCorr_vs_SNR_all[0]; delete PeakCorr_vs_SNR_all[1];

		//turn on cal
		cal=1;
		sprintf(graph_title[0],"VPol: cal %d, soft %d ,short %d , wrms  %d , box %d , surf %d, cw %d",cal,soft,Short,wrms,box,surf,cw);
		sprintf(graph_title[1],"HPol: cal %d, soft %d ,short %d , wrms  %d , box %d , surf %d, cw %d",cal,soft,Short,wrms,box,surf,cw);
		TCanvas *c3 = new TCanvas("","",2.1*850,850);
		c3->Divide(2,1);
		for(int pol=0; pol<2; pol++){
			c3->cd(pol+1);
			PeakCorr_vs_SNR_cutCal[pol]->Draw("colz");
			PeakCorr_vs_SNR_cutCal[pol]->GetYaxis()->SetTitle("Peak Correlation Value");
			PeakCorr_vs_SNR_cutCal[pol]->GetXaxis()->SetTitle("3rd Highest VPeak/RMS");
			PeakCorr_vs_SNR_cutCal[pol]->SetTitle(graph_title[pol]);
			gPad->SetLogz();
		}
		if(isSim)
			sprintf(title, "%s/%d.%d.%d_A%d_c%d_E%2.1f_%dEvents_Correlation_vs_SNR_cal%dF_soft%d_short%d_wrms%d_newbox%d_surf%d.png",plotPath,year_now, month_now, day_now,station,config,year_or_energy, int(num_total),cal,soft,Short,wrms,box,surf);		else
			sprintf(title, "%s/%d.%d.%d_A%d_c%d_%dEvents_Correlation_vs_SNR_cal%dF_soft%d_short%d_wrms%d_newbox%d_surf%d.png",plotPath,year_now, month_now, day_now,station,config,int(num_total),cal,soft,Short,wrms,box,surf);
		c3->SaveAs(title);
		delete c3;
		delete PeakCorr_vs_SNR_cutCal[0]; delete PeakCorr_vs_SNR_cutCal[1];

		//turn on cal, soft
		soft=1;
		sprintf(graph_title[0],"VPol: cal %d, soft %d ,short %d , wrms  %d , box %d , surf %d, cw %d",cal,soft,Short,wrms,box,surf,cw);
		sprintf(graph_title[1],"HPol: cal %d, soft %d ,short %d , wrms  %d , box %d , surf %d, cw %d",cal,soft,Short,wrms,box,surf,cw);
		TCanvas *c4 = new TCanvas("","",2.1*850,850);
		c4->Divide(2,1);
		for(int pol=0; pol<2; pol++){
			c4->cd(pol+1);
			PeakCorr_vs_SNR_cutCal_cutSoft[pol]->Draw("colz");
			PeakCorr_vs_SNR_cutCal_cutSoft[pol]->GetYaxis()->SetTitle("Peak Correlation Value");
			PeakCorr_vs_SNR_cutCal_cutSoft[pol]->GetXaxis()->SetTitle("3rd Highest VPeak/RMS");
			PeakCorr_vs_SNR_cutCal_cutSoft[pol]->SetTitle(graph_title[pol]);
			gPad->SetLogz();
		}
		if(isSim)
			sprintf(title, "%s/%d.%d.%d_A%d_c%d_E%2.1f_%dEvents_Correlation_vs_SNR_cal%dF_soft%d_short%d_wrms%d_newbox%d_surf%d.png",plotPath,year_now, month_now, day_now,station,config,year_or_energy, int(num_total),cal,soft,Short,wrms,box,surf);
		else
			sprintf(title, "%s/%d.%d.%d_A%d_c%d_%dEvents_Correlation_vs_SNR_cal%dF_soft%d_short%d_wrms%d_newbox%d_surf%d.png",plotPath,year_now, month_now, day_now,station,config,int(num_total),cal,soft,Short,wrms,box,surf);
		c4->SaveAs(title);
		delete c4;
		delete PeakCorr_vs_SNR_cutCal_cutSoft[0]; delete PeakCorr_vs_SNR_cutCal_cutSoft[1];

		//turn on cal, soft, short
		Short=1;
		sprintf(graph_title[0],"VPol: cal %d, soft %d ,short %d , wrms  %d , box %d , surf %d, cw %d",cal,soft,Short,wrms,box,surf,cw);
		sprintf(graph_title[1],"HPol: cal %d, soft %d ,short %d , wrms  %d , box %d , surf %d, cw %d",cal,soft,Short,wrms,box,surf,cw);
		TCanvas *c5 = new TCanvas("","",2.1*850,850);
		c5->Divide(2,1);
		for(int pol=0; pol<2; pol++){
			c5->cd(pol+1);
			PeakCorr_vs_SNR_cutCal_cutSoft_cutShort[pol]->Draw("colz");
			PeakCorr_vs_SNR_cutCal_cutSoft_cutShort[pol]->GetYaxis()->SetTitle("Peak Correlation Value");
			PeakCorr_vs_SNR_cutCal_cutSoft_cutShort[pol]->GetXaxis()->SetTitle("3rd Highest VPeak/RMS");
			PeakCorr_vs_SNR_cutCal_cutSoft_cutShort[pol]->SetTitle(graph_title[pol]);
			gPad->SetLogz();
		}
		if(isSim)
			sprintf(title, "%s/%d.%d.%d_A%d_c%d_E%2.1f_%dEvents_Correlation_vs_SNR_cal%dF_soft%d_short%d_wrms%d_newbox%d_surf%d.png",plotPath,year_now, month_now, day_now,station,config,year_or_energy, int(num_total),cal,soft,Short,wrms,box,surf);
		else
			sprintf(title, "%s/%d.%d.%d_A%d_c%d_%dEvents_Correlation_vs_SNR_cal%dF_soft%d_short%d_wrms%d_newbox%d_surf%d.png",plotPath,year_now, month_now, day_now,station,config,int(num_total),cal,soft,Short,wrms,box,surf);
		c5->SaveAs(title);
		delete c5;
		delete PeakCorr_vs_SNR_cutCal_cutSoft_cutShort[0]; delete PeakCorr_vs_SNR_cutCal_cutSoft_cutShort[1];

		//turn on cal, soft, short, wmrs
		wrms=1;
		sprintf(graph_title[0],"VPol: cal %d, soft %d ,short %d , wrms  %d , box %d , surf %d, cw %d",cal,soft,Short,wrms,box,surf,cw);
		sprintf(graph_title[1],"HPol: cal %d, soft %d ,short %d , wrms  %d , box %d , surf %d, cw %d",cal,soft,Short,wrms,box,surf,cw);
		TCanvas *c6 = new TCanvas("","",2.1*850,850);
		c6->Divide(2,1);
		for(int pol=0; pol<2; pol++){
			c6->cd(pol+1);
			PeakCorr_vs_SNR_cutCal_cutSoft_cutShort_cutWRMS[pol]->Draw("colz");
			PeakCorr_vs_SNR_cutCal_cutSoft_cutShort_cutWRMS[pol]->GetYaxis()->SetTitle("Peak Correlation Value");
			PeakCorr_vs_SNR_cutCal_cutSoft_cutShort_cutWRMS[pol]->GetXaxis()->SetTitle("3rd Highest VPeak/RMS");
			PeakCorr_vs_SNR_cutCal_cutSoft_cutShort_cutWRMS[pol]->SetTitle(graph_title[pol]);
			gPad->SetLogz();
		}
		if(isSim)
			sprintf(title, "%s/%d.%d.%d_A%d_c%d_E%2.1f_%dEvents_Correlation_vs_SNR_cal%dF_soft%d_short%d_wrms%d_newbox%d_surf%d.png",plotPath,year_now, month_now, day_now,station,config,year_or_energy, int(num_total),cal,soft,Short,wrms,box,surf);
		else
			sprintf(title, "%s/%d.%d.%d_A%d_c%d_%dEvents_Correlation_vs_SNR_cal%dF_soft%d_short%d_wrms%d_newbox%d_surf%d.png",plotPath,year_now, month_now, day_now,station,config,int(num_total),cal,soft,Short,wrms,box,surf);
		c6->SaveAs(title);
		delete c6;
		delete PeakCorr_vs_SNR_cutCal_cutSoft_cutShort_cutWRMS[0]; delete PeakCorr_vs_SNR_cutCal_cutSoft_cutShort_cutWRMS[1];

		//turn on cal, soft, short, wmrs, box
		box=1;
		sprintf(graph_title[0],"VPol: cal %d, soft %d ,short %d , wrms  %d , box %d , surf %d, cw %d",cal,soft,Short,wrms,box,surf,cw);
		sprintf(graph_title[1],"HPol: cal %d, soft %d ,short %d , wrms  %d , box %d , surf %d, cw %d",cal,soft,Short,wrms,box,surf,cw);
		TCanvas *c7 = new TCanvas("","",2.1*850,850);
		c7->Divide(2,1);
		for(int pol=0; pol<2; pol++){
			c7->cd(pol+1);
			PeakCorr_vs_SNR_cutCal_cutSoft_cutShort_cutWRMS_cutBox[pol]->Draw("colz");
			PeakCorr_vs_SNR_cutCal_cutSoft_cutShort_cutWRMS_cutBox[pol]->GetYaxis()->SetTitle("Peak Correlation Value");
			PeakCorr_vs_SNR_cutCal_cutSoft_cutShort_cutWRMS_cutBox[pol]->GetXaxis()->SetTitle("3rd Highest VPeak/RMS");
			PeakCorr_vs_SNR_cutCal_cutSoft_cutShort_cutWRMS_cutBox[pol]->SetTitle(graph_title[pol]);
			gPad->SetLogz();
		}
		if(isSim)
			sprintf(title, "%s/%d.%d.%d_A%d_c%d_E%2.1f_%dEvents_Correlation_vs_SNR_cal%dF_soft%d_short%d_wrms%d_newbox%d_surf%d.png",plotPath,year_now, month_now, day_now,station,config,year_or_energy, int(num_total),cal,soft,Short,wrms,box,surf);
		else
			sprintf(title, "%s/%d.%d.%d_A%d_c%d_%dEvents_Correlation_vs_SNR_cal%dF_soft%d_short%d_wrms%d_newbox%d_surf%d.png",plotPath,year_now, month_now, day_now,station,config,int(num_total),cal,soft,Short,wrms,box,surf);
		c7->SaveAs(title);
		delete c7;
		delete PeakCorr_vs_SNR_cutCal_cutSoft_cutShort_cutWRMS_cutBox[0]; delete PeakCorr_vs_SNR_cutCal_cutSoft_cutShort_cutWRMS_cutBox[1];

		surf=1;
		box=1;
		sprintf(graph_title[0],"VPol: cal %d, soft %d ,short %d , wrms  %d , box %d , surf %d, cw %d",cal,soft,Short,wrms,box,surf,cw);
		sprintf(graph_title[1],"HPol: cal %d, soft %d ,short %d , wrms  %d , box %d , surf %d, cw %d",cal,soft,Short,wrms,box,surf,cw);
		TCanvas *c8 = new TCanvas("","",2.1*850,850);
		c8->Divide(2,1);
		for(int pol=0; pol<2; pol++){
			c8->cd(pol+1);
			PeakCorr_vs_SNR_cutCal_cutSoft_cutShort_cutWRMS_cutBox_cutSurf[pol]->Draw("colz");
			PeakCorr_vs_SNR_cutCal_cutSoft_cutShort_cutWRMS_cutBox_cutSurf[pol]->GetYaxis()->SetTitle("Peak Correlation Value");
			PeakCorr_vs_SNR_cutCal_cutSoft_cutShort_cutWRMS_cutBox_cutSurf[pol]->GetXaxis()->SetTitle("3rd Highest VPeak/RMS");
			PeakCorr_vs_SNR_cutCal_cutSoft_cutShort_cutWRMS_cutBox_cutSurf[pol]->SetTitle(graph_title[pol]);
			gPad->SetLogz();
			PeakCorr_vs_SNR_cutCal_cutSoft_cutShort_cutWRMS_cutBox_cutSurf[pol]->GetZaxis()->SetRangeUser(1.,5e4);
			// PeakCorr_vs_SNR_cutCal_cutSoft_cutShort_cutWRMS_cutBox_cutSurf[pol]->GetXaxis()->SetRangeUser(0,10);
			// PeakCorr_vs_SNR_cutCal_cutSoft_cutShort_cutWRMS_cutBox_cutSurf[pol]->GetYaxis()->SetRangeUser(0,0.5);
		}
		if(isSim)
			sprintf(title, "%s/%d.%d.%d_A%d_c%d_E%2.1f_%dEvents_Correlation_vs_SNR_cal%dF_soft%d_short%d_wrms%d_newbox%d_surf%d.png",plotPath,year_now, month_now, day_now,station,config,year_or_energy, int(num_total),cal,soft,Short,wrms,box,surf);
		else
			sprintf(title, "%s/%d.%d.%d_A%d_c%d_%dEvents_Correlation_vs_SNR_cal%dF_soft%d_short%d_wrms%d_newbox%d_surf%d.png",plotPath,year_now, month_now, day_now,station,config,int(num_total),cal,soft,Short,wrms,box,surf);
		c8->SaveAs(title);
		delete c8;
		delete PeakCorr_vs_SNR_cutCal_cutSoft_cutShort_cutWRMS_cutBox_cutSurf[0]; delete PeakCorr_vs_SNR_cutCal_cutSoft_cutShort_cutWRMS_cutBox_cutSurf[1];

		TCanvas *c9 = new TCanvas("","",2.1*850,850);
		c9->Divide(2,1);
		for(int pol=0; pol<1; pol++){
			c9->cd(pol+1);
			fracs_power_cut[pol]->Draw("");
		}
		if(isSim)
			sprintf(title, "%s/%d.%d.%d_A%d_c%d_E%2.1f_%dEvents_FracPowerCut.png",plotPath,year_now, month_now, day_now,station,config,year_or_energy, int(num_total));
		else
			sprintf(title, "%s/%d.%d.%d_A%d_c%d_%dEvents_FracPowerCut.png",plotPath,year_now, month_now, day_now,station,config,int(num_total));
		c9->SaveAs(title);
		delete c9;
		delete fracs_power_cut[0]; delete fracs_power_cut[1];

	}

}
