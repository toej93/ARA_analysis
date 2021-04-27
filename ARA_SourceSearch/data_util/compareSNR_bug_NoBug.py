"""
#####plotDataWF.py#####

Plot waveforms from ARA data
Author: Jorge Torres
Date: Apr 25, 2021.
"""

import sys

if len(sys.argv) < 2:
    print("Run like python compareSNR_bug_NoBug.py <bug/no_bug>") 
    exit(0)

mode = sys.argv[1]
print('Running in mode: %s'%mode)

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



def convertWfToArray(ch, usefulEvent):
    gr = usefulEvent.getGraphFromRFChan(ch)
    wfLength = gr.GetN()
    t = []
    v = []
    for kk in range(0,wfLength):
      t.append(gr.GetX()[kk])
      v.append(gr.GetY()[kk])
    return np.array(t), np.array(v)
    
def calculateSNR(t, v):
    peak = np.max(abs(v))
    RMS = v[len(v)-60:len(v)].std()#RMS of the last 600 samples of the wf
    return peak/RMS
    
if len(sys.argv) < 2:
    print("Run like...") 
    exit(0)

    
gSystem.Load('libAraEvent.so') #load the simulation event library. You might get an error asking for the eventSim dictionry. To solve that, go to where you compiled AraSim, find that file, and copy it to where you set LD_LIBRARY_PATH.
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/ARA_cvmfs/build/include/FFTtools.h"')
gSystem.Load("/users/PAS0654/osu8354/ARA_cvmfs/build/include/AraQualCuts.h")

test = ROOT.TFile.Open("/fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2381/event2381.root")#directory where the files are
calibrator = ROOT.AraEventCalibrator.Instance()
calibrator.setAtriPedFile("/fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002380/pedestalValues.run002380.dat", 2);
qualCut = ROOT.AraQualCuts.Instance()
eventTree = test.Get("eventTree")
rawEvent = ROOT.RawAtriStationEvent()
eventTree.SetBranchAddress("event",ROOT.AddressOf(rawEvent))
totalEvents = eventTree.GetEntries()
print('total events:', totalEvents)
isTrue=False

#RMS for comparison

if(mode=="bug"):
    rms = np.array([19.99827993, 32.84505809, 40.92088042, 52.0002597 , 26.67495754,
           23.21861829, 46.630749  , 32.83242691, 31.22135598, 21.5220688 ,
           25.01496981, 29.75279625, 27.2883291 , 28.15147211, 28.67520062,
           27.97893276])
else:
    rms = np.array([17.23590715, 19.02665856, 32.34303225, 29.58004454, 28.13507886,
           20.54028914, 31.38401038, 22.15581166, 28.33490443, 20.52004346,
           20.65208089, 18.82969853, 20.36303575, 18.09000257, 22.24791577,
           28.63377858])
           
evNumArr = []
isCalArr = []
SNRArr = []

for evNum in range(0,totalEvents):#loop over events
# for evNum in range(0,100):#loop over events

    eventTree.GetEntry(evNum)
    if(rawEvent.isSoftwareTrigger()==True): #if not a cal pulser
        continue
        
    if(mode=="bug"):
        usefulEvent = ROOT.UsefulAtriStationEvent(rawEvent,ROOT.AraCalType.kLatestCalib14to20)#get useful event
    else:
        usefulEvent = ROOT.UsefulAtriStationEvent(rawEvent,ROOT.AraCalType.kLatestCalib)#get useful event

    if(qualCut.isGoodEvent(usefulEvent)==False):
        continue
    # 
    gr = [None]*16
    SNR = []
    for ch in range(0,16):
        t = []
        v = []
        gr[ch] = usefulEvent.getGraphFromRFChan(ch)#print waveform
        gr[ch] = ROOT.FFTtools.getInterpolatedGraph(gr[ch],0.5) #interpoalate and pad waveform so it has the same length
        gr[ch] = ROOT.FFTtools.padWaveToLength(gr[ch],2048)
        for kk in range(0,gr[ch].GetN()):
          t.append(gr[ch].GetX()[kk])
          v.append(gr[ch].GetY()[kk])
        v = np.array(v)
        t = np.array(t)

        peak = np.max(abs(v))
        SNR.append(peak/rms[ch])
        # print("Ch %i SNR:%0.2f"%(ch,SNR))
    SNRArr.append(SNR)
    evNumArr.append(usefulEvent.eventNumber)
    isCalArr.append(rawEvent.isCalpulserEvent())
    del usefulEvent
    del gr
    
    # break
    
df = pd.DataFrame({"EvNum":np.array(evNumArr),"isCalPulser": np.array(isCalArr),"SNR": SNRArr})
# df.to_pickle("./debug.pkl")
df.to_pickle("./SNR_perChannel_run2381_%s.pkl"%mode)
