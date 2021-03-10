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

for evNum in range(0,500):#loop over events
    print(evNum)
    eventTree.GetEntry(evNum)
    if(rawEvent.isSoftwareTrigger()==0): #if not soft trigger
        continue
    # if(rawEvent.isCalpulserEvent()): #if not a cal pulser
    #     continue
        
    usefulEvent = ROOT.UsefulAtriStationEvent(rawEvent,ROOT.AraCalType.kLatestCalib)#get useful event
    tWf1, vWf1 = convertWfToArray(0, usefulEvent)
    # SNR = calculateSNR(tWf1, vWf1)
    # if(SNR<8):
    #     continue
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
        v = np.array(v)
        peak = np.max(abs(v))
        RMS = v[len(v)-60:len(v)].std()
        axs[ch].plot(t,v,linewidth=0.5, label = "Ch %i"%(ch))
        import scipy.signal

        # analytic_signal = scipy.signal.hilbert(v) #perform Hilbert envelope
        # amplitude_envelope = np.abs(analytic_signal)
        # axs[ch].plot(t,v,linewidth=0.5, label = "Ch %i"%(ch))
        axs[ch].legend()
        axs[ch].grid()

        plt.grid(which="both")
        # axs[ch].set_xlim(-100,900)
        # axs[ch].set_xlim(0,250)

        # if(ch<8):
        #     axs[ch].set_ylim(-1200,1200)
        # else:
        #     axs[ch].set_ylim(-200,200)
    plt.tight_layout()
    plt.savefig("/users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/thesis_work_daily/plots/SpiceCorePolReco/wf_all_ev%i.png"%evNum, dpi=200)
    plt.close('all')
    # tWf1, vWf1 = convertWfToArray(6, usefulEvent)
    # tWf2, vWf2 = convertWfToArray(14, usefulEvent)
    # 
    # original_df = pd.DataFrame({"t":np.array(tWf1),"v": np.array(vWf1)})
    # original_df2 = pd.DataFrame({"t":np.array(tWf2),"v": np.array(vWf2)})
    # 
    # original_df.to_pickle("./exampleWF.pkl")
    # original_df2.to_pickle("./exampleWF2.pkl")


    # break
