//Includes
#include <iostream>
#include <iomanip>
#include <sstream>
#include "Riostream.h"

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
         //passThreshold[ch] = 0;
         //saturated[ch]= 0;
         //AraAntPol::AraAntPol_t polType = tempGeom->getStationInfo(stationId)->getAntennaInfo(ch)->polType;

         //if ( polType == AraAntPol::kVertical ){
         //          //cout<<"mean="<<mean<<"\tsigma="<<sigma<<endl;
         //gr = theEvent->getGraphFromRFChan(ch);
         //gr = cleanEvent[ch];
         //volts = gr->GetY();

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
               //if( ch<8 ) totalPassedVpol += 1;
               //else       totalPassedHpol += 1;
               //if ( polType == AraAntPol::kVertical){ totalPassedVpol += 1;
               //} else if ( polType == AraAntPol::kHorizontal){ totalPassedHpol += 1;
               //} else { cerr<<"********************* polType not vpol or hpol !!! ***********************"<<endl;
               //}
               //break;
            }

            /* check if saturated at +/- 1000mV */
            //if( fabs( fabs(v) - 1000. ) < 0.5 ){

            //   saturated[ch] = 1;
            //}


         }//end of binCounter

      //delete gr;
      if(sigma>0)
      snrArray[ch] = static_cast<float>(absPeak / sigma);
      else
      snrArray[ch] = 0.f;

      ///cout<<"ch: "<<ch<<" sigma: "<<sigma<<" snr: "<<snrArray[ch]<<endl;
      delete v2Gr;

   }//end of ch
   /*
   for(int ch=0; ch<16; ch++){
   goodChan[ch] = (chanMask[ch] && passThreshold[ch] );
   if( saturated[ch] ) goodChan[ch] = 0;
   totalPassedChnl += goodChan[ch];
   totalSatChnl    += saturated[ch];
   if(ch<8){ totalPassedVpol += goodChan[ch]; totalSatVpol += saturated[ch]; }
   else    { totalPassedHpol += goodChan[ch]; totalSatHpol += saturated[ch]; }
   }
   */
/* only look at Vpols now */
/*
numSatChan = totalSatVpol;
nchnlArray[0] = totalPassedChnl;
nchnlArray[1] = totalPassedVpol;
nchnlArray[2] = totalPassedHpol;
*/
}
