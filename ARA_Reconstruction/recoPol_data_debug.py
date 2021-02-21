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
    
def calculateSNR(t, v, ch):
    peakBin = util.findFirstPeak(v)
    peak = abs(v[peakBin])
    RMS = np.array([19.11142993, 38.17949104, 43.26204128, 27.29571625, 25.18840903,
       21.23152277, 39.00044813, 30.1579534 , 31.8938169 , 22.33289857,
       24.34887954, 22.10759288, 28.14282986, 17.58028961, 29.55762914,
       43.35847075])#RMS of the last 60 samples of the wf
    return peak/RMS[ch]
    
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
SNR_arr = []
SNR_H_arr = []

power_H = []
power_V = []
powerH_noise = []
powerV_noise = []

Omega_reco = []
noise = True
chV = int(sys.argv[1])
chH = chV + 8

noisePowerChan = np.array([ 2305456.86774099,  4704735.94561591, 10417781.38557688,
        1291268.197961  ,  2811482.70038974,  4283226.42206426,
        6979042.07952783,  8694717.48332755,  7515525.90979793,
        3332080.04148448,  3748150.1377401 ,  3435882.53139423,
        5395738.82052792,  2061752.15165964,  5164978.22803217,
       20520769.36426187])
       
for evNum in range(11981,11985):#loop over events

    eventTree.GetEntry(evNum)
    
    if(rawEvent.isSoftwareTrigger()): #if not soft trigger
        continue
        
    if(rawEvent.isCalpulserEvent()): #if not a cal pulser
        continue
        
    usefulEvent = ROOT.UsefulAtriStationEvent(rawEvent,ROOT.AraCalType.kLatestCalib)#get useful event
    tWf1, vWf1 = convertWfToArray(chV, usefulEvent)
    try:
        SNR = calculateSNR(tWf1, vWf1, chV)
        tWf2, vWf2 = convertWfToArray(chH, usefulEvent)
        SNR_H = calculateSNR(tWf2, vWf2, chH)
        peak = max(abs(vWf1))
    except:
        continue
    
    if((SNR<8) or (peak>1500)): #SNR and saturation cuts
        continue
    # print(SNR)

    gr = [None]*8
    pyrex_array = []
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
    phi_reco.append(np.degrees(phi))
    

    for ch in [chV,chH]:
        t = []
        v = []
        gr = usefulEvent.getGraphFromRFChan(ch)
        for k in range(0,gr.GetN()):
          t.append(gr.GetX()[k])
          v.append(gr.GetY()[k])
    # plt.title("An example of a triggered simulated event with Python")
        if(ch==chV):
            deConv_t,deConv_v = util.deConvolve_antenna(t, v, theta, phi, 0)
            if(noise == False):
                maxV = util.findMaxSign(np.array(deConv_v))
                rmsV_ = max(abs(np.array(v)))
            else:
                maxV = util.findMaxSign(np.array(v))
                rmsV_ = np.array(v[len(v)-60:len(v)]).std()

            # dTV = deConv_t[1]-deConv_t[0]
            # powerV = np.sum(deConv_v**2)*dTV
            
            powerV = util.integratePowerWindow_SpiceCore(deConv_t,deConv_v)-noisePowerChan[ch]#util.integratePowerNoise(deConv_t,deConv_v)
            PeakV = util.findMaxSign(np.array(deConv_v))
            peakLocV = util.findFirstPeak(deConv_v)
            power_V.append(util.integratePowerWindow_SpiceCore(deConv_t,deConv_v))
            powerV_noise.append(noisePowerChan[ch])

        else:
            deConv_t,deConv_v = util.deConvolve_antenna(t, v, theta, phi, 1)
            if(noise == False):
                maxH = util.findMaxSign(np.array(deConv_v))
                rmsH_ = max(abs(np.array(v)))
            else:
                maxH = util.findMaxSign(np.array(v))
                rmsH_ = np.array(v[len(v)-60:len(v)]).std()
            
            powerH = util.integratePowerWindow_SpiceCore(deConv_t,deConv_v, useSameWinidow = True, peakLoc = peakLocV)-noisePowerChan[ch]#util.integratePowerNoise(deConv_t,deConv_v)
            PeakH = util.findMaxSign(np.array(deConv_v))
            power_H.append(util.integratePowerWindow_SpiceCore(deConv_t,deConv_v, useSameWinidow = True, peakLoc = peakLocV))
            powerH_noise.append(noisePowerChan[ch])
                
    # if((powerV<0) or (powerH<0)):
    #     # print("Negative")
    #     continue
        
    Omega = np.degrees(np.arctan(np.sqrt(powerH/powerV)))            
    # print(Omega)
    
    Omega_reco.append(Omega)
    unixtime.append(rawEvent.unixTime)
    evt_num.append(evNum)
    SNR_arr.append(SNR)
    theta_reco.append(np.degrees(theta))
    SNR_H_arr.append(SNR_H)
    
# 
original_df = pd.DataFrame({"EvNum":np.array(evt_num),"Omega_reco": np.array(Omega_reco),"power_V": np.array(power_V),"power_H": np.array(power_H),"powerV_noise": np.array(powerV_noise),"powerH_noise": np.array(powerH_noise)})
original_df.to_pickle("./RecoOmegaCh%i_%i_run_012577_debug.pkl"%(chV,chH))
