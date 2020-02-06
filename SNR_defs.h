//Includes
#include <iostream>
#include <iomanip>
#include <sstream>

int getMaxBin(TGraph *gr){

  double t, v, max;
  max = 0.;
  int maxBin = 0;
  //cout<<"gr->GetN(): "<<gr->GetN()<<endl;

  for(int s=0; s<gr->GetN(); s++){

    gr->GetPoint(s, t, v);
    if( fabs(v) > max ){
      max = fabs(v);
      maxBin = s;
    }
  }
  return maxBin;
}


TGraph* getSqrtVoltageSquaredSummedWaveform(TGraph *gr, int nIntSamp){

  TGraph *grV2Summed = new TGraph();
  double t, v, t0;
  double sum;
  // cout << gr->GetN() << endl;
  for(int p=0; p<gr->GetN()-nIntSamp; p++){

    sum=0.;
    for(int q=p; q<p+nIntSamp; q++){
      gr->GetPoint(q,t,v);
      sum+=(v*v);
      if(q==p) t0 = t;
    }
    sum /= (double)nIntSamp;
    grV2Summed->SetPoint(p, t0, sqrt(sum));

  }

  return grV2Summed;
}

void setMeanAndSigmaInNoMax(TGraph *gr, double *stats){

  int bin = gr->GetN();
  int MaxBin = getMaxBin( gr );
  //cout<<"MaxBin: "<<MaxBin<<endl;
  int binCounter=0;

  double mean =0;
  double sigma=0;
  double t, v;

  if( MaxBin <= bin/4 ){

    for (int i=MaxBin+bin/4; i<bin; i++){
      gr->GetPoint(i, t, v);
      mean  += v;
      sigma += v * v;
      binCounter++;
    }
  }

  else if( MaxBin >= 3*bin/4 ){

    for (int i=0; i<MaxBin-bin/4; i++){
      gr->GetPoint(i, t, v);
      mean  += v;
      sigma += v * v;
      binCounter++;
    }
  }

  else{

    for (int i=0; i<MaxBin-bin/4; i++){
      gr->GetPoint(i, t, v);
      mean  += v;
      sigma += v * v;
      binCounter++;
    }

    for (int i=MaxBin+bin/4; i<bin; i++){
      gr->GetPoint(i, t, v);
      mean  += v;
      sigma += v * v;
      binCounter++;
    }
  }

  mean  = mean / (double)binCounter;
  sigma = TMath::Sqrt( ( sigma - ((double)binCounter * mean * mean )) / (double)(binCounter - 1) );
  //cout<<"mean="<<mean<<"\tsigma="<<sigma<<endl;
  //delete gr;

  stats[0] = mean;
  stats[1] = sigma;

}

void getChannelSlidingV2SNR_UW(const vector<TGraph *>& cleanEvent, int nIntSamp_V, int nIntSamp_H, float *snrArray){
  /*
  Returns the sliding V^2 SNR peak time as the number of sigmas between the V^2 peak and mean for all channels. This is UW definition of SNR
  inputs: vector of TGraphs, sampling for V and H channels, SNR array to be filled.
  */
  double sigma;
  double mean;
  double absPeak;
  double statsArray[2]={0};

  double t, v;
  int bin;


  TGraph *v2Gr = new TGraph();

  for ( int ch=0; ch<(int)cleanEvent.size(); ch++){

    absPeak = 0.;
    v2Gr = getSqrtVoltageSquaredSummedWaveform(cleanEvent[ch], (ch<8?nIntSamp_V:nIntSamp_H));

    bin   = v2Gr->GetN();
    //setMeanAndSigmaInNoMax(gr,statsArray);
    setMeanAndSigmaInNoMax(v2Gr, statsArray);

    mean  = statsArray[0];
    sigma = statsArray[1];

    for (int binCounter=0; binCounter<bin; binCounter++){

      v2Gr->GetPoint(binCounter, t, v);

      /* check if SNR > threshold*sigma */
      //if ( fabs(v - mean) > threshold * sigma ){
      if( fabs(v-mean) > absPeak ){
        //totalPassedChnl += 1;
        //passThreshold[ch] = 1;
        absPeak = fabs(v-mean);
      }
    }//end of binCounter

    //delete gr;
    if(sigma>0)
    snrArray[ch] = static_cast<float>(absPeak / sigma);
    else
    snrArray[ch] = 0.f;

    ///cout<<"ch: "<<ch<<" sigma: "<<sigma<<" snr: "<<snrArray[ch]<<endl;
    delete v2Gr;

  }//end of ch
}



void getThirdVPeakOverRMS(const vector<TGraph *>& grWaveformsInt, vector<int> polarizations, vector<int> antenna_numbers, vector<int> chan_exclusion_list, double RMS_SoftTrigger[16], double RMS_RFTrigger[16], vector<double> &ThirdVpeakOverRms){

  vector<double> VPeak;
  vector<double> VPeakTimes;

  getAbsMaximum(grWaveformsInt, VPeakTimes, VPeak);

  int const nGraphs = 16;
  vector<double> WaveformRMS;
  WaveformRMS.resize(nGraphs);
  for (int i = 0; i < nGraphs; i++){
    if (RMS_SoftTrigger[i] == RMS_SoftTrigger[i]){
      WaveformRMS[i] = RMS_SoftTrigger[i];
    } else {
      if (RMS_RFTrigger[i] == RMS_RFTrigger[i]){
        WaveformRMS[i] = RMS_RFTrigger[i];
      }
    }
  }
  vector<double> waveformRMS_50ns;

  double interpolationTimeStep = grWaveformsInt[0]->GetX()[1]-grWaveformsInt[0]->GetX()[0];
  int first50ns = (int)(50./interpolationTimeStep);
  getRMS(grWaveformsInt, waveformRMS_50ns, first50ns);

  vector<double> VPeakOverRMS;
  VPeakOverRMS.resize(16);
  for (int i = 0; i < 16; i++){
    VPeakOverRMS[i] = VPeak[i]/WaveformRMS[i];
  }

  vector<double> ThirdVPeakOverRMS;
  vector<double> vPeakOverRms;

  ThirdVPeakOverRMS.resize(3);

  vector<double> vPeakOverRms_V;
  vector<double> vPeakOverRms_H;
  vector<double> vPeakOverRms_Total;

  for (int chan = 0; chan < vPeakOverRms.size(); chan++){
    if(std::find(chan_exclusion_list.begin(), chan_exclusion_list.end(), antenna_numbers[chan]) == chan_exclusion_list.end()){ //if this channel is *not* excluded
      if (polarizations[chan] == 0){
        vPeakOverRms_V.push_back(vPeakOverRms[chan]);
      }
      if (polarizations[chan] == 1){
        vPeakOverRms_H.push_back(vPeakOverRms[chan]);
      }
      vPeakOverRms_Total.push_back(vPeakOverRms[chan]);
    }
  }

  sort(vPeakOverRms_V.begin(), vPeakOverRms_V.end());
  sort(vPeakOverRms_H.begin(), vPeakOverRms_H.end());
  sort(vPeakOverRms_Total.begin(), vPeakOverRms_Total.end());

  ThirdVpeakOverRms[0] = vPeakOverRms_V[(int)vPeakOverRms_V.size()-3];
  ThirdVpeakOverRms[1] = vPeakOverRms_H[(int)vPeakOverRms_H.size()-3];
  ThirdVpeakOverRms[2] = vPeakOverRms_Total[(int)vPeakOverRms_Total.size()-3];
}
