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
# import deDisperse_util as util

warnings.filterwarnings("ignore")

#add headers from AraSim. Not sure if all of them are needed, and I'm lazy to check that. MAK SURE to change the location of the headers
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Position.h"')
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Report.h"')
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Detector.h"')
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Settings.h"')
# gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/RayTraceCorrelator/RayTraceCorrelator.h"')

gInterpreter.AddIncludePath("/users/PAS0654/osu8354/ARA_cvmfs/build/include/");

gInterpreter.AddIncludePath("/users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/RayTraceCorrelator/");
gInterpreter.ProcessLine('#include "RayTraceCorrelator.h"')

gSystem.Load('/users/PAS0654/osu8354/AraSim/libAra.so') #load the simulation event library. You might get an error asking for the eventSim dictionry. To solve that, go to where you compiled AraSim, find that file, and copy it to where you set LD_LIBRARY_PATH.
gSystem.Load('libRayTraceCorrelator.so')

file_list=[]#Define an empty list
for filename in os.listdir("/fs/scratch/PAS0654/jorge/sim_results/simplified"):#Loop over desired directory
        # if filename.startswith("AraOut.default_A2_c1_E%s.txt.run%s.root"%(sys.argv[1],sys.argv[2])): #extension, .root in this case
        if filename.endswith("100.root"): #extension, .root in this case

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
Settings = ROOT.Settings()

Settings.ReadFile("/users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/setup.txt")
Settings.NOFZ=1;
Corr = ROOT.RayTraceCorrelator(2, 300., Settings)

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
