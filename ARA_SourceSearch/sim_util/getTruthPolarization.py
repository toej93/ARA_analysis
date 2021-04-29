"""
#####deDisperse.py#####

Plot waveforms from AraSim events with Python
Author: Jorge Torres
Date: Apr 27, 2021.
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
import warnings
warnings.filterwarnings("ignore")

#add headers from AraSim. Not sure if all of them are needed, and I'm lazy to check that. MAK SURE to change the location of the headers
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Position.h"')
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Report.h"')
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Detector.h"')
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Settings.h"')

gSystem.Load('/users/PAS0654/osu8354/AraSim/libAra.so') #load the simulation event library. You might get an error asking for the eventSim dictionry. To solve that, go to where you compiled AraSim, find that file, and copy it to where you set LD_LIBRARY_PATH.

file_list=[]#Define an empty list
srcFolder = "/fs/scratch/PAS0654/jorge/sim_results/CenAFluxFixed/"
for filename in os.listdir(srcFolder):#Loop over desired directory
        if filename.endswith(".root"): #extension, .root in this case
            file_list.append(os.path.join(srcFolder, str(filename))) #add file name to the list
# file_list.append("/fs/scratch/PAS0654/jorge/sim_results/CenAFluxFixed/AraOut.default_fixSrc_A2_c1_Flux.txt.run9.root")

noise=True
eventTree = TChain("eventTree") #Define chain and tree that needs to be read. "VTree" in this case.
SimTree = TChain("AraTree2")

for line in file_list:
    eventTree.AddFile(line)
    SimTree.AddFile(line)

reportPtr = ROOT.Report()#report pointer
eventPtr = ROOT.Event()

# eventTree = test.Get("eventTree")#eventTree, from AraSim output files
# SimTree = test.Get("AraTree2") #AraTree2, from AraSim output files
rawEvent = ROOT.UsefulAtriStationEvent()
eventTree.SetBranchAddress("UsefulAtriStationEvent",ROOT.AddressOf(rawEvent))
SimTree.SetBranchAddress("report",ROOT.AddressOf(reportPtr))
SimTree.SetBranchAddress("event", ROOT.AddressOf(eventPtr))

totalEvents = eventTree.GetEntries()
print('total events:', totalEvents)
isTrue=False
# evNum = int(sys.argv[1])
###Needed variables

polVec_x = []
polVec_y = []
polVec_z = []
weight = []
for i in range(0,totalEvents):#loop over events
    # if(isTrue):
    #     break
    eventTree.GetEntry(i)
    SimTree.GetEntry(i)
    if(reportPtr.stations[0].Global_Pass <= 0):#making sure that the event did trigger, otherwise there won't be a waveform (this might not be needed if all waveforms are saved)
        continue
        
    whichSol = 0 #Direct sol
    
    try:
        polVec_x_ = reportPtr.stations[0].strings[0].antennas[0].Pol_vector[whichSol].GetX()
        polVec_y_ = reportPtr.stations[0].strings[0].antennas[0].Pol_vector[whichSol].GetY()
        polVec_z_ = reportPtr.stations[0].strings[0].antennas[0].Pol_vector[whichSol].GetZ()
    except:
        continue
        
    polVec_x.append(polVec_x_)
    polVec_y.append(polVec_y_)
    polVec_z.append(polVec_z_)
    weight.append(eventPtr.Nu_Interaction[0].weight)
    
df = pd.DataFrame({"px":np.array(polVec_x),"py":np.array(polVec_y),"pz":np.array(polVec_z), "weight":np.array(weight)})
df.to_pickle("./MCTruthPolarization.pkl")
    
