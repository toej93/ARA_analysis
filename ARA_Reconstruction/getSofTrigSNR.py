"""
#####deDisperse.py#####

Reconstruct polarization on data (SpiceCore events)
Author: Jorge Torres
Date: Feb 2, 2021.
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


# evt_num = []
# unixtime = []
# SNR_arr = []
# SNR_H_arr = []
rms_arr = []
# chV = int(sys.argv[1])
# chH = chV + 8
for evNum in range(10,10000):#loop over events

    eventTree.GetEntry(evNum)
    
    if(rawEvent.isSoftwareTrigger()==False): #if not soft trigger
        continue
        
    usefulEvent = ROOT.UsefulAtriStationEvent(rawEvent,ROOT.AraCalType.kLatestCalib)#get useful event
    rms = []
    for chan in range(0,16):
        t, v = convertWfToArray(chan, usefulEvent)
        rms.append(v.std())
    # tWf1, vWf1 = convertWfToArray(chV, usefulEvent)
    # SNR = calculateSNR(tWf1, vWf1)
    # 
    # tWf2, vWf2 = convertWfToArray(chH, usefulEvent)
    # SNR_H = calculateSNR(tWf2, vWf2)
    # 
    # unixtime.append(rawEvent.unixTime)
    # evt_num.append(evNum)
    # SNR_arr.append(SNR)
    # SNR_H_arr.append(SNR_H)
    rms_arr.append(np.array(rms))
# 
original_df = pd.DataFrame({"rms":rms_arr})
original_df.to_pickle("./rms_softTriggers_run012559.pkl")
