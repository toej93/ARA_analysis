"""
#####deDisperse.py#####

Get de-dispersed waveform from AraSim events with Python
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

import deDisperse_util as util
import pyrex

#add headers from AraSim. Not sure if all of them are needed, and I'm lazy to check that. MAK SURE to change the location of the headers
gInterpreter.ProcessLine('#include "/users/PCON0003/cond0068/ARA/AraSim/Position.h"')
gInterpreter.ProcessLine('#include "/users/PCON0003/cond0068/ARA/AraSim/Report.h"')
gInterpreter.ProcessLine('#include "/users/PCON0003/cond0068/ARA/AraSim/Detector.h"')
gInterpreter.ProcessLine('#include "/users/PCON0003/cond0068/ARA/AraSim/Settings.h"')

gSystem.Load('libAra.so') #load the simulation event library. You might get an error asking for the eventSim dictionry. To solve that, go to where you compiled AraSim, find that file, and copy it to where you set LD_LIBRARY_PATH.


# test = ROOT.TFile.Open("/fs/scratch/PAS0654/jorge/sim_results/CenA_atzero/AraOut.CenA_fixed_source_seed4.txt.run0.root")#directory where the simulation files are
# test = ROOT.TFile.Open("/fs/scratch/PAS0654/jorge/sim_results/default/AraOut.default_A2_c1_E610.txt.run9.root")

file_list=[]#Define an empty list
for filename in os.listdir("/fs/scratch/PAS0654/jorge/sim_results/CenA_atzero/"):#Loop over desired directory
    if filename.endswith(".root"): #extension, .root in this case
        file_list.append(os.path.join("/fs/scratch/PAS0654/jorge/sim_results/CenA_atzero/", str(filename))) #add file name to the list



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
isTrue=False
theta_reco = []
theta_antenna = []
for i in range(0,totalEvents):#loop over events
    # if(isTrue):
    #     break
    eventTree.GetEntry(i)
    SimTree.GetEntry(i)
    if(reportPtr.stations[0].Global_Pass <= 0):#making sure that the event did trigger, otherwise there won't be a waveform (this might not be needed if all waveforms are saved)
        continue
    rec_angle = []
    for ch_ID in range(0,4):
        try:
            rec_angle.append(reportPtr.stations[0].strings[0].antennas[ch_ID].rec_ang[0])
        except:
            continue
    # doing nothing on exception
    try:
        theta_antenna.append(np.rad2deg(np.array(rec_angle).mean()))#180-rec_PyREx should be approx. equal to this avg
    except:
        continue
    gr = [None]*8
    pyrex_array = []

    for ch in [0,4,1,5,2,6,3,7]:
        t = []
        v = []
        gr[ch] = rawEvent.getGraphFromRFChan(ch)#print waveform
        for i in range(0,gr[ch].GetN()):
          t.append(gr[ch].GetX()[i])
          v.append(gr[ch].GetY()[i])
        pyrex_array.append(pyrex.Signal(1E-9*np.array(t), 1E-3*np.array(v)))#Convert to seconds and volts
    isTrue=True
    plotting = False
    if(plotting == True):
        fig, axs = plt.subplots(2, 4, figsize = (10,10))
        axs = axs.ravel()
        for ch in [0,4,1,5,2,6,3,7]:
            t = []
            v = []
            # gr[ch] = rawEvent.getGraphFromRFChan(ch)#print waveform
            for i in range(0,gr[ch].GetN()):
              t.append(gr[ch].GetX()[i])
              v.append(gr[ch].GetY()[i])
            axs[ch].plot(t,v,linewidth=0.5, label = "Ch %i"%ch)
            axs[ch].legend()
        # plt.title("An example of a triggered simulated event with Python")
        # plt.xlabel("Time [ns]")
        # plt.ylabel("Voltage [mV]")
        plt.tight_layout()
        plt.show()
    vertex, corrValue = util.doReco(pyrex_array)
    theta_reco.append(180-vertex[1])
    # print(vertex[1])
# original_df = pd.DataFrame({"theta_reco": np.array(theta_reco), "theta_antenna": np.array(theta_antenna)})
# original_df.to_pickle("./angles.pkl")
