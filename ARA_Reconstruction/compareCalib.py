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

import seaborn as sns
import matplotlib as mpl


# mpl.use('agg') 
mpl.rcParams['text.usetex'] = True
mpl.rcParams['text.latex.unicode'] = True
mpl.rcParams['mathtext.rm'] = 'Times New Roman'
mpl.rcParams['mathtext.it'] = 'Times New Roman:italic'
mpl.rcParams['mathtext.bf'] = 'Times New Roman:bold'

mpl.rc('font', family='serif', size=12)
mpl.rcParams['xtick.labelsize'] = 14
mpl.rcParams['ytick.labelsize'] = 14
mpl.rcParams['xtick.major.size'] = 5
mpl.rcParams['ytick.major.size'] = 5

mpl.rcParams['axes.titlesize'] = 18
mpl.rcParams['axes.labelsize'] = 18
# mpl.rc('font', size=16)
mpl.rc('axes', titlesize=20)

current_palette = sns.color_palette('colorblind', 10)
import warnings
warnings.filterwarnings("ignore")

# import warnings
# warnings.filterwarnings("ignore")
def convertWfToArray(ch, usefulEvent):
    gr = usefulEvent.getGraphFromRFChan(ch)
    wfLength = gr.GetN()
    t = []
    v = []
    for kk in range(0,wfLength):
      t.append(gr.GetX()[kk])
      v.append(gr.GetY()[kk])
    del gr
    return np.array(t), np.array(v)
    
def calculateSNR(t, v):
    peak = np.max(abs(v))
    RMS = v[len(v)-60:len(v)].std()#RMS of the last 600 samples of the wf
    return peak/RMS
    
gSystem.Load('libAraEvent.so') #load the simulation event library. You might get an error asking for the eventSim dictionry. To solve that, go to where you compiled AraSim, find that file, and copy it to where you set LD_LIBRARY_PATH.

day = 24

if(day == 24):
    date = 1224
    run = "012559"
    
elif(day == 26):
    date = 1226
    run = "012577"

test = ROOT.TFile.Open("/fs/scratch/PAS0654/brian/L1/ARA02/%i/run_%s/event%s.root"%(date, run, run))#directory where the files are
calibrator = ROOT.AraEventCalibrator.Instance()
eventTree = test.Get("eventTree")
rawEvent = ROOT.RawAtriStationEvent()
eventTree.SetBranchAddress("event",ROOT.AddressOf(rawEvent))
totalEvents = eventTree.GetEntries()
print('total events:', totalEvents)
isTrue=False

for evNum in range(5359,5367):#loop over events
    print(evNum)
    eventTree.GetEntry(evNum)
    if(rawEvent.isSoftwareTrigger()): #if not soft trigger
        continue
    if(rawEvent.isCalpulserEvent()): #if not a cal pulser
        continue
        
    usefulEvent = ROOT.UsefulAtriStationEvent(rawEvent,ROOT.AraCalType.kLatestCalib)#get useful event
    usefulEventLatestCalib = ROOT.UsefulAtriStationEvent(rawEvent,ROOT.AraCalType.kLatestCalib14to20)#get useful event

    tWf1, vWf1 = convertWfToArray(0, usefulEvent)
    SNR = calculateSNR(tWf1, vWf1)
    if(SNR<8):
        continue
    tWf1, vWf1 = convertWfToArray(8, usefulEvent)

    t, v = convertWfToArray(8,usefulEventLatestCalib)#print waveform

    plt.plot(tWf1, vWf1, alpha = 0.5, label = "Old calibration")
    plt.plot(t, v, alpha = 0.5, label = "New calibration")
    # plt.close('all')
    plt.legend()
    plt.savefig("/users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/thesis_work_daily/plots/SpiceCorePolReco/wf_comparisonHpol.png", dpi = 200)
    # plt.show()
    break
