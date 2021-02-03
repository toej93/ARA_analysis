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
    RMS = v[len(v)-60:len(v)].std()#RMS of the last 600 samples of the wf
    return peak/RMS
    
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/ARA_cvmfs/build/include/FFTtools.h"')
gSystem.Load('libAraEvent.so') #load the simulation event library. You might get an error asking for the eventSim dictionry. To solve that, go to where you compiled AraSim, find that file, and copy it to where you set LD_LIBRARY_PATH.
gSystem.Load("/users/PAS0654/osu8354/ARA_cvmfs/build/lib/libRootFftwWrapper.so")

test = ROOT.TFile.Open("/fs/scratch/PAS0654/brian/L1/ARA02/1227/run_012590/event012590.root")#directory where the files are

calibrator = ROOT.AraEventCalibrator.Instance()
eventTree = test.Get("eventTree")
rawEvent = ROOT.RawAtriStationEvent()
eventTree.SetBranchAddress("event",ROOT.AddressOf(rawEvent))
totalEvents = eventTree.GetEntries()
print('total events:', totalEvents)

theta_reco = []
theta_antenna = []
phi_antenna = []

phi_reco = []
evt_num = []
rmsV = []
rmsH = []
maxV_array = []
maxH_array = []
PolVecReco_array = []
PolVecTrue_array = []
powerVArr = []
powerHArr = []
Peak_V = []
Peak_H = []
unixtime = []

Omega_reco = []
noise = True
for evNum in range(10,10000):#loop over events

    eventTree.GetEntry(evNum)
    
    if(rawEvent.isSoftwareTrigger()): #if not soft trigger
        continue
        
    if(rawEvent.isCalpulserEvent()): #if not a cal pulser
        continue
        
    usefulEvent = ROOT.UsefulAtriStationEvent(rawEvent,ROOT.AraCalType.kLatestCalib)#get useful event
    tWf1, vWf1 = convertWfToArray(0, usefulEvent)
    SNR = calculateSNR(tWf1, vWf1)
    if(SNR<8):
        continue
    
    unixtime.append(rawEvent.unixTime)
    gr = [None]*8
    pyrex_array = []
    evt_num.append(evNum)
    for ch in [0,4,1,5,2,6,3,7]:
        t = []
        v = []
        gr[ch] = usefulEvent.getGraphFromRFChan(ch)#print waveform
        gr[ch] = ROOT.FFTtools.getInterpolatedGraph(gr[ch],0.5) #interpoalate and pad waveform so it has the same length
        gr[ch] = ROOT.FFTtools.padWaveToLength(gr[ch],2048)
        for k in range(0,gr[ch].GetN()):
          t.append(gr[ch].GetX()[k])
          v.append(gr[ch].GetY()[k])
        pyrex_array.append(pyrex.Signal(1E-9*np.array(t), 1E-3*np.array(v)))#Convert to seconds and volts

    vertex, corrValue = util.doReco(pyrex_array)
    theta = np.radians(180-vertex[1])
    phi = np.radians(vertex[2])
    theta_reco.append(np.degrees(theta))
    phi_reco.append(np.degrees(phi))

    for ch in [2,10]:
        t = []
        v = []
        gr = usefulEvent.getGraphFromRFChan(ch)
        for k in range(0,gr.GetN()):
          t.append(gr.GetX()[k])
          v.append(gr.GetY()[k])
    # plt.title("An example of a triggered simulated event with Python")
        if(ch==2):
            deConv_t,deConv_v = util.deConvolve_antenna(t, v, theta, phi, 0)
            if(noise == False):
                maxV = util.findMaxSign(np.array(deConv_v))
                rmsV_ = max(abs(np.array(v)))
            else:
                maxV = util.findMaxSign(np.array(v))
                rmsV_ = np.array(v[len(v)-60:len(v)]).std()

            # dTV = deConv_t[1]-deConv_t[0]
            # powerV = np.sum(deConv_v**2)*dTV
            
            powerV = util.integratePowerWindow(deConv_t,deConv_v)-util.integratePowerNoise(deConv_t,deConv_v)
            PeakV = util.findMaxSign(np.array(deConv_v))

        else:
            deConv_t,deConv_v = util.deConvolve_antenna(t, v, theta, phi, 1)
            if(noise == False):
                maxH = util.findMaxSign(np.array(deConv_v))
                rmsH_ = max(abs(np.array(v)))
            else:
                maxH = util.findMaxSign(np.array(v))
                rmsH_ = np.array(v[len(v)-60:len(v)]).std()

            # dTH = deConv_t[1]-deConv_t[0]
            # powerH = np.sum(deConv_v**2)*dTH
            powerH = util.integratePowerWindow(deConv_t,deConv_v)-util.integratePowerNoise(deConv_t,deConv_v)
            PeakH = util.findMaxSign(np.array(deConv_v))

    Omega = np.degrees(np.arctan(np.sqrt(powerH/powerV)))            
    # print(Omega)
    Omega_reco.append(Omega)
# 
# original_df = pd.DataFrame({"EvNum":np.array(evt_num),"Omega_reco": np.array(Omega_reco),"unixtime": np.array(unixtime) })
# original_df.to_pickle("./evNumVsOmegaCh2_10.pkl")
