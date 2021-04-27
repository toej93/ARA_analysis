////////////////////////////////////////////////////////////////////////////////
////	v2_analysis_audit_100.cxx 
////	Check to see that for this data file, there is a correctly
////	formed filter file, reco file, and CWID file
////	all of this must be true to confidently 
////	proceed with the final stage of the analysis
////
////	Aug 2019
////////////////////////////////////////////////////////////////////////////////

//Includes
#include <iostream>
#include <string>
#include <sstream>

//ROOT Includes
#include "TTree.h"
#include "TFile.h"
#include "TGraph.h"

using namespace std;

int main(int argc, char **argv)
{

	stringstream ss;

	if(argc<6) {
		std::cout << "Usage\n" << argv[0] << " <station> <filter_file_loc> <reco_file_location> <cw_file_location> <data_file>"<<endl;
		return -1;
	}

	/*
	arguments
	0: exec
	1: station num (2/3)
	2: expected location of the filter file
	3: expected location of the reco file
	4: expected location of the CW file
	5: the data file we want to check in the first place
	*/

	int station = atoi(argv[1]);
	string file_location_filter = argv[2];
	string file_location_reco = argv[3];
	string file_location_cw = argv[4];
	string data_file = argv[5];

	/*
		the run number is sandwiched like so: run_XXXXXXXXXX_filter
		where the length of XXXXXX is, strictly speaking, unpredictable
		so, what we do is find the location of "run_"
		And then we find the location of "_filter"
		And we capture what is in between them
	*/

	//get run number
	string file = data_file;
	string wordRun = "run_";
	size_t foundRun = file.find(wordRun);
	string wordFilter = "_filter";
	size_t foundFilter = file.find(wordFilter);
	size_t diff=(foundFilter-wordRun.length())-foundRun;
	string strRunNum = file.substr(foundRun+4,diff);
	int runNum = atoi(strRunNum.c_str());

	// to start, we need to know the number of real events

		TFile *file_data = TFile::Open(data_file,"READ");
		if(!file_data){
			std::cout << "Can't open file : data" << "\n";
			return -1;
		}
		TTree *inputTree_data = (TTree*) file_filter->Get("eventTree");
		if(!inputTree_data) {
			std::cout << "Can't find data eventTree"  << "\n";
			return -1;
		}
		int nEvents_data = inputTree_data->GetEntries();

	// first, the filter file

		char filename_filter[400];
		sprintf(filename_filter,"%s/processed_station_%d_run_%d_filter.root",file_location_filter,station,runNum);
		TFile *file_filter = TFile::Open(filename_filter,"READ");
		if(!file_filter) {
			std::cout << "Can't open file : filter" << "\n";
			return -1;
		}
		TTree *inputTree_filter = (TTree*) file_filter->Get("OutputTree");
		if(!inputTree_filter) {
			std::cout << "Can't find OutputTree: filter"  << "\n";
			return -1;
		}
		int nEvents_filter = inputTree_filter->GetEntries();

	// then, the reco file

		char filename_reco[400];
		sprintf(filename_reco,"%s/processed_station_%d_run_%d_reco.root",file_location_reco,station,runNum);
		TFile *file_reco = TFile::Open(filename_filter,"READ");
		if(!file_reco) {
			std::cout << "Can't open file : reco" << "\n";
			return -1;
		}
		TTree *inputTree_reco = (TTree*) file_reco->Get("OutputTreeReco");
		if(!inputTree_reco) {
			std::cout << "Can't find OutputTreeReco: reco"  << "\n";
			return -1;
		}
		int nEvents_reco = inputTree_reco->GetEntries();

	// then, the cw file

		char filename_cw[400];
		sprintf(filename_cw,"%s/CWID_station_%d_run_%d.root",file_location_cw,station,runNum);
		TFile *file_cw = TFile::Open(filename_cw,"READ");
		if(!file_cw) {
			std::cout << "Can't open file : cw" << "\n";
			return -1;
		}
		TTree *inputTree_cw = (TTree*) file_cw->Get("NewCWTree");
		if(!inputTree_cw) {
			std::cout << "Can't find OutputTree: cw"  << "\n";
			return -1;
		}
		int nEvents_cw = inputTree_cw->GetEntries();

		if (nEvents != nEvents_reco){
			cerr << "Event numbers don't match: RecoBin " << i << endl;
			return -1;
		}

	if(nEvents_filter!=nEvents_data){
		printf("Filter Error run %d\n", runNum);
	}
	if(nEvents_reco!=nEvents_data){
		printf("Reco Error run %d\n", runNum);
	}
	if(nEvents_cw!=nEvents_data){
		printf("CW Error run %d\n", runNum);
	}

	if(
		nEvents_filter==nEvents_data
		&&
		nEvents_reco==nEvents_data
		&&
		nEvents_cw==nEvents_data
	){
		printf("Good run %d\n", runNum);
		// char logfile_good[200];
		// sprintf(logfile_good,"/data/user/brianclark/A23Diffuse/100pct/good_files.txt",chan);
		// FILE *fout = fopen(logfile_good, "a");
		// fprintf(fout,"%d\n",runNum);
		// fclose(fout);//close log file
	}
	file_data->Close();
	file_filter->Close();
	file_reco->Close();
	file_cw->Close();
}
