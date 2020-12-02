"""
#####deDisperse.py#####

Get E-field at antenna from AraSim events
Author: Jorge Torres
Date: Oct 20, 2020.
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


# import deDisperse_util as util
import pyrex

#add headers from AraSim. Not sure if all of them are needed, and I'm lazy to check that. MAK SURE to change the location of the headers
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Position.h"')
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Report.h"')
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Detector.h"')
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Settings.h"')
# gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/IceModel.h"')



gSystem.Load('/users/PAS0654/osu8354/AraSim/libAra.so') #load the simulation event library. You might get an error asking for the eventSim dictionry. To solve that, go to where you compiled AraSim, find that file, and copy it to where you set LD_LIBRARY_PATH.

file_list=[]#Define an empty list
file_list.append("/users/PAS0654/osu8354/AraSim/outputs/AraOut.default_A2_c1_E610_readIn.txt.runAraSim_comparison_input_test_1E19_2.txt.root")

simSettingsTree = TChain("AraTree")
eventTree = TChain("eventTree") #Define chain and tree that needs to be read. "VTree" in this case.
SimTree = TChain("AraTree2")

for line in file_list:
    eventTree.AddFile(line)
    SimTree.AddFile(line)
    simSettingsTree.AddFile(line)


reportPtr = ROOT.Report()#report pointer
eventPtr = ROOT.Event()
iceModelPtr = ROOT.IceModel()
detectorPtr = ROOT.Detector()


# eventTree = test.Get("eventTree")#eventTree, from AraSim output files
# SimTree = test.Get("AraTree2") #AraTree2, from AraSim output files
rawEvent = ROOT.UsefulAtriStationEvent()
eventTree.SetBranchAddress("UsefulAtriStationEvent",ROOT.AddressOf(rawEvent))
SimTree.SetBranchAddress("report",ROOT.AddressOf(reportPtr))
SimTree.SetBranchAddress("event", ROOT.AddressOf(eventPtr))
simSettingsTree.SetBranchAddress("icemodel", ROOT.AddressOf(iceModelPtr))
simSettingsTree.SetBranchAddress("detector", ROOT.AddressOf(detectorPtr))
simSettingsTree.GetEvent(0)
totalEvents = eventTree.GetEntries()
print('total events:', totalEvents)
isTrue=False
theta_reco = []
# theta_antenna = []
phi_reco = []
polVec_x = []
polVec_y = []
polVec_z = []
angle_stokes = []
angle_ratio = []
evt_num = []
rms = []
for i in range(0,totalEvents):#loop over events
    if(isTrue):
        break
    eventTree.GetEntry(i)
    SimTree.GetEntry(i)
    if(reportPtr.stations[0].Global_Pass <= 0):#making sure that the event did trigger, otherwise there won't be a waveform (this might not be needed if all waveforms are saved)
        continue
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

    # posnu.append(eventPtr.Nu_Interaction[0].posnu.GetX())
    # posnu.append(eventPtr.Nu_Interaction[0].posnu.GetY())
    # posnu.append(eventPtr.Nu_Interaction[0].posnu.GetZ())
    lon = eventPtr.Nu_Interaction[0].posnu.Lon()
    lat = eventPtr.Nu_Interaction[0].posnu.Lat()
    ice_surface = iceModelPtr.Surface(lon, lat)
    x = eventPtr.Nu_Interaction[0].posnu.GetX() - 10000.
    y = eventPtr.Nu_Interaction[0].posnu.GetY() - 10000.
    depth = ice_surface - eventPtr.Nu_Interaction[0].posnu.GetZ();
    posnu.append(x)
    posnu.append(y)
    posnu.append(-depth)
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
    # conversion = np.array([])
    print("posnu:%s"%posnu)
    print("nnu:%s"%nnu)
    print("weight:%f"%weight)
    print("current:%f"%current)
    print("inelast:%f"%inelast)
    print("emfrac:%f"%emfrac)
    print("hadfrac:%f"%hadfrac)
    print("flavor:%f"%flavor)
    print("nu_nubar:%f"%nu_nubar)
    print("energy:%e"%energy)
    lon = detectorPtr.stations[0].strings[0].antennas[0].Lon()
    lat = detectorPtr.stations[0].strings[0].antennas[0].Lat()
    ice_surface = iceModelPtr.Surface(lon, lat)
    x = detectorPtr.stations[0].strings[0].antennas[0].GetX() - 10000
    y = detectorPtr.stations[0].strings[0].antennas[0].GetY() - 10000.
    z = detectorPtr.stations[0].strings[0].antennas[0].GetZ()-ice_surface
    print("Antennna loc:(%0.3f,%0.3f,%0.3f)"%(x,y,ice_surface - detectorPtr.stations[0].strings[0].antennas[0].R()))
    for solNum in range(0,2):
        try:
            polVec_x_ = reportPtr.stations[0].strings[0].antennas[0].Pol_vector[solNum].GetX()
            polVec_y_ = reportPtr.stations[0].strings[0].antennas[0].Pol_vector[solNum].GetY()
            polVec_z_ = reportPtr.stations[0].strings[0].antennas[0].Pol_vector[solNum].GetZ()
        except:
            continue
        print("Solnum:%i, pol: (%0.3f,%0.3f,%0.3f)"%(solNum,polVec_x_,polVec_y_,polVec_y_))

    print(reportPtr.stations[0].strings[0].antennas[0].phi_rec)
        # print(reportPtr.stations[0].strings[0].antennas[0].Pol_factor)
    # print(reportPtr.stations[0].strings[0].antennas[0].view_ang[0])

    # print(reportPtr.stations[0].strings[0].antennas[0].Pol_factorH)
    # print(reportPtr.stations[0].strings[0].antennas[0].Pol_factorV)

    # Pol_factor = reportPtr.stations[0].strings[0].antennas[0].Pol_factor
    # print("Pol_factor:%0.3f"%Pol_factor)

    # break
