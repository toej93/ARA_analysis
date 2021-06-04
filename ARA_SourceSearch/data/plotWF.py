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
    return np.array(t), np.array(v)
    
def calculateSNR(t, v):
    peak = np.max(abs(v))
    RMS = v[len(v)-60:len(v)].std()#RMS of the last 600 samples of the wf
    return peak/RMS
    
gSystem.Load('libAraEvent.so') #load the simulation event library. You might get an error asking for the eventSim dictionry. To solve that, go to where you compiled AraSim, find that file, and copy it to where you set LD_LIBRARY_PATH.
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/ARA_cvmfs/build/include/FFTtools.h"')

gSystem.Load("/users/PAS0654/osu8354/ARA_cvmfs/build/lib/libRootFftwWrapper.so")

day = 24

if(day == 24):
    date = 1224
    run = "012559"
    
elif(day == 26):
    date = 1226
    run = "012577"

date = 1229
run = "012610"

test = ROOT.TFile.Open("/fs/scratch/PAS0654/brian/L1/ARA02/%i/run_%s/event%s.root"%(date, run, run))#directory where the files are
calibrator = ROOT.AraEventCalibrator.Instance()
eventTree = test.Get("eventTree")
rawEvent = ROOT.RawAtriStationEvent()
eventTree.SetBranchAddress("event",ROOT.AddressOf(rawEvent))
totalEvents = eventTree.GetEntries()
print('total events:', totalEvents)
isTrue=False

for evNum in range(14300,totalEvents):#loop over events
    # print("I'm here")

    # print(evNum)
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
    # 
    gr = [None]*16
    fig, axs = plt.subplots(4, 4, figsize = (12,8))
    axs = axs.ravel()
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
        peak = np.max(abs(v))
        RMS = v[len(v)-60:len(v)].std()
        axs[ch].plot(t,v,linewidth=0.5, label = "Ch %i"%(ch))
        # import scipy.signal

        # analytic_signal = scipy.signal.hilbert(v) #perform Hilbert envelope
        # amplitude_envelope = np.abs(analytic_signal)
        # axs[ch].plot(t,v,linewidth=0.5, label = "Ch %i"%(ch))
        axs[ch].legend()
        axs[ch].grid()

        plt.grid(which="both")
        axs[ch].set_xlim(-100,1000)
        # axs[ch].set_xlim(0,250)

        if(ch<8):
            axs[ch].set_ylim(-900,900)
        else:
            axs[ch].set_ylim(-200,200)
            
    fig.text(0.5, 0.03, 'Time [ns]', ha='center', va='center', fontsize=20)
    fig.text(0.03, 0.5, 'Amplitude [mV]', ha='center', va='center', rotation='vertical', fontsize=20)
    plt.suptitle("Run %s, event %i"%(run, evNum))
    plt.tight_layout(rect=[0.03, 0.03, 1, 0.95])
    plt.savefig("/users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/thesis_work_daily/plots/SpiceCorePolReco/wf_all_run%s_ev%i.png"%(run,evNum))
    plt.close('all')
    # sys.exit()

    # tWf1, vWf1 = convertWfToArray(6, usefulEvent)
    # tWf2, vWf2 = convertWfToArray(14, usefulEvent)
    # 
    # original_df = pd.DataFrame({"t":np.array(tWf1),"v": np.array(vWf1)})
    # original_df2 = pd.DataFrame({"t":np.array(tWf2),"v": np.array(vWf2)})
    # 
    # original_df.to_pickle("./exampleWF.pkl")
    # original_df2.to_pickle("./exampleWF2.pkl")


    # break
