////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////	v2_final_plots.cxx 
////	A23 diffuse, make plots of the final cut parameter space
////	SurfaceLook version to more carefully think about surface cut stuff
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
#include "tools_CommandLine.h"

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

	TH1D *fracs_power_cut[2];
	fracs_power_cut[0]=new TH1D("","V",100,0,1);
	fracs_power_cut[1]=new TH1D("","H",100,0,1);

	vector<int> BadRunList=BuildBadRunList(station);

	// cuts applying to all events
	double num_total=0.;
	double remove_bad_runs_and_livetime=0.;
	double and_remove_soft=0.;
	double and_remove_short_and_glitch=0.;
	double and_remove_tagged_cal=0.;

	double num_wereSurface_nowInIce[2] = {0., 0.};
	double num_wereInIce_nowSurface[2] = {0., 0.};
	double num_originalSurface[2] = {0., 0.};
	double num_newSurface[2] = {0., 0.};

	// for events that are filtered *only*
	// we want to work out the number that were surface events, but after the filter, are in-ice
	// and the number that were in-ice, but after the filter, that were surface

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
				|| hasBadSpareChanIssue2
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

			for(int pol=0; pol<2; pol++){

				// if(pol==1 && Refilt[pol]){
				// 	num_filtered_V+=weight;
				// }

				if(isSurfEvent_org_out[pol]){
					num_originalSurface[pol]+=weight;
				}
				if(isSurfEvent_new_out[pol]){
					num_newSurface[pol]+=weight;
				}
				// first of all, only worry about this if the event is re-filtered
				if(Refilt[pol]){

					num_filtered[pol]+=weight;

					// printf("Event %d: original surface status %d and new surface status %d \n", event, isSurfEvent_org_out[pol], isSurfEvent_new_out[pol]);

					// first, check to see if an event was surface, but is now is in-ice
					// was originally surface and now NOT IS surface now
					if(isSurfEvent_org_out[pol] && !isSurfEvent_new_out[pol]){
						num_wereSurface_nowInIce[pol]+=weight;
					}

					// then, check to see if an event was not surface, but now is
					// was originally NOT Surface, and now IS surface
					if(!isSurfEvent_org_out[pol] && isSurfEvent_new_out[pol]){
						num_wereInIce_nowSurface[pol]+=weight;
					}
				}
			}
		}
		inputFile->Close();
		delete inputFile;
	}
	printf("Total nunber of good RF events is %d \n", int(and_remove_tagged_cal) );

	// cout<<"Flim flam is "<<FlimFlam<<endl;

	// cout<<"Num filtered V is "<<num_filtered_V<<endl;

	for(int pol=0; pol<2; pol++){
		printf("---------------------------------------------------------------\n");
		printf("Pol %d: \n", pol);
		printf("     Num filtered: %.2f \n", num_filtered[pol]);
		printf("     Num original surface: %.2f \n", num_originalSurface[pol]);
		printf("     Num new surface: %.2f \n", num_newSurface[pol]);		
		printf("     Num were surface and now in ice: %.2f \n", num_wereSurface_nowInIce[pol]);
		printf("     Num were in ice and now surface: %.2f \n", num_wereInIce_nowSurface[pol]);
	}
	printf("---------------------------------------------------------------\n");
}