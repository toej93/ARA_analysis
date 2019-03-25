#include <iostream>
#include <cstdlib>
#include <sstream>
#include <stdio.h>
#include <vector>
#include <complex>
#include <algorithm>
#include <cmath>


#include "TGraph.h"
#include "TRandom.h"
#include "TRandom2.h"
#include "TRandom3.h"

#include "tools_Cuts.h"
using namespace std;

bool IsGoodForCalib(int station, int year, int runNum){

  //this function is from tools_Cuts (https://github.com/clark2668/a23_analysis_tools/blob/master/tools_Cuts.h)
  //so you'll need to download and #include that


  //we need to open the CW file

  char summary_file_name[400];
  sprintf(summary_file_name,"/fs/scratch/PAS0654/ara/10pct/CWID/A%d/%d/CWID_station_%d_run_%d.root",station,year,station,runNum);
  TFile *NewCWFile = TFile::Open(summary_file_name);
  if(!NewCWFile) {
    std::cerr << "Can't open new CW file\n";
    return -1;
  }
  TTree* NewCWTree = (TTree*) NewCWFile->Get("NewCWTree");   
  if(!NewCWTree) {
    std::cerr << "Can't find NewCWTree\n";
    return -1;
  }
  vector<vector<double> > *badFreqs_fwd =0;
  vector<vector<double> > *badFreqs_back=0;
  vector<vector<double> > *badSigmas_fwd=0;
  vector<vector<double> > *badSigmas_back=0;
  vector<vector<double> > *badFreqs_baseline=0;

  // inside, there are five trees
  // 2 x bad frequencies identified with the Carl's phase variance (forward and backwards running)
  // 2 x how bad they are (the sigmas)
  // 1 x bad frequencies identified with Eugene's "baseline violation" technique from Testbed

  NewCWTree->SetBranchAddress("badFreqs_fwd",&badFreqs_fwd);
  NewCWTree->SetBranchAddress("badSigmas_fwd",&badSigmas_fwd);
  NewCWTree->SetBranchAddress("badFreqs_back",&badFreqs_back);
  NewCWTree->SetBranchAddress("badSigmas_back",&badSigmas_back);
  NewCWTree->SetBranchAddress("badFreqs_baseline",&badFreqs_baseline);

  int numEntries = NewCWTree->GetEntries();
  Long64_t starEvery=numEntries/200;
  if(starEvery==0) starEvery++;

  //now to loop over events
  for(int event=0; event<numEntries; event++){

    //this function is from tools_Cuts (https://github.com/clark2668/a23_analysis_tools/blob/master/tools_Cuts.h)
    //so you'll need to download and #include that
    
    if(isBadEvent(station, year, runNum, event)){
      //     cout << "Is bad event!!!!" << endl;
      continue;
    }
    //    cout << "Is good event!!!!" << endl;

    NewCWTree->GetEntry(event);

    bool isCutonCW_fwd[2]; isCutonCW_fwd[0]=false; isCutonCW_fwd[1]=false;
    bool isCutonCW_back[2]; isCutonCW_back[0]=false; isCutonCW_back[1]=false;
    bool isCutonCW_baseline[2]; isCutonCW_baseline[0]=false; isCutonCW_baseline[1]=false;
			
    //first, check the baseline technique
    for(int pol=0; pol<badFreqs_baseline->size(); pol++){
      vector<double> badFreqListLocal_baseline = badFreqs_baseline->at(pol);
      if(badFreqListLocal_baseline.size()>0) isCutonCW_baseline[pol]=true;
    }

    //second, check the "forward" looking phase variance list
    double threshCW = 1.0;
    vector<double> badFreqList_fwd;
    vector<double> badSigmaList_fwd;
    for(int pol=0; pol<badFreqs_fwd->size(); pol++){
      badFreqList_fwd=badFreqs_fwd->at(pol);
      badSigmaList_fwd=badSigmas_fwd->at(pol);
      for(int iCW=0; iCW<badFreqList_fwd.size(); iCW++){
	if(
	   badSigmaList_fwd[iCW] > threshCW 
	   && 
	   abs(300. - badFreqList_fwd[iCW]) > 2.
	   &&
	   abs(500. - badFreqList_fwd[iCW]) > 2.
	   &&
	   abs(125. - badFreqList_fwd[iCW]) > 2.
	   ){
	  isCutonCW_fwd[pol] = true;
	}
      }
    }

    //third (and finally), check the "backwards" looking phase variance list
    vector<double> badFreqList_back;
    vector<double> badSigmaList_back;
    for(int pol=0; pol<badFreqs_back->size(); pol++){
      badFreqList_back=badFreqs_back->at(pol);
      badSigmaList_back=badSigmas_back->at(pol);
      for(int iCW=0; iCW<badFreqList_back.size(); iCW++){
	if(
	   badSigmaList_back[iCW] > threshCW 
	   && 
	   abs(300. - badFreqList_back[iCW]) > 2.
	   &&
	   abs(500. - badFreqList_back[iCW]) > 2.
	   &&
	   abs(125. - badFreqList_back[iCW]) > 2.
	   ){
	  isCutonCW_back[pol] = true;
	}
      }
    }
    badFreqs_fwd->clear();
    badFreqs_back->clear();
    badSigmas_fwd->clear();
    badSigmas_back->clear();
    badFreqs_baseline->clear();
    NewCWFile->Close();
    delete NewCWFile;
    for(int pol=0; pol<2; pol++){
      //   cout << "got here!!!!" << endl;
      //if it's not contaminated by *any* CW, do whatever you want
      //    if(isCutonCW_fwd[pol]==false && isCutonCW_back[pol]==false && isCutonCW_baseline[pol]==false){
      if(/*!isCutonCW_fwd[pol] && !isCutonCW_back[pol] && */!isCutonCW_baseline[pol]){
	//	cout << "Is good event!!!!" << endl;
	
	return true;
      }
      else{
	//	cout << "Is bad event!!!!" << endl;
	return false;
      }
			
    } //cal pulser
		
  } //loop over events
 
}

Double_t get3rdPeakSqVal(double *vsquared) //get 3rd highest v^2
{
  vector <double> peakVal;
  for(int i = 0; i<16; i++){
    peakVal.push_back(vsquared[i]);
  }
  std::nth_element(peakVal.begin(), peakVal.begin()+2, peakVal.end(), std::greater<double>());
  return peakVal[2];
}


int getPeakBin(TGraph *gr) 
{
  double x,y;
  gr->GetPoint(0,x,y);
  double peakVal=y;
  int peakBin=0;
  for(int i=0;i<gr->GetN();i++) {
    gr->GetPoint(i,x,y);
    if(peakVal<y) {
      peakVal=y;
      peakBin=i;
    }      
  }
  return peakBin;
}

double getNegativePeak(TGraph *gr)
{
  double x,y;
  gr->GetPoint(0,x,y);
  double peakVal=abs(y);
  int peakBin=0;
  for(int i=0;i<gr->GetN();i++) {
    gr->GetPoint(i,x,y);
    if( y>0 ) continue;
    if( abs(peakVal)<abs(y) ) {
      peakVal=y;
      peakBin=i;
    }      
  }
  //return peakBin;
  return peakVal;
}

int getBinsforRMS(TGraph *gr)
{
  double y;
  int nonZeroBins;
  for(int i=0;i<gr->GetN();i++) {
    //cout << gr->GetY()[i] << endl;
    if(abs(gr->GetY()[i])>0) nonZeroBins+=1;
  }
  return nonZeroBins;
}

void get3rdPeakSqValSamePol(double *vsquared, vector<double> &peak) //get 3rd highest v^2 for the same polarization
{
  vector <double> peakValVpol;
  vector <double> peakValHpol;
  for(int i = 0; i<8; i++){
    peakValVpol.push_back(vsquared[i]);
  }
  
  for(int i = 8; i<15; i++){
    peakValHpol.push_back(vsquared[i]);
  }
  std::nth_element(peakValVpol.begin(), peakValVpol.begin()+2, peakValVpol.end(), std::greater<double>());
  std::nth_element(peakValHpol.begin(), peakValHpol.begin()+2, peakValHpol.end(), std::greater<double>());
  /*
    if(peakValHpol[2]>peakValVpol[2]){
    return peakValHpol[2];
    }
    else return peakValVpol[2];
  */
  
  peak.push_back(peakValVpol[2]);
  peak.push_back(peakValHpol[2]);
  //cout << peak[0] <<endl;
  // return peak;
}

void get3rdsmallest(double *vsquared, vector<double> &peak) //get 3rd highest v^2 for the same polarization
{
  vector <double> peakValVpol;
  vector <double> peakValHpol;
  for(int i = 0; i<8; i++){
    peakValVpol.push_back(1/vsquared[i]);
  }
  
  for(int i = 8; i<15; i++){
    peakValHpol.push_back(1/vsquared[i]);
  }
  std::nth_element(peakValVpol.begin(), peakValVpol.begin()+2, peakValVpol.end(), std::greater<double>());
  std::nth_element(peakValHpol.begin(), peakValHpol.begin()+2, peakValHpol.end(), std::greater<double>());
  /*
    if(peakValHpol[2]>peakValVpol[2]){
    return peakValHpol[2];
    }
    else return peakValVpol[2];
  */
  
  peak.push_back(1/peakValVpol[2]);
  peak.push_back(1/peakValHpol[2]);
  //cout << peak[0] <<endl;
  // return peak;
}

TGraph *makeSummedVsquaredWForm(TGraph *grWave, double integration_window) {
 
  double *volts = grWave->GetY();
  double *time = grWave->GetX();
  int length=grWave->GetN();
  vector <double> integral;
  double nBins_window = integration_window/0.5;//5 ns is the interpolation amount
  for(int i=0; i<=length; i++){
    double sum=0;
    for(int j=i; j<=i+nBins_window; j++){//loop over 10 ns. dt=0.5, then need 20 bins
      sum+=volts[j]*volts[j];
    }//loop over 10 ns
    
    if(i>length-nBins_window)
      {
	integral.push_back(0);
      }
    else{
      integral.push_back(sum);
    }
    
  }//loop over number of bins
 
  TGraph *grInvInv = new TGraph(length,time,&integral[0]);
  //     for(int i=0;i<length;i++) {
  //      cout << oldX[i] << "\t" << invInvSpectrum[i] << endl;
  //     }
  return grInvInv;
 
}


TGraph *makeVsquaredWForm(TGraph *grWave) {
 
  double *volts = grWave->GetY();
  double *time = grWave->GetX();
  int length=grWave->GetN();
  vector <double> squaredV;
  for(int i=0; i<=length; i++){
    squaredV.push_back(volts[i]*volts[i]);
  }//loop over number of bins
 
  TGraph *grInvInv = new TGraph(length,time,&squaredV[0]);
  //     for(int i=0;i<length;i++) {
  //      cout << oldX[i] << "\t" << invInvSpectrum[i] << endl;
  //     }
  return grInvInv;
 
}

bool isGlitch(TGraph *wform){
  
  TGraph *Waveform_Interpolated = FFTtools::getInterpolatedGraph(wform,0.5);
  //delete wform;
  TGraph *Waveform_Padded = FFTtools::padWaveToLength(Waveform_Interpolated, Waveform_Interpolated->GetN()+6000);
  delete Waveform_Interpolated;
  TGraph *Waveform_Cropped=FFTtools::cropWave(Waveform_Padded,-300.,300.);
  delete Waveform_Padded;
  TGraph* spectra = FFTtools::makePowerSpectrumMilliVoltsNanoSeconds(Waveform_Cropped);
  delete Waveform_Cropped;
    
  double pow_bins;
  double integral;
  double frac_pow;
      
  int num_bins = spectra->GetN();
  //	cout << "number of bins is " << num_bins << endl;
  double integral_tmp = 0;
  for(int samp=0; samp<num_bins; samp++){
    integral_tmp+=spectra->GetY()[samp];
  }
  integral=integral_tmp;

  //	cout << "The integral is " << integral_tmp << endl;
  double power;
  for(int j = 0; j < 46; j++){//Bin corresponds to 75 MHz
    double freq_bin = spectra->GetX()[j];
    double magnitude = spectra->GetY()[j];
    power+=magnitude;
    //	  cout << "Power is " << power << endl;
  }

  delete spectra;
  pow_bins=power;
  power = 0;
  frac_pow = pow_bins/integral;
  //	  cout << "Fraction of power in the first 6 bins is " << frac_pow[i] << endl;
  if(frac_pow>=0.3){
    return true;
    // cout << "Found a GLITCH!!!!" << endl;
  }
  else return false;
  
}

//Inverse FFT
TGraph *makeInvFFTPlot(TGraph *inputMag)
{
  Double_t *freqs=inputMag->GetX();
  Double_t *newVmmhz=inputMag->GetY();
  Int_t numFreqs=inputMag->GetN();
  Double_t *vmhz = new Double_t [numFreqs];
  Int_t numPoints=2*(numFreqs-1);
  FFTWComplex *freqDom = new FFTWComplex [numFreqs];
  Double_t df=freqs[1]-freqs[0];
  for(int i=0;i<numFreqs;i++) {
    vmhz[i]=newVmmhz[i];
    //    freqDom[i].re=vmhz[i];
    //    freqDom[i].im=0;
    double phase = 2*M_PI*gRandom->Rndm(0);
    freqDom[i].im=vmhz[i]*sin(phase);
    freqDom[i].re=vmhz[i]*cos(phase);
  }
  Double_t *tempV=FFTtools::doInvFFT(numPoints,freqDom);
  Double_t *newT = new Double_t [numPoints];
  Double_t *newV = new Double_t [numPoints];
  Double_t dt=1./(numPoints*df);
  for(int i=0;i<numPoints;i++) {
    if(i<numPoints/2) {
      Int_t tempInd=(numPoints/2)-(i+1);
      //      std::cout << "First: " << i << "\t" << tempInd << "\n";
      newT[tempInd]=-i*dt*1e3;//convert to ns
      newV[tempInd]=tempV[i]*df*numPoints/sqrt(2);
      //The sqrt(2) is for the positive and negative frequencies
    }
    else {
      Int_t tempInd=numPoints+(numPoints/2)-(i+1);
      //      std::cout << "Second: " << i << "\t" << tempInd << "\n";
      newT[tempInd]=(numPoints-i)*dt*1e3;//convert to ns
      newV[tempInd]=tempV[i]*df*numPoints/sqrt(2);
      //The sqrt(2) is for the positive and negative frequencies
    }
  }
  TGraph *grWave = new TGraph(numPoints,newT,newV);
  delete [] vmhz;
  delete [] newT;
  delete [] newV;
  delete [] freqDom;
  return grWave;

}


//FFT function
/*
  TGraph *makeFFTPlot(TGraph *grWave)
  {
  double *oldY = grWave->GetY();
  double *oldX = grWave->GetX();
  double deltaT=oldX[1]-oldX[0];
  int length=grWave->GetN();
  FFTWComplex *theFFT=FFTtools::doFFT(length,oldY);
     
  int newLength=(length/2)+1;
     
  double *newY = new double [newLength];
  double *newX = new double [newLength];
     
  //    double fMax = 1/(2*deltaT);  // In Hz
  double deltaF=1/(deltaT*length); //Hz
  deltaF*=1e3; //MHz
  //    std::cout << fMax << "\t" << deltaF << "\t" << deltaT << "\t" << length << std::endl;
       
  double tempF=0;
  for(int i=0;i<newLength;i++) {
  float power=FFTtools::getAbs(theFFT[i]);//converting from mV to V;
  if(i>0 && i<newLength-1) power*=2; //account for symmetry
  power*=sqrt(deltaT)/(length); //For time-integral squared amplitude
  power/=sqrt(deltaF);//Just to normalise bin-widths
  //Ends up the same as dt^2, need to integrate the power (multiply by df)
  //to get a meaningful number out.   
           
  //if (power>0 ) power=10*TMath::Log10(power);
  //else power=-1000; //no reason
  newX[i]=tempF;
  newY[i]=power; //Units should be mV/Hz for the y-axis.
  tempF+=deltaF;
  }
   
  TGraph *grPower = new TGraph(newLength,newX,newY);
  delete [] theFFT;
  delete [] newY;
  delete [] newX;
  return grPower;  
  }
*/

TGraph *makeFFTPlot(TGraph *grWave)
{
  double *oldY = grWave->GetY();
  double *oldX = grWave->GetX();
  double deltaT=oldX[1]-oldX[0];
  int length=grWave->GetN();
  FFTWComplex *theFFT=FFTtools::doFFT(length,oldY);
     
  int newLength=(length/2)+1;
     
  double *newY = new double [newLength];
  double *newX = new double [newLength];
     
  //    double fMax = 1/(2*deltaT);  // In Hz
  double deltaF=1/(deltaT*length); //Hz
  deltaF*=1e3; //MHz
  //    std::cout << fMax << "\t" << deltaF << "\t" << deltaT << "\t" << length << std::endl;
       
  double tempF=0;
  for(int i=0;i<newLength;i++) {
    float power=sqrt(2)*FFTtools::getAbs(theFFT[i]);//Adding a factor of sqrt(2) to account for negative freuencies, i.e. integrate from 0-infinity instead of -inf to inf
    power*=1.e-3;//convert to V
           
    //if (power>0 ) power=10*TMath::Log10(power);
    //else power=-1000; //no reason
    newX[i]=tempF;
    newY[i]=power; //Units should be mV/Hz for the y-axis.
    tempF+=deltaF;
  }
   
  TGraph *grPower = new TGraph(newLength,newX,newY);
  delete [] theFFT;
  delete [] newY;
  delete [] newX;
  return grPower;  
}

TGraph *makeFreqV_MilliVoltsNanoSeconds ( TGraph *grWave ) {

  double *oldY = grWave->GetY(); // mV                                                                                                                                                        
  double *oldX = grWave->GetX(); // ns                                                                                                                                                        
  int length=grWave->GetN();

  /*                                                                                                                                                                                          
  // don't modify original valus as it will modify original waveform                                                                                                                          
  for (int i=0; i<length; i++) {                                                                                                                                                              
  oldY[i] = oldY[i] * 1.e-3; //from mV to V                                                                                                                                               
  oldX[i] = oldX[i] * 1.e-9; // from ns to s                                                                                                                                              
  }                                                                                                                                                                                           
  */
  double deltaT = (oldX[1]-oldX[0]) * 1.e-9; // deltaT in s                                                                                                                                   

  FFTWComplex *theFFT=FFTtools::doFFT(length,oldY); // FFT with mV unit                                                                                                                       

  int newLength=(length/2)+1;
  //int newLength=(length+1)/2;                                                                                                                                                               

  double *newY = new double [newLength];
  double *newX = new double [newLength];

  double deltaF=1./(deltaT*(double)length); //Hz                                                                                                                                              
  deltaF*=1e-6; //from Hz to MHz                                                                                                                                                              

  double tempF=0;
  for(int i=0;i<newLength;i++) {
    //float FreqV = FFTtools::getAbs(theFFT[i]) * 1.e-3; // from mV to V                                                                                                                      
    newY[i] = FFTtools::getAbs(theFFT[i]) * 1.e-3; // from mV to V                                                                                                                            
    //newY[i]=FreqV;                                                                                                                                                                          
    newX[i]=tempF;
    tempF+=deltaF;
  }

  TGraph *grPower = new TGraph(newLength,newX,newY);
  delete [] theFFT;
  delete [] newY;
  delete [] newX;
  return grPower;

}

void Exchange( double &a, double &b ) {
  double tmp = a;
  a = b;
  b = tmp;
}

void four1(double *data, const int isign,int nsize) {
  //int n,mmax,m,j,istep,i;
  int nn,mmax,m,j,istep,i;
  double wtemp,wr,wpr,wpi,wi,theta,tempr,tempi;

  //int nn=nsize/2;
  int n=nsize/2;

  nn=n << 1;
  j=1;
  for (i=1;i<nn;i+=2) {
    if (j > i) {
      //SWAP(data[j-1],data[i-1]);
      //SWAP(data[j],data[i]);
      Exchange(data[j-1],data[i-1]);
      Exchange(data[j],data[i]);
    }
    m=n;
    while (m >= 2 && j > m) {
      j -= m;
      m >>= 1;
    }
    j += m;
  }
  mmax=2;
  while (nn > mmax) {
    istep=mmax << 1;
    theta=isign*(6.28318530717959/mmax);
    wtemp=sin(0.5*theta);
    wpr = -2.0*wtemp*wtemp;
    wpi=sin(theta);
    wr=1.0;
    wi=0.0;
    for (m=1;m<mmax;m+=2) {
      for (i=m;i<=nn;i+=istep) {
	j=i+mmax;
	tempr=wr*data[j-1]-wi*data[j];
	tempi=wr*data[j]+wi*data[j-1];
	data[j-1]=data[i-1]-tempr;
	data[j]=data[i]-tempi;
	data[i-1] += tempr;
	data[i] += tempi;
      }
      wr=(wtemp=wr)*wpr-wi*wpi+wr;
      wi=wi*wpr+wtemp*wpi+wi;
    }
    mmax=istep;
  }
}

void realft(double *data, const int isign, int nsize){
  int i, i1, i2, i3, i4;
  double c1=0.5,c2,h1r,h1i,h2r,h2i,wr,wi,wpr,wpi,wtemp,theta;
  //theta=3.141592653589793238/(nsize>>1);
  theta=3.141592653589793238/(double)(nsize>>1);
  if (isign == 1) {
    c2 = -0.5;
    four1(data,1,nsize);
  } else {
    c2=0.5;
    theta = -theta;
  }
  wtemp=sin(0.5*theta);
  wpr = -2.0*wtemp*wtemp;
  wpi=sin(theta);
  wr=1.0+wpr;
  wi=wpi;
  for (i=1;i<(nsize>>2);i++) {
    i2=1+(i1=i+i);
    i4=1+(i3=nsize-i1);
    h1r=c1*(data[i1]+data[i3]);
    h1i=c1*(data[i2]-data[i4]);
    h2r= -c2*(data[i2]+data[i4]);
    h2i=c2*(data[i1]-data[i3]);
    data[i1]=h1r+wr*h2r-wi*h2i;
    data[i2]=h1i+wr*h2i+wi*h2r;
    data[i3]=h1r-wr*h2r+wi*h2i;
    data[i4]= -h1i+wr*h2i+wi*h2r;
    wr=(wtemp=wr)*wpr-wi*wpi+wr;
    wi=wi*wpr+wtemp*wpi+wi;
  }
  if (isign == 1) {
    data[0] = (h1r=data[0])+data[1];
    data[1] = h1r-data[1];
  } else {
    data[0]=c1*((h1r=data[0])+data[1]);
    data[1]=c1*(h1r-data[1]);
    four1(data,-1,nsize);
  }
}

void getDiodeModel(int NFOUR, double TIMESTEP, vector<double>&fdiode_real, vector<double>&diode_real) {

  double maxt_diode = 70.E-9;
  int maxt_diode_bin = (int)( maxt_diode / TIMESTEP );
  double idelaybeforepeak = (int)(13.E-9 / TIMESTEP);
  int iwindow = (int)(4.E-9 / TIMESTEP);
  int ibinshift = NFOUR/4 - (int)( maxt_diode / TIMESTEP );
	
  //  this is our homegrown diode response function which is a downgoing gaussian followed by an upward step function
  TF1 *fdown1=new TF1("fl_down1","[3]+[0]*exp(-1.*(x-[1])*(x-[1])/(2*[2]*[2]))",-300.E-9,300.E-9);
  fdown1->SetParameter(0,-0.8);
  fdown1->SetParameter(1,15.E-9);
  fdown1->SetParameter(2,2.3E-9);
  fdown1->SetParameter(3,0.);
	
  TF1 *fdown2=new TF1("fl_down2","[3]+[0]*exp(-1.*(x-[1])*(x-[1])/(2*[2]*[2]))",-300.E-9,300.E-9);
  fdown2->SetParameter(0,-0.2);
  fdown2->SetParameter(1,15.E-9);
  fdown2->SetParameter(2,4.0E-9);
  fdown2->SetParameter(3,0.);

  TF1 *f_up=new TF1("f_up","[0]*([3]*(x-[1]))^2*exp(-(x-[1])/[2])",-200.E-9,100.E-9);
  f_up->SetParameter(2,7.0E-9);
  f_up->SetParameter(0,1.);
  f_up->SetParameter(1,18.E-9);
  f_up->SetParameter(3,1.E9);
  f_up->SetParameter(0,-1.*sqrt(2.*TMath::Pi())*(fdown1->GetParameter(0)*fdown1->GetParameter(2)+fdown2->GetParameter(0)*fdown2->GetParameter(2))/(2.*pow(f_up->GetParameter(2),3.)*1.E18));


  for (int i=0;i<NFOUR/2;i++) {
    diode_real.push_back(0.);   // first puchback 0. value  (this is actually not standard way though works fine)
    if (i<(int)(maxt_diode/TIMESTEP)) { // think this is same with above commented if
      diode_real[i]=fdown1->Eval((double)i*TIMESTEP)+fdown2->Eval((double)i*TIMESTEP);
      if (i>(int)(f_up->GetParameter(1)/TIMESTEP))
	diode_real[i]+=f_up->Eval((double)i*TIMESTEP);
    }
  }
	
  // diode_real is the time domain response of the diode
  // now get f domain response with realft
  double diode_real_fft[NFOUR];  // double sized array for myconvlv	
  for (int i=0; i<NFOUR; i++) {  // 512 bin added for zero padding
    if ( i<(int)(maxt_diode/TIMESTEP) ) {
      diode_real_fft[i] = diode_real[i];
    }
    else {
      diode_real_fft[i] = 0.;
    }
  }	

  // forward FFT
  realft(diode_real_fft,1,NFOUR);

  // save f domain diode response in fdiode_real
  for (int i=0; i<NFOUR; i++) {
    fdiode_real.push_back( diode_real_fft[i] );
  }
  delete fdown1;
  delete fdown2;
  delete f_up;
}

TGraph* doConvolve(TGraph *grIn){

  TGraph *grClone = (TGraph*)grIn->Clone();
  for (int i=0;i<grClone->GetN();i++) grClone->GetX()[i] *= 1.e-9; 

  int length=grClone->GetN();
  int NFOUR=length*2; //NFOUR is 2 x n bins for readout
  int BINSIZE=NFOUR/2;
  double TIMESTEP = grClone->GetX()[1]- grClone->GetX()[0];
  double maxt_diode = 70.E-9;
  int maxt_diode_bin = (int)( maxt_diode / TIMESTEP );
  // setup diode
  vector<double> fdiode_real; //ft of diode time domain response (in realft packaging)
  vector<double> diode_real; //time domain of diode response
  getDiodeModel(NFOUR, TIMESTEP, fdiode_real, diode_real);


  /*
    vector<double> xes;
    for(int i=0; i<diode_real.size(); i++){
    xes.push_back(double(i));
    }
    TGraph *grOut = new TGraph(fdiode_real.size(), &xes[0], &fdiode_real[0]);
    TCanvas *c = new TCanvas("","",1100,850);
    grOut->Draw("ALP");
    c->SaveAs("fdiode_real.png");
    delete c;
    delete grOut;
  */

  double Zr=50.;
  vector<double> data;
  vector<double> times;
  for(int samp=0; samp<length; samp++){
    data.push_back(grClone->GetY()[samp]);
    times.push_back(grClone->GetX()[samp]);
  }
  delete grClone;

  double power_noise_copy[length*2];
  for(int i=0; i<length; i++){
    power_noise_copy[i]=(data[i]*data[i])/Zr*TIMESTEP;
  }
  for(int i=length; i<length*2; i++){
    power_noise_copy[i]=0.;
  }
  realft(power_noise_copy, 1, length*2);

  double ans_copy[length*2];
  for(int j=0; j<length; j++){
    ans_copy[2*j]=(power_noise_copy[2*j]*fdiode_real[2*j]-power_noise_copy[2*j+1]*fdiode_real[2*j+1])/((double)length);
    ans_copy[2*j+1]=(power_noise_copy[2*j+1]*fdiode_real[2*j]+power_noise_copy[2*j]*fdiode_real[2*j+1])/((double)length);
  }
  ans_copy[0]=power_noise_copy[0]*fdiode_real[0]/((double)length);
  ans_copy[1]=power_noise_copy[1]*fdiode_real[1]/((double)length);

  realft(ans_copy,-1,length*2);

  vector<double> diodeconv;
  for(int i=0; i<length; i++){
    diodeconv.push_back(ans_copy[i]);
  }

  vector<double> diodeX;
  for(int i=0; i<diodeconv.size(); i++){
    diodeX.push_back(grIn->GetX()[i]);
  }
  TGraph *grDiode = new TGraph(diodeX.size(), &diodeX[0], &diodeconv[0]);
  fdiode_real.clear();
  diode_real.clear();
  data.clear();
  times.clear();
  diodeX.clear();
  diodeconv.clear();

  
  return grDiode;
}



/*


  void diodeConvolve(vector <double> &data,const int DATA_BIN_SIZE,vector <double> &fdiode, vector <double> &diodeconv) {
    
  const double Zr = 50.;
  const int length=DATA_BIN_SIZE;
    
  // we are going to make double sized array for complete convolution
  double power_noise_copy[length*2];

  // fill half of the array as power (actually energy) and another half (actually extanded part) with zero padding (Numerical Recipes 643 page)
  for (int i=0;i<length;i++) {
  power_noise_copy[i]=(data[i]*data[i])/Zr*TIMESTEP;
  }
  for (int i=length;i<length*2;i++) {
  power_noise_copy[i]=0.;
  }
        
  // do forward fft to get freq domain (energy of pure signal)
  Tools::realft(power_noise_copy,1,length*2);
  9    
  double ans_copy[length*2];
    
    
    
  // change the sign (from numerical recipes 648, 649 page)
  for (int j=1;j<length;j++) {
  ans_copy[2*j]=(power_noise_copy[2*j]*fdiode[2*j]-power_noise_copy[2*j+1]*fdiode[2*j+1])/((double)length);
  //ans_copy[2*j]=(power_noise_copy[2*j]*fdiode[2*j]+power_noise_copy[2*j+1]*fdiode[2*j+1])/((double)length/2);
  ans_copy[2*j+1]=(power_noise_copy[2*j+1]*fdiode[2*j]+power_noise_copy[2*j]*fdiode[2*j+1])/((double)length);
  //ans_copy[2*j+1]=(power_noise_copy[2*j+1]*fdiode[2*j]-power_noise_copy[2*j]*fdiode[2*j+1])/((double)length/2);
  }
  ans_copy[0]=power_noise_copy[0]*fdiode[0]/((double)length);
  ans_copy[1]=power_noise_copy[1]*fdiode[1]/((double)length);

    
  Tools::realft(ans_copy,-1,length*2);
    
  diodeconv.clear();  // remove previous values in diodeconv
    
  // only save first half of convolution result as last half is result from zero padding (and some spoiled bins)
  //for (int i=0;i<length;i++) {
  for (int i=0;i<length+maxt_diode_bin;i++) {
  //power_noise[i]=power_noise_copy[i];
  //diodeconv[i]=ans_copy[i];
  diodeconv.push_back( ans_copy[i] );
  }
            
  
  }
*/


