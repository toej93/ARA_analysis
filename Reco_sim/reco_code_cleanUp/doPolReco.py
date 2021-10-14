"""
#####doPolReco.py#####

Reconstruct polarization of simulated events and store them, along with other MC truth, in a pandas dataframe.
Author: Jorge Torres
Date: Sep 19, 2021.
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
import polReco_util as util
import pyrex
import warnings
import itertools
warnings.filterwarnings("ignore")

if len( sys.argv ) > 1:
    number = 0
    number = int(sys.argv[1])

else:
    print("Run number is required \n run as $python doPolReco.py <run-number>")
    sys.exit()

#add headers from AraSim. Not sure if all of them are needed, and I'm lazy to check that. MAK SURE to change the location of the headers
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Position.h"')
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Report.h"')
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Detector.h"')
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Settings.h"')

gSystem.Load('/users/PAS0654/osu8354/AraSim/libAra.so') #load the simulation event library. You might get an error asking for the eventSim dictionry. To solve that, go to where you compiled AraSim, find that file, and copy it to where you set LD_LIBRARY_PATH.

simFolder = "/fs/project/PAS0654/ARA_SIM_RECO_PAPER/neutral_current/mc/E2_nomag/"
filename = simFolder+"AraOut.setup_neutral_current_E2.txt.run%i.root"%(200000+int(sys.argv[1]))
file_list = []
file_list.append(filename)
noise=True
eventTree = TChain("eventTree") #Define chain and tree that needs to be read. "VTree" in this case.
SimTree = TChain("AraTree2")

for line in file_list:
    eventTree.AddFile(line)
    SimTree.AddFile(line)

reportPtr = ROOT.Report()#report pointer
eventPtr = ROOT.Event()

rawEvent = ROOT.UsefulAtriStationEvent()
eventTree.SetBranchAddress("UsefulAtriStationEvent",ROOT.AddressOf(rawEvent))
SimTree.SetBranchAddress("report",ROOT.AddressOf(reportPtr))
SimTree.SetBranchAddress("event", ROOT.AddressOf(eventPtr))

totalEvents = eventTree.GetEntries()
print('total events:', totalEvents)
# isTrue=False
PolVecReco_array = []
PolVecTrue_array = []
evt_num = []
weights = []
energy = []
SNR_V = []
SNR_H = []
for i in range(0,totalEvents):#loop over events

    eventTree.GetEntry(i)
    SimTree.GetEntry(i)
    if(reportPtr.stations[0].Global_Pass <= 0):#making sure that the event did trigger, otherwise there won't be a waveform (this might not be needed if all waveforms are saved)
        continue

    #Define variables for this loop
    theta_antenna = np.zeros(16)
    phi_antenna = np.zeros(16)
    polVecX = np.zeros(16)
    polVecY = np.zeros(16)
    polVecZ = np.zeros(16)
    Omega_true = np.zeros(8)
    Psi_true = np.zeros(8)
    R_truth = np.zeros(16)
    Omega_reco = np.zeros(8)
    Psi_reco = np.zeros(8)

    try:
        # whichSol = reportPtr.stations[0].strings[0].antennas[0].Likely_Sol #0: direct, #1: reflected/refracted
        whichSol = 0
        # if(whichSol!=0):#If it can't pick what solution triggered, AraSim returns -1
            # continue
        whichSol = util.guess_triggering_solution(eventPtr, reportPtr)
        # print("Sol:%i"%whichSol)
        for string, antennaNum in itertools.product(range(0,4), range(0,4)):
                mapped_ch = util.getRFChannel(string,antennaNum)#Maps AraSim channels to AraRoot channels
                theta_antenna[mapped_ch] = reportPtr.stations[0].strings[string].antennas[antennaNum].theta_rec[whichSol]
                phi_antenna[mapped_ch] = reportPtr.stations[0].strings[string].antennas[antennaNum].phi_rec[whichSol]
                #The polarizations
                polVecX[mapped_ch] = reportPtr.stations[0].strings[string].antennas[antennaNum].Pol_vector[whichSol].GetX()
                polVecY[mapped_ch] = reportPtr.stations[0].strings[string].antennas[antennaNum].Pol_vector[whichSol].GetY()
                polVecZ[mapped_ch] = reportPtr.stations[0].strings[string].antennas[antennaNum].Pol_vector[whichSol].GetZ()
    except:
        continue
    ## Define variables for this loop
    powerV = np.zeros(8)
    powerH = np.zeros(8)
    for ch in range(0,16):
        t = []
        v = []
        gr = rawEvent.getGraphFromRFChan(ch)
        for k in range(0,gr.GetN()):
          t.append(gr.GetX()[k])
          v.append(gr.GetY()[k])
        if(ch<8):#Vpol case
            deConv_t,deConv_v = util.deConvolve(t, v, theta_antenna[ch], phi_antenna[ch], 0)

            if(noise == False):
                maxV = util.findMaxSign(np.array(deConv_v))
                rmsV_ = max(abs(np.array(v)))
            else:
                maxV = util.findMaxSign(np.array(v))
                rmsV_ = np.array(v[0:60]).std()

            if(ch == 0):
                SNR_Vpol = abs(maxV/rmsV_)


            powerV[ch] = util.integratePowerWindow(deConv_t,deConv_v)-util.integratePowerNoise(deConv_t,deConv_v)
            PeakV = util.findMaxSign(np.array(deConv_v))

        else:#Hpol case
            deConv_t,deConv_v = util.deConvolve(t, v,theta_antenna[ch], phi_antenna[ch], 1)

            if(noise == False):
                maxH = util.findMaxSign(np.array(deConv_v))
                rmsH_ = max(abs(np.array(v)))
            else:
                maxH = util.findMaxSign(np.array(v))
                rmsH_ = np.array(v[0:60]).std()

            if(ch == 8):
                SNR_Hpol = abs(maxH/rmsH_)

            powerH[ch-8] = util.integratePowerWindow(deConv_t,deConv_v)-util.integratePowerNoise(deConv_t,deConv_v)
            PeakH = util.findMaxSign(np.array(deConv_v))
        thetaHat = np.array([np.cos(theta_antenna[ch])*np.cos(phi_antenna[ch]), np.cos(theta_antenna[ch])*np.sin(phi_antenna[ch]), -np.sin(theta_antenna[ch])])
        phiHat = np.array([-np.sin(phi_antenna[ch]), np.cos(phi_antenna[ch]),0])
        PolTrue = np.array([polVecX[ch], polVecY[ch], polVecZ[ch]])
        R_truth[ch] = np.dot(PolTrue,phiHat)/(np.dot(PolTrue,thetaHat))

    ## Now loop over pairs
    PolReco = []
    PolTrue = []

    for pair in range(0,8):
        PolReco.append(util.PolVectorRecoPower_signR(powerV[pair],powerH[pair], theta_antenna[pair], phi_antenna[pair],np.sign(R_truth[pair])))
        PolTrue.append(np.array([polVecX[pair], polVecY[pair], polVecZ[pair]]))
    # print(PolReco)
        #dirProp.append(np.array([np.sin(theta_antenna_)*np.cos(phi_ant),np.sin(theta_antenna_)*np.sin(phi_ant),np.cos(theta_antenna_)]))
    PolVecReco_array.append(PolReco)
    PolVecTrue_array.append(PolTrue)
    weights.append(eventPtr.Nu_Interaction[0].weight)
    evt_num.append(i)
    energy.append(eventPtr.pnu)
    SNR_V.append(SNR_Vpol)
    SNR_H.append(SNR_Hpol)

original_df = pd.DataFrame({"EvNum":np.array(evt_num), "weight":np.array(weights), "PolReco":PolVecReco_array, "PolTrue":PolVecTrue_array, "energy":np.array(energy), "SNR_V":np.array(SNR_V), "SNR_H":np.array(SNR_H)})
original_df.to_pickle("./data/polReco_run%i.pkl"%(200000+int(sys.argv[1])))
