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
import sys
import deDisperse_util as util
import pyrex
import warnings
warnings.filterwarnings("ignore")

#add headers from AraSim. Not sure if all of them are needed, and I'm lazy to check that. MAK SURE to change the location of the headers
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Position.h"')
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Report.h"')
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Detector.h"')
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Settings.h"')

gSystem.Load('/users/PAS0654/osu8354/AraSim/libAra.so') #load the simulation event library. You might get an error asking for the eventSim dictionry. To solve that, go to where you compiled AraSim, find that file, and copy it to where you set LD_LIBRARY_PATH.

file_list=[]#Define an empty list
for filename in os.listdir("/fs/scratch/PAS0654/jorge/sim_results/bug_fixed_noiseless"):#Loop over desired directory
        if (filename.startswith("AraOut.default_noiseless_A2_c1_E610")): #extension, .root in this case
            file_list.append(os.path.join("/fs/scratch/PAS0654/jorge/sim_results/bug_fixed_noiseless", str(filename))) #add file name to the list



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
eventPtr = ROOT.Event()
SimTree.SetBranchAddress("event", ROOT.AddressOf(eventPtr))

totalEvents = eventTree.GetEntries()
print('total events:', totalEvents)

for i in range(0,totalEvents):#loop over events
    # if(isTrue):
    #     break
    eventTree.GetEntry(i)
    SimTree.GetEntry(i)
    if(reportPtr.stations[0].Global_Pass <= 0):#making sure that the event did trigger, otherwise there won't be a waveform (this might not be needed if all waveforms are saved)
        continue

    try:
        whichSol = reportPtr.stations[0].strings[0].antennas[0].Likely_Sol #0: direct, #1: reflected/refracted
        # if(whichSol<0):#If it can't pick what solution triggered, AraSim returns -1
        #     continue
        theta_antenna_ = reportPtr.stations[0].strings[0].antennas[0].rec_ang[whichSol]
        phi_ant = reportPtr.stations[0].strings[0].antennas[0].phi_rec[whichSol]

    except:
        continue

    try:
        polVec_x_ = reportPtr.stations[0].strings[0].antennas[0].Pol_vector[whichSol].GetX()
        polVec_y_ = reportPtr.stations[0].strings[0].antennas[0].Pol_vector[whichSol].GetY()
        polVec_z_ = reportPtr.stations[0].strings[0].antennas[0].Pol_vector[whichSol].GetZ()
    except:
        continue
    theta = theta_antenna_
    phi = phi_ant
    pol_ev = np.array([polVec_x_,polVec_y_,polVec_z_])
    dirProp = np.array([np.sin(theta)*np.cos(phi),np.sin(theta)*np.sin(phi),np.cos(theta)])
    dotProd = np.dot(pol_ev,dirProp)
    if(abs(dotProd>0.8)):
        print(dotProd)
        posnu = []
        nnu = []
        weight = -1
        current = -1
        inelasticity = -1
        emfrac = -1
        hadfrac = -1
        flavor = -1
        nu_nubar = -1
        energy = -1
        posnu.append(eventPtr.Nu_Interaction[0].posnu.GetX())
        posnu.append(eventPtr.Nu_Interaction[0].posnu.GetY())
        posnu.append(eventPtr.Nu_Interaction[0].posnu.GetZ())
        nnu.append(eventPtr.Nu_Interaction[0].nnu.GetX())
        nnu.append(eventPtr.Nu_Interaction[0].nnu.GetY())
        nnu.append(eventPtr.Nu_Interaction[0].nnu.GetZ())
        weight = eventPtr.Nu_Interaction[0].weight
        current = eventPtr.Nu_Interaction[0].currentint
        inelast = eventPtr.Nu_Interaction[0].elast_y
        emfrac = eventPtr.Nu_Interaction[0].emfrac
        hadfrac = eventPtr.Nu_Interaction[0].hadfrac
        flavor = eventPtr.nuflavorint
        nu_nubar = eventPtr.nu_nubar
        energy = eventPtr.pnu
        print("posnu:%s"%posnu)
        print("nnu:%s"%nnu)
        print("weight:%f"%weight)
        print("current:%i"%current)
        print("inelast:%f"%inelast)
        print("emfrac:%f"%emfrac)
        print("hadfrac:%f"%hadfrac)
        print("flavor:%i"%flavor)
        print("nu_nubar:%i"%nu_nubar)
        print("energy:%e"%energy)
        break
