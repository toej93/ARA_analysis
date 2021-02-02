"""
#####plotWF.py#####

Plot waveforms from ARA data
Author: Jorge Torres
Date: Feb 1, 2021.
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
# import warnings
# warnings.filterwarnings("ignore")



gSystem.Load('libAraEvent.so') #load the simulation event library. You might get an error asking for the eventSim dictionry. To solve that, go to where you compiled AraSim, find that file, and copy it to where you set LD_LIBRARY_PATH.


test = ROOT.TFile.Open("/fs/scratch/PAS0654/brian/L1/ARA02/1223/run_012549/event012549.root")#directory where the simulation files are


calibrator = ROOT.AraEventCalibrator.Instance()
eventTree = test.Get("eventTree")
rawEvent = ROOT.RawAtriStationEvent()
eventTree.SetBranchAddress("event",ROOT.AddressOf(rawEvent))
totalEvents = eventTree.GetEntries()
print('total events:', totalEvents)
isTrue=False

for evNum in range(0,9):#loop over events
#     if( isTrue):
#         break
    eventTree.GetEntry(evNum)
#     if(rawEvent.isCalpulserEvent()==0): #if not a cal pulser
#         continue
    usefulEvent = ROOT.UsefulAtriStationEvent(rawEvent,ROOT.AraCalType.kLatestCalib)#get useful event
#     gr1 = usefulEvent.getGraphFromElecChan(0)#print waveform
# 
    gr = [None]*16
    fig, axs = plt.subplots(4, 4, figsize = (11,9))
    axs = axs.ravel()
    for ch in range(0,16):
        t = []
        v = []
        gr[ch] = usefulEvent.getGraphFromRFChan(ch)#print waveform
        for kk in range(0,gr[ch].GetN()):
          t.append(gr[ch].GetX()[kk])
          v.append(gr[ch].GetY()[kk])
        axs[ch].plot(t,v,linewidth=0.5, label = "Ch %i"%ch)
        axs[ch].legend()
        plt.grid(which="both")
        axs[ch].set_ylim(-600,600)
    plt.tight_layout()
    plt.savefig("./wf_all_ev%i.png"%evNum, dpi=200)
    # break
