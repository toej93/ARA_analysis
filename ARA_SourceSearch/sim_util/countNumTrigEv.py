"""
#####deDisperse.py#####
Count number of triggered events
Author: Jorge Torres
Date: Apr 22, 2021
"""
from ROOT import TCanvas, TGraph
from ROOT import gROOT
import ROOT
import os
# import pandas as pd
# import matplotlib.pyplot as plt
# import numpy as np
from ROOT import gInterpreter, gSystem
from ROOT import TChain, TSelector, TTree
# import scipy

#add headers from AraSim. Not sure if all of them are needed, and I'm lazy to check that. MAK SURE to change the location of the headers
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Position.h"')
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Report.h"')
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Detector.h"')
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Settings.h"')
# gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/IceModel.h"')

gSystem.Load('/users/PAS0654/osu8354/AraSim/libAra.so') #load the simulation event library. You might get an error asking for the eventSim dictionry. To solve that, go to where you compiled AraSim, find that file, and copy it to where you set LD_LIBRARY_PATH.

file_list=[]#Define an empty list
#file_list.append("/users/PAS0654/osu8354/AraSim/outputs/AraOut.setupExample.txt.run1.root")
for filename in os.listdir("/fs/scratch/PAS0654/jorge/sim_results/CenAFluxFixed"):#Loop over desired directory
    if filename.endswith(".root"): #extension, .root in this case
        file_list.append(os.path.join("/fs/scratch/PAS0654/jorge/sim_results/CenAFluxFixed", str(filename))) #add file name to the list

simSettingsTree = TChain("AraTree")
eventTree = TChain("eventTree") #Define chain and tree that needs to be read. "VTree" in this case.
SimTree = TChain("AraTree2")

for line in file_list:
    eventTree.AddFile(line)
    SimTree.AddFile(line)
    simSettingsTree.AddFile(line)


reportPtr = ROOT.Report()#report pointer
eventPtr = ROOT.Event()

rawEvent = ROOT.UsefulAtriStationEvent()
eventTree.SetBranchAddress("UsefulAtriStationEvent",ROOT.AddressOf(rawEvent))
SimTree.SetBranchAddress("report",ROOT.AddressOf(reportPtr))
SimTree.SetBranchAddress("event", ROOT.AddressOf(eventPtr))
# simSettingsTree.SetBranchAddress("icemodel", ROOT.AddressOf(iceModelPtr))
# simSettingsTree.SetBranchAddress("detector", ROOT.AddressOf(detectorPtr))
# simSettingsTree.GetEvent(0)
totalEvents = SimTree.GetEntries()
print('total events:', totalEvents)
trigEvs=0
for i in range(0,totalEvents):#loop over events

    eventTree.GetEntry(i)
    SimTree.GetEntry(i)
    if(reportPtr.stations[0].Global_Pass <= 0):#making sure that the event did trigger, otherwise there won't be a waveform (this might not be needed if all waveforms are saved)
        continue
    trigEvs+=1
print("Number of triggered events: %i"%trigEvs)
