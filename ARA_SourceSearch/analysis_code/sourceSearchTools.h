//Includes
#include <iostream>
#include <cstdlib>
#include <sstream>
#include <stdio.h>
#include <vector>
#include <deque>
#include <complex>
#include <algorithm>
#include <numeric>
#include <fstream>

#include "TMath.h"

#include "AraGeomTool.h"
#include "tools_PlottingFns.h"
#include "tools_WaveformFns.h"
#include "FFTtools.h"


using namespace std;


double TransformMapPeakToGlobalFrame(double inputAzimuth, int station){
  double Coordx[3];

  if(station == 0){
    // Coordx = {-0.5986468972,0.8010128835,-0.000399302}; //this is from the ARA coordinates document, and contains the easting, northing, and upping components of the TB origin relative to the array (and therefore global). Find the document here: https://github.com/toej93/ARA_analysis/blob/master/ARA_SourceSearch/Misc/ARA_coord_syst.pdf
    Coordx[0] = -0.5986468972;
    Coordx[1] = 0.8010128835;
    Coordx[2] = -0.000399302;
  }
  else if(station == 2){//A2
    // Coordx = {-0.5986437007,0.8010086064,-0.000970503}; 
    Coordx[0] = -0.5986437007;
    Coordx[1] = 0.8010086064;
    Coordx[2] = -0.000970503;
  }
  else if(station == 3){//A3
    // Coordx = {-0.5986439636,0.8010089581,-0.00198193}; 
    Coordx[0] = -0.5986439636;
    Coordx[1] = 0.8010089581;
    Coordx[2] = -0.00198193;
  }
  else{
    cout << "Only implemented for TB, A2, A3" << endl;
    return -1;
  }
  double angle_from_0 = TMath::ATan2(Coordx[1],Coordx[0]) * TMath::RadToDeg(); //I can compute this as the angle from zero because ATan2 is intelligent, and knows I mean the angle from zero!
  double outputAzimuth = inputAzimuth + angle_from_0; //correct 
  if(outputAzimuth > 180.) outputAzimuth -=360.; //this accounts for domain correcting the answer (ie, spinning from -180 -> 180,to0>360
  return outputAzimuth; //return the answer
}


const double CenA_RA = 201.36506288;
const double CenA_Dec = -43.01911267;

const double SP_A2_Az = 41.8731; //Azimuth of SP viewed by A2 
