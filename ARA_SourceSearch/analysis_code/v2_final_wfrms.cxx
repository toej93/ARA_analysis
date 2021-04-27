////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////	v2_analysis_save_vals.cxx 
////	A23 diffuse, save values for cuts
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

//AraRoot includes
#include "RawAtriStationEvent.h"
#include "UsefulAtriStationEvent.h"
#include "tools_PlottingFns.h"
#include "tools_inputParameters.h"
#include "tools_outputObjects.h"
#include "tools_Cuts.h"

using namespace std;


int main(int argc, char **argv)
{
	gStyle->SetOptStat(0);
	time_t time_now = time(0); //get the time now                                                                                                                                                                  
	tm *time = localtime(&time_now);
	int year_now = time -> tm_year + 1900;
	int month_now = time -> tm_mon + 1;
	int day_now = time -> tm_mday;

	char *plotPath(getenv("PLOT_PATH"));
	if (plotPath == NULL) std::cout << "Warning! $PLOT_PATH is not set!" << endl;

	stringstream ss;
	
	if(argc<9){
		cout<< "Usage\n" << argv[0] << " <1-station> <2-year> <3-drop_bad_chan> <4-v_snr_bin> <5-h_snr_bin> <6-v_thresh_val> <7-h_thresh_val> <8-joined filename 1> <joined filename 2 > ... <joined filename x>"<<endl;
		return 0;
	}
	int station = atoi(argv[1]);
	int year = atoi(argv[2]);
	int dropBadChans = atoi(argv[3]);

	//just to have the cut parameters up front and easy to find
	int thresholdBin_pol[]={atoi(argv[4]),atoi(argv[5])}; //bin 3 = 2.3, bin 5 = 2.5 //what is the faceRMS inclusion threshold?
	double wavefrontRMScut[]={atof(argv[6]), atof(argv[7])}; //event wavefrontRMS < this value

	TH2D *wfrms_plots[4];
	wfrms_plots[0] = new TH2D("vpol","vpol",100,-5,5,40,0,40);
	wfrms_plots[1] = new TH2D("hpol","hpol",100,-5,5,40,0,40);
	int num_total=0;

	for(int file_num=8; file_num<argc; file_num++){

		string chRun = "run";
		string file = string(argv[file_num]);
		size_t foundRun = file.find(chRun);
		string strRunNum = file.substr(foundRun+4,4);
		int runNum = atoi(strRunNum.c_str());
		// printf("Run Number %d \n", runNum);

		cout << "Run " << file_num << " :: " << argv[file_num] << endl;
		
		TFile *inputFile = TFile::Open(argv[file_num]);
		if(!inputFile){
			cout<<"Can't open joined file!"<<endl;
			return -1;
		}
		ss.str("");
		ss << "OutputTree_filter";
		TTree *inputTree_filter = (TTree*) inputFile->Get(ss.str().c_str());
		if(!inputTree_filter){
			cout<<"Can't open filter tree"<<endl;
			return -1;
		}
		bool isCalPulser;
		bool isSoftTrigger;
		int waveformLength[16];
		bool hasDigitizerError;
		inputTree_filter->SetBranchAddress("thirdVPeakOverRMS", &thirdVPeakOverRMS);
		inputTree_filter->SetBranchAddress("rms_pol_thresh_face_V", &rms_pol_thresh_face_V);
		inputTree_filter->SetBranchAddress("rms_pol_thresh_face_H", &rms_pol_thresh_face_H);
		int numFaces_new_V;
		int numFaces_new_H;
		if(station==2){
			numFaces_new_V = numFaces;
			numFaces_new_H = numFaces_A2_drop;
		}
		else if(station==3){
			numFaces_new_V = numFaces_A3_drop;
			numFaces_new_H = numFaces_A3_drop;
		}
		double rms_pol_thresh_face_alternate_V[thresholdSteps][numFaces_new_V];
		double rms_pol_thresh_face_alternate_H[thresholdSteps][numFaces_new_H];
		inputTree_filter->SetBranchAddress("rms_pol_thresh_face_alternate_V", &rms_pol_thresh_face_alternate_V);
		inputTree_filter->SetBranchAddress("rms_pol_thresh_face_alternate_H", &rms_pol_thresh_face_alternate_H);
		
		inputTree_filter->SetBranchAddress("isCalpulser",&isCalPulser);
		inputTree_filter->SetBranchAddress("isSoftTrigger",&isSoftTrigger);
		inputTree_filter->SetBranchAddress("waveformLength",&waveformLength);
		inputTree_filter->SetBranchAddress("hasDigitizerError",&hasDigitizerError);

		//next, load the reco tree
		TTree *inputTree_reco[35];
		double peakCorr[35][2];
		int peakTheta[35][2];
		int peakPhi[35][2];
		int recoBinSelect = 19; //300 m map
		int recoBinCalpulser = 6; //41 m map
		for(int i=0; i<35; i++){
			if(i==recoBinSelect||i==recoBinCalpulser){
				ss.str("");
				ss << "OutputTree_recoRadius_" << i;
				inputTree_reco[i] = (TTree*) inputFile->Get(ss.str().c_str());
				if(!inputTree_reco[i]) {
					std::cout << "Can't find OutputTree: " << i << "\n";
					return -1;
				}
				inputTree_reco[i]->SetBranchAddress("peakCorr_single", &peakCorr[i]);
				inputTree_reco[i]->SetBranchAddress("peakTheta_single", &peakTheta[i]);
				inputTree_reco[i]->SetBranchAddress("peakPhi_single", &peakPhi[i]);
			}
		}

		int numEntries = inputTree_filter->GetEntries();
		Long64_t starEvery=numEntries/200;
		if(starEvery==0) starEvery++;

		//now to loop over events
		for(int event=0; event<numEntries; event++){
			// if(event%starEvery==0) {
			// 	std::cout << "	On event "<<event<<endl;
			// }

			inputTree_filter->GetEvent(event);

			bool isShort=false;
			bool isSurf=false;
			bool isCP5=false;
			bool isCP6=false;
			bool failWavefrontRMS[2];
			failWavefrontRMS[0]=false;
			failWavefrontRMS[1]=false;

			bool isBadEvent=hasDigitizerError;

			for(int i=0;i<16;i++){ if(waveformLength[i]<550) isShort=true; }

			for (int i = 0; i < 35; i++){
				if (i == recoBinSelect || i == recoBinCalpulser){
					inputTree_reco[i]->GetEntry(event);
				}
			}

			//figure out which reconstruction map (vpol or hpol) is best
			//in the present analysis, this only matters for the 300m bin
			double bestCorr[] = {0., 0., 0.};
			int bestCorrRadiusBin[3];
			int bestPol = 2;
			int bestTheta[3];
			int bestPhi[3];

			for(int pol=0; pol<2; pol++){
				for(int i=0; i<35; i++){
					if(i==recoBinSelect){
						if(peakCorr[i][pol] > bestCorr[pol]){
							bestCorr[pol]=peakCorr[i][pol];
							bestCorrRadiusBin[pol]=i;
							bestTheta[pol]=peakTheta[i][pol];
							bestPhi[pol]=peakPhi[i][pol];
						}
						if(peakCorr[i][pol] > bestCorr[2]){
							bestCorr[2]=peakCorr[i][pol];
							bestCorrRadiusBin[2]=i;
							bestTheta[2]=peakTheta[i][pol];
							bestPhi[2]=peakPhi[i][pol];
							bestPol=pol;
						}
					}//300m bin check
				}//loop over reco bins
			}//loop over polarizations


			for(int pol=0; pol<2; pol++){
				if(bestTheta[pol] > 37) isSurf=true;
			}

			//figure out which reconstruction map (vpol or hpol) is best
			//for the 41m bin
			double bestCorr_pulser[] = {0., 0., 0.};
			int bestCorrRadiusBin_pulser[3];
			int bestPol_pulser = 2;
			int bestTheta_pulser[3];
			int bestPhi_pulser[3];

			for(int pol=0; pol<2; pol++){
				for(int i=0; i<35; i++){
					if (i == recoBinCalpulser){
						if (peakCorr[i][pol] > bestCorr_pulser[pol]){
							bestCorr_pulser[pol] = peakCorr[i][pol];
							bestCorrRadiusBin_pulser[pol] = i;
							bestTheta_pulser[pol] = peakTheta[i][pol];
							bestPhi_pulser[pol] = peakPhi[i][pol];
						}
						if (peakCorr[i][pol] > bestCorr_pulser[2]){
							bestCorr_pulser[2] = peakCorr[i][pol];
							bestCorrRadiusBin_pulser[2] = i;
							bestTheta_pulser[2] = peakTheta[i][pol];
							bestPhi_pulser[2] = peakPhi[i][pol];
							bestPol_pulser = pol;
						}
					}//cal pulser (41m) bin check
				}//loop over reco bins
			}//loop over polarizations
			
			//draw a box around the cal pulser
			for (int pol = 0; pol < 2; pol++){
				if (bestPhi_pulser[pol] > -30 && bestPhi_pulser[pol] < -20 && bestTheta_pulser[pol] > -25 && bestTheta_pulser[pol] < -10){
					isCP5=true;
				}
				//if (bestPhi_pulser[pol] > 60 && bestPhi_pulser[pol] < 70 && bestTheta_pulser[pol] > 10 && bestTheta_pulser[pol] < 25){
				if (bestPhi_pulser[pol] > 60 && bestPhi_pulser[pol] < 70 && bestTheta_pulser[pol] > 0 && bestTheta_pulser[pol] < 15){
					isCP6=true;
				}
			}

			//filter associated parameters
			double SNRs[2];
			SNRs[0] = thirdVPeakOverRMS[0];
			SNRs[1] = thirdVPeakOverRMS[1];
			if(SNRs[0]>29.) SNRs[0]=29.;
			if(SNRs[1]>29.) SNRs[1]=29.;

			vector <double> rms_faces_V;
			vector <double> rms_faces_H;

			if(dropBadChans){
				int num_faces_for_V_loop;
				int num_faces_for_H_loop;
				if(station==2){
					rms_faces_V.resize(numFaces);
					num_faces_for_V_loop=numFaces;
					rms_faces_H.resize(numFaces_A2_drop);
					num_faces_for_H_loop=numFaces_A2_drop;
				}
				else if(station==3){
					if(runNum>getA3BadRunBoundary()){
						rms_faces_V.resize(numFaces_A3_drop);
						num_faces_for_V_loop=numFaces_A3_drop;
						rms_faces_H.resize(numFaces_A3_drop);
						num_faces_for_H_loop=numFaces_A3_drop;
					}
					else{ //it's 2013-, keep string four
						rms_faces_V.resize(numFaces);
						num_faces_for_V_loop=numFaces;
						rms_faces_H.resize(numFaces);
						num_faces_for_H_loop=numFaces;
					}
				}
				//now we loop over the faces
				for(int i=0; i<num_faces_for_V_loop; i++){
					rms_faces_V[i] = rms_pol_thresh_face_alternate_V[thresholdBin_pol[0]][i];
				}
				for(int i=0; i<num_faces_for_H_loop; i++){
					rms_faces_H[i] = rms_pol_thresh_face_alternate_H[thresholdBin_pol[1]][i];
				}
			}
			else{
				rms_faces_V.resize(numFaces);
				rms_faces_H.resize(numFaces);
				//now, we must loop over the faces
				for(int i=0; i<numFaces; i++){
					rms_faces_V[i] = rms_pol_thresh_face_V[thresholdBin_pol[0]][i];  //this is right RMS for this polarization, threshold requirement, and face
					rms_faces_H[i] = rms_pol_thresh_face_H[thresholdBin_pol[1]][i];
				}
			}

			//now to sort them smallest to largest; lowest RMS is best
			sort(rms_faces_V.begin(), rms_faces_V.end());
			sort(rms_faces_H.begin(), rms_faces_H.end());

			double bestFaceRMS[2];
			bestFaceRMS[0]=rms_faces_V[0];
			bestFaceRMS[1]=rms_faces_H[0];

			// if(log(bestFaceRMS[0])/log(10) >= wavefrontRMScut[0]){
			// 	failWavefrontRMS[0]=true;
			// }
			// if(log(bestFaceRMS[1])/log(10) >= wavefrontRMScut[1]){
			// 	failWavefrontRMS[1]=true;
			// }
			// if(1==1){
			if(!isCalPulser
				&& !isSoftTrigger
				&& !isShort
				&& !isCP5 && !isCP6
				&& !isSurf
				&& !isBadEvent
			){ //cut cal pulsers
				num_total++;
				for(int pol=0; pol<2; pol++){
					wfrms_plots[pol]->Fill(TMath::Log10(bestFaceRMS[pol]), SNRs[pol]);
				} //cal pulser
			}//loop over polarization
		}//loop over events
		inputFile->Close();
		delete inputFile;
	} //end loop over input files

	TH1D *projections[2];

	for(int pol=0; pol<2; pol++){
		projections[pol] = wfrms_plots[pol]->ProjectionX();
	}

	gStyle->SetOptStat(0);
	gStyle->SetStatY(0.9);
	gStyle->SetStatX(0.9);
	gStyle->SetStatW(0.2);
	gStyle->SetStatH(0.2);

	TCanvas *c = new TCanvas("","",2.1*850,2.1*850);
	c->Divide(2,2);
	for(int pol=0; pol<2; pol++){
		c->cd(pol+1);
			wfrms_plots[pol]->Draw("colz");
			wfrms_plots[pol]->GetXaxis()->SetTitle("log10(Wavefront RMS)");
			wfrms_plots[pol]->GetYaxis()->SetTitle("3rd Highest VPeak/RMS");
			// wfrms_plots[pol]->GetZaxis()->SetRangeUser(0.1,7e6);
			gPad->SetLogz();
		c->cd(pol+3);
			projections[pol]->Draw();
			projections[pol]->SetLineWidth(3);
			projections[pol]->GetYaxis()->SetTitle("Counts");
			projections[pol]->GetXaxis()->SetTitle("log10(Wavefront RMS)");
			// projections[pol]->GetYaxis()->SetRangeUser(0.1,1e7);
			gPad->SetLogy();
	}
	char title[300];
	sprintf(title, "%s/%d.%d.%d_data_A%d_%d_%dEvents_WFRMSDistro.png",plotPath, year_now, month_now, day_now,station,year,int(num_total),0.1*double(thresholdBin_pol[0]) + 2.0,0.1*double(thresholdBin_pol[1])+2.0);
	c->SaveAs(title);
	delete c;
	for(int i=0; i<2; i++){
		delete wfrms_plots[i];
		delete projections[i];
	}


}