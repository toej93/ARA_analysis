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


# test = ROOT.TFile.Open("/fs/scratch/PAS0654/jorge/sim_results/CenA_atzero/AraOut.CenA_fixed_source_seed4.txt.run0.root")#directory where the simulation files are
# test = ROOT.TFile.Open("/fs/scratch/PAS0654/jorge/sim_results/default/AraOut.default_A2_c1_E610.txt.run9.root")

file_list=[]#Define an empty list
# for filename in os.listdir("/fs/scratch/PAS0654/jorge/sim_results/noiseOn"):#Loop over desired directory
#         if filename.startswith("AraOut.default_A2_c1_E600.txt.run40"): #extension, .root in this case
#             file_list.append(os.path.join("/fs/scratch/PAS0654/jorge/sim_results/noiseOn", str(filename))) #add file name to the list
file_list.append("/fs/scratch/PAS0654/jorge/sim_results/simplified/AraOut.default_A2_c1_E580.txt.run0.root")

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
for i in range(0,totalEvents):#loop over events
    # if(isTrue):
    #     break
    eventTree.GetEntry(i)
    SimTree.GetEntry(i)
    if(reportPtr.stations[0].Global_Pass <= 0):#making sure that the event did trigger, otherwise there won't be a waveform (this might not be needed if all waveforms are saved)
        continue
    # Check if any of the top antennas has no signal. Reject those events
    
    gr = [None]*16
    fig, axs = plt.subplots(4, 4, figsize = (12,10))
    axs = axs.ravel()
    for ch in range(0,16):
        t = []
        v = []
        gr[ch] = rawEvent.getGraphFromRFChan(ch)#print waveform
        for kk in range(0,gr[ch].GetN()):
          t.append(gr[ch].GetX()[kk])
          v.append(gr[ch].GetY()[kk])
        axs[ch].plot(t,v,linewidth=0.5, label = "Ch %i"%ch)
        axs[ch].legend()
        # if(ch==0):
        #     print(np.array(v).std())
        plt.grid(which="both")
        axs[ch].set_ylim(-1500,1500)
    plt.tight_layout()
    plt.savefig("/users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/thesis_work_daily/plots/Dumpster/wf_all_simple_ev%i.png"%i, dpi=100)
    # break
