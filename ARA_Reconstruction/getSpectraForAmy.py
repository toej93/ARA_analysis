"""
#####getSpectraForAmy.py#####

Isolate D-pulse and get spectra and power for Amy
Author: Jorge Torres
Date: Mar 14, 2021.
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
    del gr
    return np.array(t), np.array(v)
    
def calculateSNR(t, v, ch):
    peakBin = util.findFirstPeak(v)
    peak = abs(v[peakBin])
    RMS = np.array([19.21869686, 29.49330015, 33.58970854, 20.63299035, 24.05139993,
       18.56017141, 31.54495256, 23.54967839, 24.95720637, 19.73107754,
       20.75493806, 19.52190911, 21.89901339, 15.70998125, 22.97913165,
       30.1300627 ])#RMS from 80 ns window
    # RMS = np.array([18.82786008, 36.7767046 , 42.38902264, 26.45596178, 24.7945771 ,
    #    20.8805134 , 38.37206735, 29.70437442, 29.56303063, 20.92734235,
    #    22.36172272, 20.7001257 , 25.80451102, 16.40808135, 26.81534257,
    #    41.038079  ])#RMS from 80 ns window from soft triggers (from old calibration)
    return peak/RMS[ch]
    
def calculatePower(t, v):
    dT = t[1]-t[0]
    power = np.sum(v**2)*dT
    return power

gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/ARA_cvmfs/build/include/FFTtools.h"')
gSystem.Load('libAraEvent.so') #load the simulation event library. You might get an error asking for the eventSim dictionry. To solve that, go to where you compiled AraSim, find that file, and copy it to where you set LD_LIBRARY_PATH.
gSystem.Load("/users/PAS0654/osu8354/ARA_cvmfs/build/lib/libRootFftwWrapper.so")

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

theta_reco = []
phi_reco = []
evt_num = []

unixtime = []
SNR_arr = []
SNR_H_arr = []

power_H = []
power_V = []
powerH_noise = []
powerV_noise = []

Omega_reco = []
noise = True
chV = 0
chH = chV + 8
fftArray = []
powerArray = []


noisePowerChan = np.array([ 198948.83237201,  618793.94802602,  741895.28129648,
        272935.49802384,  324209.48699648,  208490.58954556,
        641412.61161848,  341862.21483048,  986471.80705882,
        608865.14894156,  710127.49137097,  551354.39763633,
        691066.29589686,  360988.99495955,  834482.5863635 ,
       2020906.83550409])
       
# for evNum in range(0,500):#loop over events
for evNum in range(5359,19099): #depths from 600 to 1000 m 

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
    
    if((SNR<8) or (peak>=1500)): #SNR and saturation cuts
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
    del gr    
    vertex, corrValue = util.doReco(pyrex_array)
    theta = np.radians(180-vertex[1])
    phi = np.radians(vertex[2])
    
    fft_chan = []#[[] for i in range(16)]
    freqArray = []
    power_chan = []
    fft_chan.append(evNum)
    power_chan.append(np.degrees(theta))
    power_chan.append(np.degrees(phi))
    power_chan.append(rawEvent.unixTime)

    # freqs.append(evNum)
    for chan in range(0,16):
        if(chan<8):
            pol = 0 #Vpol
        else:
            pol = 1 #Hpol
        t, v = convertWfToArray(chan, usefulEvent)
        deConv_t,deConv_v = util.deConvolve_antenna(t, v, theta, phi, pol)
        tPeak, vPeak = util.returnFirstPeakWform(deConv_t,deConv_v)
        fft,freq,dT = util.doFFT(tPeak,vPeak)
        fft_chan.append(abs(fft))
        power_chan.append(calculatePower(tPeak,vPeak))
    # freqs.append(freq)
    fft_chan.append(freq)
    # power_chan.append(power)

    del usefulEvent
    # evt_num.append(evNum)
    fftArray.append(fft_chan)
    powerArray.append(power_chan)

    # break
chNames = ["ch%iFFT"%i for i in range(16) ]
chPowNames = ["ch%iPow"%i for i in range(16) ]

evNum = ["evNum"]
angles = ["theta_reco","phi_reco", "unixTime"]

frequency = ["freqs"]

colNames = [*evNum, *chNames, *frequency] 
colNames2 = [*angles, *chPowNames] 

original_df = pd.DataFrame(fftArray, columns = colNames)
original_df2 = pd.DataFrame(powerArray, columns = colNames2)

merged = original_df.join(original_df2)
merged.to_pickle("./forAmy_run012559.pkl")
