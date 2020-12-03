"""
#####getAntennaPositionsAraSim.py#####

Get positions of antennas with AraSim
Author: Jorge Torres
Date: Dec 3, 2020.
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

#add headers from AraSim. Not sure if all of them are needed, and I'm lazy to check that. MAK SURE to change the location of the headers
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Position.h"')
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Report.h"')
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Detector.h"')
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Settings.h"')

gSystem.Load('/users/PAS0654/osu8354/AraSim/libAra.so') #load the simulation event library. You might get an error asking for the eventSim dictionry. To solve that, go to where you compiled AraSim, find that file, and copy it to where you set LD_LIBRARY_PATH.


# test = ROOT.TFile.Open("/fs/scratch/PAS0654/jorge/sim_results/CenA_atzero/AraOut.CenA_fixed_source_seed4.txt.run0.root")#directory where the simulation files are
# test = ROOT.TFile.Open("/fs/scratch/PAS0654/jorge/sim_results/default/AraOut.default_A2_c1_E610.txt.run9.root")

file_list=[]#Define an empty list
for filename in os.listdir("/users/PAS0654/osu8354/AraSim/outputs"):#Loop over desired directory
		if (filename.startswith("AraOut.default_A2_c1_E610_readIn.txt.runAraSim_comparison_input_test_1E19_3022.txt.root")): #extension, .root in this case
			file_list.append(os.path.join("/users/PAS0654/osu8354/AraSim/outputs", str(filename))) #add file name to the list



simSettingsTree = TChain("AraTree")
simTree = TChain("AraTree2")

for line in file_list:
    simTree.AddFile(line)
    simSettingsTree.AddFile(line)

reportPtr = ROOT.Report()
detectorPtr = ROOT.Detector()

simTree.SetBranchAddress("report", ROOT.AddressOf(reportPtr))
simSettingsTree.SetBranchAddress("detector", ROOT.AddressOf(detectorPtr))
numEvents = simTree.GetEntries()


simTree.GetEntry(0)
simSettingsTree.GetEntry(0)

print("String 0 (x,y) coordinates: (%0.5f,%0.5f)"%(detectorPtr.stations[0].strings[0].GetX()-10000,detectorPtr.stations[0].strings[0].GetY()-10000))

geomTool = ROOT.AraGeomTool.Instance()
# loc = geomTool.getStationInfo(2).getAntennaInfo(0).antLocation
# print(loc[1])


x = []
y = []

# the x-y coordinates of channels 0-3 are enough for a top down view
for ant in range(4):
    ant_location = geomTool.getStationInfo(2).getAntennaInfo(ant).antLocation
    x.append(ant_location[0])
    y.append(ant_location[1])
    print("Antenna:%i"%ant)
    print("Antenna (x,y) coordinates: (%0.5f,%0.5f)"%(ant_location[0],ant_location[1]))

# make a plot
