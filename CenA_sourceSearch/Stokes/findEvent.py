"""
#####findEvent.py#####

Find information about a particular event from AraSim outputs
Author: Jorge Torres
Date: Nov 28, 2020.
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

def makeInputFile(posnu_x, posnu_y, posnu_z, nnu_x, nnu_y, nnu_z, nuflavorint, nu_nubar, pnu, currentint, elast_y, EvNum):
    """
    Make input file to be read by AraSim (only works if using A2). It's very rudimentary, but it works.
    Author: Jorge Torres, Dec 3.
    Parameters
    ----------
    All the inputs are given in AraSim output coordinates/units.
    Returns
    -------
    Prints something that can be copied and pasted as an input file.
    """
    #posnu
    posNu = np.array([posnu_x, posnu_y, posnu_z])
    avgVec = np.array([10000.83568, 9998.89765, 6359452.44702])
    posNu2 = posNu-avgVec #AraSim adds avgVec when transforming coordinates, and this is what AraSim outputs
    norm = np.linalg.norm(posNu2)
    posNu2 = posNu2/norm#Normalize
    posnu_r = norm
    
    posnu_theta = np.pi/2-np.arccos(posNu2[2])
    posnu_phi = np.arctan2(posNu2[1],posNu2[0])%(2*np.pi)

    #nnu
    nnu = np.array([nnu_x, nnu_y, nnu_z])
    nnu_phi = np.arctan2(nnu[1],nnu[0])%(2*np.pi)
    nnu_theta = np.arccos(nnu[2])
    filenameIn = '/users/PAS0654/osu8354/AraSim/AraSim_input_event%i.txt'%(EvNum)
    with open(filenameIn, 'w') as f:
        print("//VERSION=0.1\n//EVENT_NUM=" + str(1) + 
              "\n//evid nuflavorint nu_nubar pnu currentint posnu_r posnu_theta posnu_phi nnu_theta nnu_phi elast_y", file=f)
        print("{:08d} {:01d} {:01d} {:.3f} {:01d} {:.4f} {:.4f} {:.4f} {:.4f} {:.4f} {:.4f}\n".format(1, 
            int(nuflavorint), int(nu_nubar), pnu, int(currentint), posnu_r, posnu_theta, posnu_phi, nnu_theta, nnu_phi, elast_y), file=f)
        
        
#add headers from AraSim. Not sure if all of them are needed, and I'm lazy to check that. MAK SURE to change the location of the headers
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Position.h"')
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Report.h"')
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Detector.h"')
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Settings.h"')

gSystem.Load('/users/PAS0654/osu8354/AraSim/libAra.so') #load the simulation event library. You might get an error asking for the eventSim dictionry. To solve that, go to where you compiled AraSim, find that file, and copy it to where you set LD_LIBRARY_PATH.

file_list=[]#Define an empty list
for filename in os.listdir("/fs/scratch/PAS0654/jorge/sim_results/noiseOn"):#Loop over desired directory
        if (filename.startswith("AraOut.default_A2_c1_E600.txt.run40")): #extension, .root in this case
            file_list.append(os.path.join("/fs/scratch/PAS0654/jorge/sim_results/noiseOn", str(filename))) #add file name to the list



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
eventNum = 13527
for i in range(eventNum,totalEvents):#loop over events
    # if(isTrue):
    #     break
    eventTree.GetEntry(i)
    SimTree.GetEntry(i)
    if(reportPtr.stations[0].Global_Pass <= 0):#making sure that the event did trigger, otherwise there won't be a waveform (this might not be needed if all waveforms are saved)
        continue
    try:
        whichSol = 0
        # whichSol = reportPtr.stations[0].strings[0].antennas[0].Likely_Sol #0: direct, #1: reflected/refracted
        # if(whichSol<0):#If it can't pick what solution triggered, AraSim returns -1
        #     continue
        theta_antenna_ = reportPtr.stations[0].strings[0].antennas[0].theta_rec[whichSol]
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
    # if(abs(dotProd)):
    # if(1==1):

    if(i==eventNum):
        print("---New event---")
        print(i)
        # print(dotProd)
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
        print("flavor:%i"%flavor)
        print("nu_nubar:%i"%nu_nubar)
        print("energy:%e"%energy)
        print("current:%i"%current)
        print("inelast:%f"%inelast)
        print("emfrac:%f"%emfrac)
        print("hadfrac:%f"%hadfrac)
        print("weight:%f"%weight)

        # print("theta:%f"%theta)
        # print("phi:%f"%phi)
        # print("pol True: (%0.6f,%0.6f,%0.6f)"%(polVec_x_,polVec_y_,polVec_z_))
        # for string in range(4):
        #     for ch in range(4):
        #         print("ViewAngle [string:%i, antenna %i]: %0.3f deg"%(string,ch,np.degrees(reportPtr.stations[0].strings[string].antennas[ch].view_ang[0])))
        # makeInputFile(posnu[0],posnu[1],posnu[2],nnu[0],nnu[1],nnu[2],flavor,nu_nubar,np.log10(energy),current,inelast,eventNum)



        break
