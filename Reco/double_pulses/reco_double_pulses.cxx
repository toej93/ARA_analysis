////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////	v2_analysis_reco.cxx
////	A23 diffuse, do reconstruction
////
////	Nov 2018
////////////////////////////////////////////////////////////////////////////////

//Includes
#include <iostream>
#include <iomanip>
#include <sstream>

//AraRoot Includes
#include "RawAtriStationEvent.h"
#include "UsefulAraStationEvent.h"
#include "UsefulAtriStationEvent.h"

//ROOT Includesf
#include "TTree.h"
#include "TFile.h"
#include "TGraph.h"
#include "TH2D.h"

RawAtriStationEvent *rawAtriEvPtr;
UsefulAtriStationEvent *realAtriEvPtr;

#include "Settings.h"
#include "Event.h"
#include "Detector.h"
#include "Report.h"

#include "AraAntennaInfo.h"
#include "AraQualCuts.h"
#include "RayTraceCorrelator.h"

#include "tools_inputParameters.h"
#include "tools_outputObjects.h"
#include "tools_runSummaryObjects.h"
#include "tools_WaveformFns.h"
#include "tools_PlottingFns.h"
#include "tools_Constants.h"
#include "tools_RecoFns.h"
#include "tools_Cuts.h"

AraAntPol::AraAntPol_t Vpol = AraAntPol::kVertical;
AraAntPol::AraAntPol_t Hpol = AraAntPol::kHorizontal;

int main(int argc, char **argv)
{
  time_t time_now = time(0); //get the time now
  tm *time = localtime(&time_now);
  int year_now = time -> tm_year + 1900;
  int month_now = time -> tm_mon + 1;
  int day_now = time -> tm_mday;

  char *DataDirPath(getenv("DATA_DIR"));
  if (DataDirPath == NULL) std::cout << "Warning! $DATA_DIR is not set!" << endl;
  char *PedDirPath(getenv("PED_DIR"));
  if (PedDirPath == NULL) std::cout << "Warning! $DATA_DIR is not set!" << endl;

  if(argc<8) {
    std::cout << "Usage\n" << argv[0] << " <1-simulation_flag> <2-station> <3-year/config> <4-radius_bin> <5-filter_file_dir> <6-output directory> <7-input file>\n";
    return -1;
  }

  /*
  arguments
  0: exec
  1: simulation (yes/no)
  2: station num (2/3)
  3: year/config
  4: radius bin
  5: filter file dir
  6: output directory
  7: input file
  */

  isSimulation=atoi(argv[1]);
  int station_num=atoi(argv[2]);
  calpulserRunMode=0;
  int yearConfig=atoi(argv[3]);
  int radiusBin = atoi(argv[4]);

  int numRadiiScanned = 35;
  int startingRadiusBin = radiusBin;

  AraQualCuts *qualCut = AraQualCuts::Instance(); //we also need a qual cuts tool

  stringstream ss;
  string xLabel, yLabel;
  vector<string> titlesForGraphs;
  for (int i = 0; i < nGraphs; i++){
    ss.str("");
    ss << "Channel " << i;
    titlesForGraphs.push_back(ss.str());
  }

  TFile *fp = TFile::Open(argv[7]);
  if(!fp) {
    std::cout << "Can't open file\n";
    return -1;
  }
  TTree *eventTree;
  eventTree= (TTree*) fp->Get("eventTree");
  if(!eventTree) {
    std::cout << "Can't find eventTree\n";
    return -1;
  }

  TTree *simTree;
  TTree *simSettingsTree;
  Event *eventPtr = 0;
  Detector *detector = 0;
  Report *reportPtr = 0;

  if (isSimulation == true){
    simSettingsTree=(TTree*) fp->Get("AraTree");
    if (!simSettingsTree) {
      std::cout << "Can't find AraTree\n";
      return -1;
    }

    simSettingsTree->SetBranchAddress("detector", &detector);
    simSettingsTree->GetEntry(0);

    for (int i = 0; i < detector->stations.size(); i++){
      int n_antennas = 0;
      for (int ii = 0; ii < detector->stations[i].strings.size(); ii++){
        for (int iii = 0; iii < detector->stations[i].strings[ii].antennas.size(); iii++){
          detectorCenter[0] += detector->stations[i].strings[ii].antennas[iii].GetX();
          detectorCenter[1] += detector->stations[i].strings[ii].antennas[iii].GetY();
          detectorCenter[2] += detector->stations[i].strings[ii].antennas[iii].GetZ();
          n_antennas++;
        }
      }
      cout << "Detector Center: ";
      for (int ii = 0; ii < 3; ii++){
        detectorCenter[ii] = detectorCenter[ii]/(double)n_antennas;
        cout << detectorCenter[ii] << " : ";
      }
      cout << endl;
    }


    simTree=(TTree*) fp->Get("AraTree2");
    if (!simTree) {
      std::cout << "Can't find AraTree2\n";
      return -1;
    }
    simTree->SetBranchAddress("event", &eventPtr);
    simTree->SetBranchAddress("report", &reportPtr);
    simTree->GetEvent(0);
  }

  Settings *settings = new Settings();
  string setupfile = "setup.txt";
  settings->ReadFile(setupfile);
  cout << "Read " << setupfile << " file!" << endl;
  settings->NOFZ=1;

  numRadiiScanned=1;
  RayTraceCorrelator *theCorrelators[numRadiiScanned];
  for (int i = 0; i < numRadiiScanned; i++){
    theCorrelators[i] = 0;
  }

  for (int i = 0; i < numRadiiScanned; i++){
    double radius_temp = radii[i+startingRadiusBin];
    cout << "Setup RTCorr : " << radius_temp << endl;
    theCorrelators[i] = new RayTraceCorrelator(station_num, radius_temp, settings, 0.25, RTTestMode);
  }

  double weight;
  int unixTime;
  int unixTimeUs;
  int eventNumber;
  double maxPeakVfromSim;
  double PeakVfromSim[16][2];
  int runNum;

  // eventTree->ResetBranchAddresses();

  if(isSimulation){
    eventTree->SetBranchAddress("UsefulAtriStationEvent", &realAtriEvPtr);
    eventTree->SetBranchAddress("weight", &weight);
    printf("Simulation; load useful event tree straight away \n");
    runNum = getrunNum(argv[7]);
  }
  else{
    eventTree->SetBranchAddress("event",&rawAtriEvPtr);
    eventTree->SetBranchAddress("run",&runNum);
    printf("Data; load raw event tree \n");

  }

  Long64_t numEntries=eventTree->GetEntries();
  Long64_t starEvery=numEntries/80;
  if(starEvery==0) starEvery++;
  //numEntries=10;

  eventTree->GetEntry(0); //just to get runNum
  printf("Reco Run Number %d \n", runNum);

  // load pedestals, if they exist yet
  // this will perform fine for simulation; it'll evaluate to garbage (or whatever), but it's not needed, so cool
  AraEventCalibrator *calibrator = AraEventCalibrator::Instance();
  char ped_file_name[400];
  sprintf(ped_file_name,"%s/run_specific_peds/A%d/all_peds/event%d_specificPeds.dat",PedDirPath,station_num,runNum);
  calibrator->setAtriPedFile(ped_file_name,station_num); //because someone had a brain (!!), this will error handle itself if the pedestal doesn't exist

  // get the run summary information, if it exists yet
  // and remember, because it's the users job to pass the location of the filter files
  // this should work for simulated events just fine
  char filter_file_name[400];
  sprintf(filter_file_name,"%s/processed_station_%d_run_%d_filter.root",argv[5],station_num,runNum);
  bool hasFilterFile = false;
  TFile *filterFile = TFile::Open(filter_file_name);
  TTree *filterTree;
  if(filterFile){
    printf("Successfully found filter file information \n");
    hasFilterFile=true;
    filterTree = (TTree*) filterFile->Get("OutputTree");
    if(!filterTree) {
      std::cout << "Can't find filterTree\n";
      return -1;
    }
    filterTree->SetBranchAddress("VPeakOverRMS", &VPeakOverRMS);
    filterFile->cd();
  }
  if(!filterFile){
    printf("There is no filter file! Running without a filter file is not allowed!");
    return -1;
  }

  // prepare for output
  string processedFilename = getProcessedFilename_recoRadius(station_num, argv[6], runNum, radii[radiusBin]);
  // TFile *OutputFile = TFile::Open(processedFilename.c_str(), "RECREATE");
  // TTree* OutputSettingsTree = new TTree("OutputSettingsTree", "OutputSettingsTree");
  // OutputSettingsTree->Branch("detectorCenter", &detectorCenter, "detectorCenter[3]/D");
  // OutputSettingsTree->Branch("calpulserRunMode", &calpulserRunMode, "calpulserRunMode/I");
  // OutputSettingsTree->Branch("numFaces", &numFaces_save, "numFaces");
  // OutputSettingsTree->Branch("numSearchPeaks", &numSearchPeaks, "numSearchPeaks/I");
  // OutputSettingsTree->Branch("thresholdMin", &thresholdMin, "thresholdMin/I");
  // OutputSettingsTree->Branch("thresholdStep", &thresholdStep, "thresholdStep/D");
  // OutputSettingsTree->Branch("thresholdSteps", &thresholdSteps_v, "thresholdSteps/D");
  // OutputSettingsTree->Branch("interpolationTimeStep", &interpolationTimeStep, "interpolationTimeSteps/D");
  // OutputSettingsTree->Branch("numBinsToIntegrate", &numBinsToIntegrate, "numBinsToIntegrate/I");
  //
  // OutputSettingsTree->Branch("numRadii", &numRadii_v);
  // OutputSettingsTree->Branch("numRadiiScanned", &numRadiiScanned);
  // OutputSettingsTree->Branch("startingRadiusBin", &startingRadiusBin);
  // OutputSettingsTree->Branch("numPols", &numPols_v, "numPols");
  // OutputSettingsTree->Branch("radii", &radii, "radii[numRadii]");
  // OutputSettingsTree->Branch("recoFilterThreshold", &recoFilterThreshold, "recoFilterThreshold[numPols]/D");
  // OutputSettingsTree->Branch("recoFilterThresholdBin", &recoFilterThresholdBin, "recoFilterThresholdBin[numPols]/I");
  // OutputSettingsTree->Branch("recoFilterWavefrontRMSCut", &recoFilterWavefrontRMSCut, "recoFilterWavefrontRMSCut[numPols]/D");
  // OutputSettingsTree->Fill();

  // TTree* OutputTree=new TTree("OutputTree", "OutputTree");
  // // reconstruction information
  // OutputTree->Branch("runReconstruction", &runReconstruction, "runReconstruction/O");
  //
  // OutputTree->Branch("peakCorr_single", &peakCorr_single, "peakCorr_single[2]/D");
  // OutputTree->Branch("peakTheta_single", &peakTheta_single, "peakTheta_single[2]/I");
  // OutputTree->Branch("peakPhi_single", &peakPhi_single, "peakPhi_single[2]/I");
  // OutputTree->Branch("minCorr_single", &minCorr_single, "minCorr_single[2]/D");
  // OutputTree->Branch("meanCorr_single", &meanCorr_single, "meanCorr_single[2]/D");
  // OutputTree->Branch("rmsCorr_single", &rmsCorr_single, "rmsCorr_single[2]/D");
  // OutputTree->Branch("peakSigma_single", &peakSigma_single, "peakSigma_single[2]/D");
  // OutputTree->Branch("run",&runNumOut, "run/I");
  // runNumOut=runNum;
  //
  // OutputTree->Branch("isCalpulser", &isCalpulser, "isCalpulser/O");
  // OutputTree->Branch("isSoftTrigger", &isSoftTrigger, "isSoftTrigger/O");
  // OutputTree->Branch("unixTime", &unixTime);
  // OutputTree->Branch("unixTimeUs", &unixTimeUs);
  // OutputTree->Branch("eventNumber", &eventNumber);
  // OutputTree->Branch("maxPeakVfromSim", &maxPeakVfromSim);
  // OutputTree->Branch("PeakVfromSim", &PeakVfromSim, "peakVfromSim[16][2]/D");
  //
  // // simulation parameters
  // OutputTree->Branch("weight", &weight_out, "weight/D");
  // OutputTree->Branch("flavor", &flavor, "flavor/I");
  // OutputTree->Branch("nu_nubar", &nu_nubar, "nu_nubar/I");
  // OutputTree->Branch("energy", &energy, "energy/D");
  // OutputTree->Branch("posnu", &posnu, "posnu[3]/D");
  // OutputTree->Branch("viewAngle", &viewAngle, "viewAngle[16][2]/D");
  // OutputTree->Branch("viewAngleAvg", &viewAngleAvg, "viewAngleAvg[2]/D");

  int eventSim = 0;
  cerr<<"Run "<<runNum<<" has a starEvery of "<<starEvery<<" and "<<numEntries<<" total events"<<endl;
  for(Long64_t event=0;event<numEntries;event++) {
    if(event%starEvery==0) {
      std::cout << "*";
    }

    eventTree->GetEntry(event);
    if(hasFilterFile){
      filterTree->GetEntry(event);
    }

    if (isSimulation == false){
      unixTime=(int)rawAtriEvPtr->unixTime;
      unixTimeUs=(int)rawAtriEvPtr->unixTimeUs;
      eventNumber=(int)rawAtriEvPtr->eventNumber;
    }
    if(eventNumber!=39072) continue;

    else {
      eventNumber = event;
    }

    if (isSimulation == true){
      bool foundNextSimEvent = false;

      while (foundNextSimEvent == false){
        simTree->GetEntry(eventSim);
        if (reportPtr->stations[0].Global_Pass != 0 ){
          flavor = eventPtr->nuflavorint;
          nu_nubar = eventPtr->nu_nubar;
          energy = eventPtr->pnu;
          posnu[0] = eventPtr->Nu_Interaction[0].posnu.GetX();
          posnu[1] = eventPtr->Nu_Interaction[0].posnu.GetY();
          posnu[2] = eventPtr->Nu_Interaction[0].posnu.GetZ();
          weight = eventPtr->Nu_Interaction[0].weight;
          maxPeakVfromSim = reportPtr->stations[0].max_PeakV;
          for (int i = 0; i < 4; i++){
            for (int ii = 0; ii < 4; ii++){
              int chan = ii +4*i;
              for (int j = 0; j < reportPtr->stations[0].strings[ii].antennas[i].PeakV.size(); j++){
                PeakVfromSim[chan][j] = reportPtr->stations[0].strings[ii].antennas[i].PeakV[j];
              }
            }
          }

          int avgCounter[2];
          avgCounter[0] = 0;       avgCounter[1] = 0;
          viewAngleAvg[0] = 0.;        viewAngleAvg[1] = 0.;
          for (int i = 0; i < 16; i++){
            for (int ii = 0; ii < 2; ii++){
              viewAngle[i][ii] = 0.;
            }
          }
          for (int i = 0; i < reportPtr->stations[0].strings.size(); i++){
            for (int ii = 0; ii < reportPtr->stations[0].strings[i].antennas.size(); ii++){
              int channel = 4*i+ii;
              for (int iii = 0; iii < reportPtr->stations[0].strings[i].antennas[ii].view_ang.size(); iii++){
                viewAngleAvg[iii] += reportPtr->stations[0].strings[i].antennas[ii].view_ang[iii];
                avgCounter[iii]++;
                viewAngle[channel][iii] = reportPtr->stations[0].strings[i].antennas[ii].view_ang[iii];
              }
            }
          }
          for (int i = 0; i < 2; i++){
            if (avgCounter[i] == 0) {
              viewAngleAvg[i] = 0.;
            } else {
              viewAngleAvg[i] = viewAngleAvg[i]/(double)avgCounter[i];
            }
          }
          foundNextSimEvent=true;
        }
        eventSim++;
      }
    } else {
      posnu[0] = -10000000;
      posnu[1] = -10000000;
      posnu[2] = -10000000;
      flavor = -1;
      nu_nubar = -1;
      energy = -1.;
    }

    if(!isSimulation){
      realAtriEvPtr = new UsefulAtriStationEvent(rawAtriEvPtr, AraCalType::kLatestCalib);
    }

    if (isSimulation){
      isCalpulser = false;
      isSoftTrigger = false;
    } else{
      isCalpulser = rawAtriEvPtr->isCalpulserEvent();
      isSoftTrigger = rawAtriEvPtr->isSoftwareTrigger();
      weight = 1.;
    }

    bool analyzeEvent = false;
    if (calpulserRunMode == 0) { analyzeEvent = true; } // analyze all events
    if (calpulserRunMode == 1 && isCalpulser == false && isSoftTrigger == false) { analyzeEvent = true; } // analyze only RF-triggered, non-calpulser events
    if (calpulserRunMode == 2 && isCalpulser == true) { analyzeEvent = true; } // analyze only calpulser events
    if (calpulserRunMode == 3 && isSoftTrigger == true) { analyzeEvent = true; } // analyze only software triggered  events
    if (analyzeEvent == true){

      weight_out = weight;
      if(!isSimulation)
      hasDigitizerError = !(qualCut->isGoodEvent(realAtriEvPtr));
      else
      hasDigitizerError=false;
      //if the event has a  digitizer error, skip it
      if(hasDigitizerError){
        // OutputTree->Fill(); //fill this anyway with garbage
        if (isSimulation == false) {
          delete realAtriEvPtr;
        }
        continue; //don't do any further processing on this event
      }

      int radiusBin_adjusted = radiusBin-startingRadiusBin;

      vector<double> chan_SNRs;
      if(hasFilterFile){
        for(int i=0; i<16; i++){
          chan_SNRs.push_back(VPeakOverRMS[i]);
          //printf("Event %d: The SNR for chan %d is %.2f \n",event,i,chan_SNRs[i]);
        }
      }

      vector <int> chan_list_V;
      vector <int> chan_list_H;
      for(int chan=0; chan<=7; chan++){
        chan_list_V.push_back(chan);
        chan_list_H.push_back(chan+8);
      }

      if(station_num==2){
        //for station 2, we need to exclude channel 15 from the analysis
        chan_list_H.erase(remove(chan_list_H.begin(), chan_list_H.end(), 15), chan_list_H.end());
      }
      else if(station_num==3){
        // for station 3 years 2014, 2015, 2016, we need to drop string 4 (channels 3, 7, 11, 15) altogether above some run
        if(
          (!isSimulation && runNum>getA3BadRunBoundary())
          ||
          (isSimulation && yearConfig>2)

        ){			// drop string four
          chan_list_V.erase(remove(chan_list_V.begin(), chan_list_V.end(), 3), chan_list_V.end());
          chan_list_V.erase(remove(chan_list_V.begin(), chan_list_V.end(), 7), chan_list_V.end());
          chan_list_H.erase(remove(chan_list_H.begin(), chan_list_H.end(), 11), chan_list_H.end());
          chan_list_H.erase(remove(chan_list_H.begin(), chan_list_H.end(), 15), chan_list_H.end());
        }
      }

      // TH2D *map_V_raytrace = theCorrelators[radiusBin_adjusted]->getInterferometricMap_RT_select(settings, detector, realAtriEvPtr, Vpol, isSimulation, chan_list_V);
      // TH2D *map_H_raytrace = theCorrelators[radiusBin_adjusted]->getInterferometricMap_RT_select(settings, detector, realAtriEvPtr, Hpol, isSimulation, chan_list_H);
      int solNum = 0;
      TH2D *map_V_raytrace = theCorrelators[radiusBin_adjusted]->getInterferometricMap_RT_select_NewNormalization_SNRweighted(settings, detector, realAtriEvPtr, Vpol, isSimulation, chan_list_V, chan_SNRs, solNum);
      TH2D *map_H_raytrace = theCorrelators[radiusBin_adjusted]->getInterferometricMap_RT_select_NewNormalization_SNRweighted(settings, detector, realAtriEvPtr, Hpol, isSimulation, chan_list_H, chan_SNRs, solNum);

      // getCorrMapPeak_wStats(map_V_raytrace, peakTheta_single[0], peakPhi_single[0], peakCorr_single[0], minCorr_single[0], meanCorr_single[0], rmsCorr_single[0], peakSigma_single[0]);
      // getCorrMapPeak_wStats(map_H_raytrace, peakTheta_single[1], peakPhi_single[1], peakCorr_single[1], minCorr_single[1], meanCorr_single[1], rmsCorr_single[1], peakSigma_single[1]);

      //cout<<"For event "<<event<<" the v corr is "<<peakCorr_single[0]<<endl;

      bool print_maps = true;
      if(print_maps){
        gStyle->SetOptStat(0);
        TCanvas *cMaps = new TCanvas("","",2*1100,850);
        cMaps->Divide(2,1);
        cMaps->cd(1);
        map_V_raytrace->Draw("colz");
        cMaps->cd(2);
        map_H_raytrace->Draw("colz");
        char save_temp_title[400];
        sprintf(save_temp_title,"/users/PCON0003/cond0068/ARA/AraRoot/analysis/plots/interf_maps/double_pulse/A%i_Run%d_Ev%d_Maps_FromRecoCode.png",station_num,runNum,event);
        cMaps->SaveAs(save_temp_title);
        delete cMaps;
      }

      delete map_V_raytrace;
      delete map_H_raytrace;


      bool doContributingMaps=false;
      if(doContributingMaps){
        stringstream ss1;
        vector<string> titlesForGraphs;
        vector <TH2D*> individuals;

        double SNR_scaling=0.;

        for(int i=8; i<16; i++){
          for(int j=i+1; j<16; j++){
            ss1.str("");
            ss1<<"Pair "<<i<<" and "<<j;
            titlesForGraphs.push_back(ss1.str());
            TH2D *map = theCorrelators[radiusBin_adjusted]->getInterferometricMap_RT_NewNormalization_PairSelect(settings, detector, realAtriEvPtr, Hpol, isSimulation, i, j, solNum);

            // now do the SNR scaling
            double this_snr_product = chan_SNRs[i] * chan_SNRs[j];
            // printf("Weighting term for %d, %d is %.3f \n", i, j, this_snr_product);
            map->Scale(this_snr_product);

            SNR_scaling+=this_snr_product;

            individuals.push_back(map);
          }
        }

        for(int i=0; i<individuals.size(); i++){
          individuals[i]->Scale(1./SNR_scaling);
        }

        // compute the average myself manually
        TH2D *average = (TH2D*) individuals[0]->Clone();
        for(int i=0; i<individuals.size(); i++){
          average->Add(individuals[i]);
        }
        // average->Scale(1./28);
        average->SetTitle("Summed Maps");

        vector<double> mins;
        vector<double> maxs;
        for(int i=0; i<individuals.size(); i++){
          mins.push_back(individuals[i]->GetMinimum());
          maxs.push_back(individuals[i]->GetMaximum());
        }
        std::sort(mins.begin(), mins.end()); //sort smallest to largest
        std::sort(maxs.begin(), maxs.end()); //sort smallest to largest
        std::reverse(maxs.begin(), maxs.end()); //reverse order to get largest to smallest

        TCanvas *cMaps2 = new TCanvas("","",8*850,4*850);
        cMaps2->Divide(7,5);
        for(int i=0; i<individuals.size(); i++){
          cMaps2->cd(i+1);
          individuals[i]->Draw("colz");
          individuals[i]->GetZaxis()->SetRangeUser(mins[0],maxs[0]);
          individuals[i]->SetTitle(titlesForGraphs[i].c_str());
          gStyle->SetTitleFontSize(0.07);
        }
        cMaps2->cd(35);
        average->Draw("colz");
        char save_temp_title[400];
        sprintf(save_temp_title,"/users/PCON0003/cond0068/ARA/AraRoot/analysis/plots/interf_maps/double_pulse/pairs/A%i_Run%d_Ev%d_Maps_FromRecoCode_pairs.png",station_num,runNum,event);
        cMaps2->SaveAs(save_temp_title);
        delete cMaps2;
      }
      // OutputTree->Fill();

      if (isSimulation == false) {
        delete realAtriEvPtr;
      }
    }
  }

  // OutputFile->Write();
  // OutputFile->Close();
  if(hasFilterFile)
  filterFile->Close();
  fp->Close();

  for (int i = startingRadiusBin; i < startingRadiusBin-numRadiiScanned; i++){
    delete theCorrelators[i];
  }

  delete settings;

  cout<<endl;
  printf("Done! Run Number %d \n", runNum);
}
