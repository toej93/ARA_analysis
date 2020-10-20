"""
#####getRMS.py#####

Get RMS of events
Author: Jorge Torres
Date: Jul 28, 2020.
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

import deDisperse_util as util
import pyrex
import warnings
warnings.filterwarnings("ignore")

#add headers from AraSim. Not sure if all of them are needed, and I'm lazy to check that. MAK SURE to change the location of the headers
gInterpreter.ProcessLine('#include "/users/PCON0003/cond0068/ARA/AraSim/Position.h"')
gInterpreter.ProcessLine('#include "/users/PCON0003/cond0068/ARA/AraSim/Report.h"')
gInterpreter.ProcessLine('#include "/users/PCON0003/cond0068/ARA/AraSim/Detector.h"')
gInterpreter.ProcessLine('#include "/users/PCON0003/cond0068/ARA/AraSim/Settings.h"')

gSystem.Load('libAra.so') #load the simulation event library. You might get an error asking for the eventSim dictionry. To solve that, go to where you compiled AraSim, find that file, and copy it to where you set LD_LIBRARY_PATH.


# test = ROOT.TFile.Open("/fs/scratch/PAS0654/jorge/sim_results/CenA_atzero/AraOut.CenA_fixed_source_seed4.txt.run0.root")#directory where the simulation files are
# test = ROOT.TFile.Open("/fs/scratch/PAS0654/jorge/sim_results/default/AraOut.default_A2_c1_E610.txt.run9.root")

file_list=[]#Define an empty list
for filename in os.listdir("/fs/scratch/PAS0654/jorge/sim_results/default"):#Loop over desired directory
    if (filename.startswith("AraOut.default_A2_c1_E610.txt.run%s"%(sys.argv[1]))): #extension, .root in this case
        file_list.append(os.path.join("/fs/scratch/PAS0654/jorge/sim_results/default", str(filename))) #add file name to the list


print("All files that start with %s"% (sys.argv[1]))
eventTree = TChain("eventTree") #Define chain and tree that needs to be read. "VTree" in this case.
SimTree = TChain("AraTree2")

for line in file_list:
    eventTree.AddFile(line)
    SimTree.AddFile(line)

reportPtr = ROOT.Report()#report pointer
# eventTree = test.Get("eventTree")#eventTree, from AraSim output files
# SimTree = test.Get("AraTree2") #AraTree2, from AraSim output files
rawEvent = ROOT.UsefulAtriStationEvent()
eventTree.SetBranchAddress("UsefulAtriStationEvent",ROOT.AddressOf(rawEvent))
SimTree.SetBranchAddress("report",ROOT.AddressOf(reportPtr))

totalEvents = eventTree.GetEntries()
print('total events:', totalEvents)
print("./pol_quant_debug_%s.pkl"%(sys.argv[1]))
# isTrue=False
# for i in range(0,1000):#loop over events
#     # if(isTrue):
#     #     break
#     eventTree.GetEntry(i)
#     SimTree.GetEntry(i)
#     if(reportPtr.stations[0].Global_Pass <= 0):#making sure that the event did trigger, otherwise there won't be a waveform (this might not be needed if all waveforms are saved)
#         continue
#     # isTrue=True
#     graph = rawEvent.getGraphFromRFChan(0)#print waveform
#     t=[]
#     v=[]
#     for k in range(0,graph.GetN()):
#       t.append(graph.GetX()[k])
#       v.append(graph.GetY()[k])
#     print(np.array(v[:100]).std())
#     print("WORKS!!!!")
#     # plt.plot(t[:100],v[:100])
#     # plt.xlabel("Time [ns]")
#     # plt.ylabel("Voltage [mV]")
#     # plt.show()
