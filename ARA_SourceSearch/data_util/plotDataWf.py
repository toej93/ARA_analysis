"""
#####plotDataWF.py#####

Plot waveforms from ARA data
Author: Jorge Torres
Date: Apr 25, 2021.
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
rms_bug = np.array([19.99827993, 32.84505809, 40.92088042, 52.0002597 , 26.67495754,
       23.21861829, 46.630749  , 32.83242691, 31.22135598, 21.5220688 ,
       25.01496981, 29.75279625, 27.2883291 , 28.15147211, 28.67520062,
       27.97893276])

rms_fixed = np.array([17.23590715, 19.02665856, 32.34303225, 29.58004454, 28.13507886,
       20.54028914, 31.38401038, 22.15581166, 28.33490443, 20.52004346,
       20.65208089, 18.82969853, 20.36303575, 18.09000257, 22.24791577,
       28.63377858])
       
for evNum in range(455,totalEvents):#loop over events
    # print("I'm here")

    # print(evNum)
    eventTree.GetEntry(evNum)

    if(rawEvent.isCalpulserEvent()==False): #if not a cal pulser
        continue
        
    usefulEvent = ROOT.UsefulAtriStationEvent(rawEvent,ROOT.AraCalType.kLatestCalib)#get useful event
    if(qualCut.isGoodEvent(usefulEvent)==False):
        continue
    # tWf1, vWf1 = convertWfToArray(0, usefulEvent)
    # SNR = calculateSNR(tWf1, vWf1)
    # if(SNR<8):
        # continue
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
        t = np.array(t)

        peak = np.max(abs(v))
        RMS = v[len(v)-60:len(v)].std()
        axs[ch].plot(t,v,linewidth=0.5, label = "Ch %i (bug)"%(ch))

        axs[ch].legend()
        axs[ch].grid()

        plt.grid(which="both")
        axs[ch].set_xlim(-100,500)
        # axs[ch].set_xlim(0,250)
        tWf1, vWf1 = convertWfToArray(ch, usefulEvent)
        # SNR = calculateSNR(tWf1, vWf1)
        peak = np.max(abs(v))
        SNR = peak/rms_fixed[ch]
        print("Ch %i SNR:%0.2f"%(ch,SNR))
        if(ch<8):
            axs[ch].set_ylim(-500,500)
        else:
            axs[ch].set_ylim(-100,100)
            
    fig.text(0.5, 0.03, 'Time [ns]', ha='center', va='center', fontsize=20)
    fig.text(0.03, 0.5, 'Amplitude [mV]', ha='center', va='center', rotation='vertical', fontsize=20)
    # plt.suptitle("Run %s, event %i"%(run, evNum))
    plt.tight_layout(rect=[0.03, 0.03, 1, 0.95])
    # plt.savefig("/users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/ARA_analysis/ARA_SourceSearch/data_util/plots/wf_CalPul_ev%i_oldCalib.png"%evNum)
    plt.close('all')
    break
