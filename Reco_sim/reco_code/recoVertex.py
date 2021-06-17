"""
#####deDisperse.py#####

Reconstruct neutrino vertex via the interferometric method
Author: Jorge Torres
Date: Jun 4, 2021.
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
import pyrex
import warnings
import deDisperse_util as util

warnings.filterwarnings("ignore")

#add headers from AraSim. Not sure if all of them are needed, and I'm lazy to check that. MAK SURE to change the location of the headers
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Position.h"')
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Report.h"')
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Detector.h"')
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Settings.h"')

gSystem.Load('/users/PAS0654/osu8354/AraSim/libAra.so') #load the simulation event library. You might get an error asking for the eventSim dictionry. To solve that, go to where you compiled AraSim, find that file, and copy it to where you set LD_LIBRARY_PATH.


# test = ROOT.TFile.Open("/fs/scratch/PAS0654/jorge/sim_results/CenA_atzero/AraOut.CenA_fixed_source_seed4.txt.run0.root")#directory where the simulation files are
# test = ROOT.TFile.Open("/fs/scratch/PAS0654/jorge/sim_results/default/AraOut.default_A2_c1_E610.txt.run9.root")

file_list=[]#Define an empty list
for filename in os.listdir("/fs/scratch/PAS0654/jorge/sim_results/simplified"):#Loop over desired directory
        # if filename.startswith("AraOut.default_A2_c1_E%s.txt.run%s.root"%(sys.argv[1],sys.argv[2])): #extension, .root in this case
        if filename.endswith(".root"): #extension, .root in this case

            file_list.append(os.path.join("/fs/scratch/PAS0654/jorge/sim_results/simplified", str(filename))) #add file name to the list
# file_list.append("/fs/scratch/PAS0654/jorge/sim_results/simplified/AraOut.default_A2_c1_E580.txt.run0.root")

noise=True
simSettingsTree = TChain("AraTree")
eventTree = TChain("eventTree") #Define chain and tree that needs to be read. "VTree" in this case.
SimTree = TChain("AraTree2")

evt_num = []
theta_reco = []
phi_reco = []
theta_true = []
phi_true = []
weight_arr = []
maxAmplitude = []

for line in file_list:
    eventTree.AddFile(line)
    SimTree.AddFile(line)
    simSettingsTree.AddFile(line)

reportPtr = ROOT.Report()#report pointer
eventPtr = ROOT.Event()
iceModelPtr = ROOT.IceModel()

# eventTree = test.Get("eventTree")#eventTree, from AraSim output files
# SimTree = test.Get("AraTree2") #AraTree2, from AraSim output files
rawEvent = ROOT.UsefulAtriStationEvent()
eventTree.SetBranchAddress("UsefulAtriStationEvent",ROOT.AddressOf(rawEvent))
SimTree.SetBranchAddress("report",ROOT.AddressOf(reportPtr))
SimTree.SetBranchAddress("event", ROOT.AddressOf(eventPtr))
simSettingsTree.SetBranchAddress("icemodel", ROOT.AddressOf(iceModelPtr))

totalEvents = eventTree.GetEntries()
print('total events:', totalEvents)

for i in range(0,totalEvents):#loop over events
    eventTree.GetEntry(i)
    SimTree.GetEntry(i)
    if(reportPtr.stations[0].Global_Pass <= 0):#making sure that the event did trigger, otherwise there won't be a waveform (this might not be needed if all waveforms are saved)
        continue
    # Check if 
    try:
        # whichSol = reportPtr.stations[0].strings[0].antennas[0].Likely_Sol #0: direct, #1: reflected/refracted
        whichSol = 0
        # if(whichSol!=0):#If it can't pick what solution triggered, AraSim returns -1
            # continue
        theta_antenna_ = reportPtr.stations[0].strings[0].antennas[0].theta_rec[whichSol]
        phi_ant = reportPtr.stations[0].strings[0].antennas[0].phi_rec[whichSol]

    except:
        continue

    gr = [None]*16
    pyrex_array = []
    evt_num.append(i)

    amplitudes = []
    for ch in [0,4,1,5,2,6,3,7,8,12,9,13,10,14,11,15]:
    # for ch in [8,12,9,13,10,14,11]:
        t = []
        v = []
        gr[ch] = rawEvent.getGraphFromRFChan(ch)#print waveform
        for k in range(0,gr[ch].GetN()):
          t.append(gr[ch].GetX()[k])
          v.append(gr[ch].GetY()[k])
        pyrex_array.append(pyrex.Signal(1E-9*np.array(t), 1E-3*np.array(v)))#Convert to seconds and volts
        amplitudes.append(max(abs(np.array(v))))


    vertexV, corrValueV = util.doReco(pyrex_array, pol=0)
    vertexH, corrValueH = util.doReco(pyrex_array, pol=1)
    # print(corrValueV,corrValueH)
    if(corrValueV>=corrValueH):
        theta = vertexV[1]
        phi = vertexV[2]%(180)
        theta2 = vertexH[1]
    else:
        theta = vertexH[1]
        phi = vertexH[2]%(180)
        theta2 = vertexV[1]
    theta_reco.append(theta)
    phi_reco.append(phi)

    posnu_x = eventPtr.Nu_Interaction[0].posnu.GetX()
    posnu_y = eventPtr.Nu_Interaction[0].posnu.GetY()
    posnu_z = eventPtr.Nu_Interaction[0].posnu.GetZ()
    
    posNu = np.array([posnu_x, posnu_y, posnu_z])
    avgVec = np.array([10000.83568, 9998.89765, 6359452.44702])
    posNu2 = posNu-avgVec #AraSim adds avgVec when transforming coordinates, and this is what AraSim outputs
    norm = np.linalg.norm(posNu2)
    posNu2 = posNu2/norm#Normalize
    posnu_r = norm
    
    posnu_theta = np.degrees(np.arccos((posNu2[2])))
    posnu_phi = np.degrees(np.arctan2(posNu2[1],posNu2[0])%(np.pi))
    theta_true.append(posnu_theta)
    phi_true.append(posnu_phi)
    weight = eventPtr.Nu_Interaction[0].weight
    weight_arr.append(weight)
    maxAmplitude.append(max(amplitudes))

    # print(posnu)
    # phi_true = np.degrees(np.arctan2(posnu[1], posnu[0]))
    # theta_true = np.degrees(np.arccos(posnu[2]))
    # print("True: %0.3f"%posnu_theta)
    # print("Reco: %0.3f,%0.3f"%(theta, theta2))
    # # print(posnu_phi-vertex[2])
    # print()
    # print(eventPtr.Nu_Interaction[0].posnu.theta())
    
df = pd.DataFrame({"EvNum":np.array(evt_num),"theta_reco": np.array(theta_reco),"theta_true": np.array(theta_true),"phi_reco": np.array(phi_reco),"phi_true": np.array(phi_true),  "weight":np.array(weight_arr), "maxAmplitude":np.array(maxAmplitude)})
df.to_pickle("Interf_RecoVsTrue_simple.pkl")
