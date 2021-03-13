"""
#####getSofTrigPower.py#####

Calculate power of sof triggers along a 80 ns window (SpiceCore events)
Author: Jorge Torres
Date: Feb 18, 2021.
"""
from ROOT import TCanvas, TGraph
from ROOT import gROOT
import ROOT
import os
import pandas as pd
import matplotlib.pyplot as plt
import numpy as np
from ROOT import gInterpreter, gSystem
from ROOT import TChain, TSelector, TTree
import scipy
import sys
import reco_util as util
import pyrex
import warnings
warnings.filterwarnings("ignore")

def convertWfToArray(ch, usefulEvent):
    gr = usefulEvent.getGraphFromRFChan(ch)
    gr = ROOT.FFTtools.getInterpolatedGraph(gr,0.5) #interpoalate and pad waveform so it has the same length
    gr = ROOT.FFTtools.padWaveToLength(gr,2048)
    wfLength = gr.GetN()
    t = []
    v = []
    for kk in range(0,wfLength):
      t.append(gr.GetX()[kk])
      v.append(gr.GetY()[kk])
    return np.array(t), np.array(v)
    
def calculateSNR(t, v):
    peak = np.max(abs(v))
    RMS = v.std()
    return peak/RMS
    
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/ARA_cvmfs/build/include/FFTtools.h"')
gSystem.Load('libAraEvent.so') #load the simulation event library. You might get an error asking for the eventSim dictionry. To solve that, go to where you compiled AraSim, find that file, and copy it to where you set LD_LIBRARY_PATH.
gSystem.Load("/users/PAS0654/osu8354/ARA_cvmfs/build/lib/libRootFftwWrapper.so")

test = ROOT.TFile.Open("/fs/scratch/PAS0654/brian/L1/ARA02/1224/run_012559/event012559.root")#directory where the files are

calibrator = ROOT.AraEventCalibrator.Instance()
eventTree = test.Get("eventTree")
rawEvent = ROOT.RawAtriStationEvent()
eventTree.SetBranchAddress("event",ROOT.AddressOf(rawEvent))
totalEvents = eventTree.GetEntries()
print('total events:', totalEvents)


evt_num = []
# unixtime = []
# SNR_arr = []
# SNR_H_arr = []
NoisePow_arr = []
NoisePowDeco_arr = []

# chV = int(sys.argv[1])
# chH = chV + 8
theta = np.pi/2 #Use 90 deg for the deconvolution code. This is not correct, so it'll have to be changed eventually.
phi = 0
for evNum in range(10,totalEvents):#loop over events

    eventTree.GetEntry(evNum)
    
    if(rawEvent.isSoftwareTrigger()==False): #if not soft trigger
        continue
        
    usefulEvent = ROOT.UsefulAtriStationEvent(rawEvent,ROOT.AraCalType.kLatestCalib)#get useful event
    noisePower = []
    noisePowerDeco = []

    for chan in range(0,16):
        if(chan<8):
            pol = 0 #Vpol
        else:
            pol = 1 #Hpol
        t, v = convertWfToArray(chan, usefulEvent)
        noisePower.append(util.integratePowerNoise_softTrig(t,v))
        deConv_t,deConv_v = util.deConvolve_antennaAraSim(t, v, theta, phi, pol)
        powerNoise = util.integratePowerNoise_softTrig(deConv_t,deConv_v)
        noisePowerDeco.append(powerNoise)
        
    NoisePow_arr.append(np.array(noisePower))
    NoisePowDeco_arr.append(np.array(noisePowerDeco))

    evt_num.append(evNum)
# # 
original_df = pd.DataFrame({"evNum":evt_num,"noisePower":NoisePow_arr,"noisePowerDeco":NoisePowDeco_arr})
original_df.to_pickle("./PowerNoise_softTriggers_run012559.pkl")
