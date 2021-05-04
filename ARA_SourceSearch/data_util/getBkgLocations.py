import sys

if len(sys.argv) < 2:
    print("Run like python getBkgLocations.py.py <config>") 
    exit(0)

config = int(sys.argv[1])
print('Running config: %i'%config)

import ROOT
import math
import numpy as np
from ROOT import TH1D,TF1, gRandom, gPad, gStyle
import matplotlib as mpl
import matplotlib.pyplot as plt
from ROOT import TChain, TSelector, TTree
import os
import scipy
import pandas as pd
import re

srcFolder = "/fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ValsForCuts/A2/c%i/"%config
file_list=[]#Define an empty list
for filename in os.listdir(srcFolder):#Loop over desired directory
    if filename.endswith(".root"): #extension, .root in this case
        file_list.append(os.path.join(srcFolder, str(filename))) #add file name to the list
        
VTree = TChain("VTree")
HTree = TChain("HTree")
AllTree = TChain("AllTree")
OutputTree = TChain("OutputTree")
for line in file_list:
    try:
        VTree.AddFile(line)
        HTree.AddFile(line)
        AllTree.AddFile(line) 
        OutputTree.AddFile(line)
    except:
        continue
    
phi = []
theta = []
unixTime = []
neutrinoBox = []
controlSample = []
crossCheck = []
RA = []
Dec = []

numEntries = AllTree.GetEntries()
for event in range(numEntries):
    VTree.GetEntry(event)
    HTree.GetEntry(event)
    AllTree.GetEntry(event)
    OutputTree.GetEntry(event)
    if(AllTree.cal or AllTree.soft or AllTree.CW or AllTree.box or AllTree.bad or AllTree.short or AllTree.isFirstFiveEvent or AllTree.hasBadSpareChanIssue or AllTree.surf_top_V or AllTree.surf_top_H or VTree.wfrms_val_V_new or HTree.wfrms_val_H_new or AllTree.surf_V_vertex or AllTree.surf_H_vertex or AllTree.bad_updated or AllTree.isSpikey or AllTree.badRun or VTree.wfrms_val_V_new or HTree.wfrms_val_H_new or AllTree.surf_H_new or AllTree.surf_V_new or AllTree.hasBadSpareChanIssue2 or AllTree.CenA_OnSP):
        continue
#     print(VTree.wfrms_val_V_new)

    theta.append(VTree.theta_300_V_new)
    phi.append(VTree.phi_300_V_new)
    unixTime.append(AllTree.unixTime)
    RA.append(AllTree.RA)
    Dec.append(AllTree.Dec)
    neutrinoBox.append(AllTree.neutrinoBox)
    controlSample.append(AllTree.isInControlSample)
    crossCheck.append(AllTree.isCrossCheck)

df = pd.DataFrame({"theta":np.array(theta),"phi": np.array(phi),"unixTime": np.array(unixTime), "RA":np.array(RA), "Dec":np.array(Dec), "neutrinoBox":np.array(neutrinoBox), "controlSample":np.array(controlSample), "crossCheck":np.array(crossCheck) })
# df.to_pickle("./debug.pkl")
df.to_pickle("./bkgDistribution_%i.pkl"%config)
