////////////////////////////////////////////////////////////////////////////////
////	v2_analysis_join_filter_41_300.cxx 
////	A23 diffuse, merge filter, 41m, and 300m files to joined files
////
////	Nov 2018
////////////////////////////////////////////////////////////////////////////////


//Includes
#include <iostream>
#include <string>
#include <sstream>

//ROOT Includes
#include "TTree.h"
#include "TFile.h"
#include "TGraph.h"

#include "tools_inputParameters.h"

using namespace std;

int main(int argc, char **argv)
{

	stringstream ss;

	if(argc<5) {
		std::cout << "Usage\n" << argv[0] << " <station> <output_location> <processed_file_location> <filter_file>"<<endl;
		return -1;
	}
	/*
	arguments
	0: exec
	1: station num (2/3)
	2: output location
	3: processed file location
	5: filter file number
	*/


	int station = atoi(argv[1]);
	/*
		the run number is sandwiched like so: run_XXXXXXXXXX_filter
		where the length of XXXXXX is, strictly speaking, unpredictable
		so, what we do is find the location of "run_"
		And then we find the location of "_filter"
		And we capture what is in between them

	*/

	//get run number
	string file = string(argv[4]);
	string wordRun = "run_";
	size_t foundRun = file.find(wordRun);
	string wordFilter = "_filter";
	size_t foundFilter = file.find(wordFilter);
	size_t diff=(foundFilter-wordRun.length())-foundRun;
	string strRunNum = file.substr(foundRun+4,diff);
	int runNum = atoi(strRunNum.c_str());

	int recoBinCalpulser = 6;
	int recoBinSelect = 19;
	char out_filename[400];
	sprintf(out_filename,"%s/processed_station_%d_run_%d_joined_bins_%d_%d.root",argv[2],station,runNum,recoBinCalpulser,recoBinSelect);

	TFile *OutputFile = TFile::Open(out_filename, "RECREATE");

	char filter_filename[400];
	sprintf(filter_filename,"%s/processed_station_%d_run_%d_filter.root",argv[3],station,runNum);

	TFile *fOpen_filter = TFile::Open(filter_filename);
	if(!fOpen_filter) {
		std::cout << "Can't open file : filter" << "\n";
		return -1;
	}
	TTree *inputTree_filter = (TTree*) fOpen_filter->Get("OutputTree");
	if(!inputTree_filter) {
		std::cout << "Can't find OutputTree: filter"  << "\n";
		return -1;
	}

	int nEvents = inputTree_filter->GetEntries();

	OutputFile->cd();  
	ss.str("");
	ss << "OutputTree_filter";
	inputTree_filter->CloneTree()->Write(ss.str().c_str());

	TFile *fOpen_reco[35];
	TTree *inputSettingsTree_reco[35];
	TTree *inputTree_reco[35];
  
	for (int i = 0; i < 35; i++){
		if (i == recoBinSelect || i == recoBinCalpulser){

			char reco_filename[400];
			sprintf(reco_filename,"%s/processed_station_%d_run_%d_recoRadius_%d.root",argv[3],station,runNum,int(radii[i]));

			fOpen_reco[i] = TFile::Open(reco_filename);
			if(!fOpen_reco[i]) {
				std::cerr << "Can't open file : "<< i << "\n";
				return -1;
			}
      
			inputSettingsTree_reco[i] = (TTree*) fOpen_reco[i]->Get("OutputSettingsTree");
			if(!inputSettingsTree_reco[i]) {
				std::cerr << "Can't find OutputSettingsTree: " << i << "\n";
				return -1;
			}
      
			inputTree_reco[i] = (TTree*) fOpen_reco[i]->Get("OutputTree");
			if(!inputTree_reco[i]) {
				std::cerr << "Can't find OutputTree: " << i << "\n";
				return -1;
			}
      
			int nEvents_reco = inputTree_reco[i]->GetEntries();
			if (nEvents != nEvents_reco){
				cerr << "Event numbers don't match: RecoBin " << i << endl;
				return -1;
			}
      
			OutputFile->cd();
			if (i==recoBinSelect){
				inputSettingsTree_reco[i]->CloneTree()->Write();
			}
      
			ss.str("");
			ss << "OutputTree_recoRadius_" << i;
			inputTree_reco[i]->CloneTree()->Write(ss.str().c_str());

			fOpen_reco[i]->Close();
		}
	}
	OutputFile->Close();
	fOpen_filter->Close();
}
