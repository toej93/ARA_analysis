import sys
# sys.path.append("/users/PAS0654/osu8354/root6_14_build/lib") # go to parent dir
# sys.path.append("/users/PCON0003/cond0068/.local/lib/python2.7/site-packages")
import ROOT
import math
import numpy as np
from ROOT import TH1D,TF1, gRandom, gPad, gStyle
import matplotlib.pyplot as plt
from ROOT import TChain, TSelector, TTree
import os
import pickle

def isBadrun(runNum):
    colname=["run"]
    import pandas as pd
    badRunList=pd.read_csv("/users/PCON0003/cond0068/ARA/AraRoot/analysis/ARA_analysis/files/badRuns_list_A3.txt",names=colname)
    return (badRunList["run"]==runNum).any()

print("Loaded PyROOT")

colnames={'run_number': [],
 'rms_ch0': [],
 'rms_ch1': [],
 'rms_ch2': [],
 'rms_ch3': [],
 'rms_ch4': [],
 'rms_ch5': [],
 'rms_ch6': [],
 'rms_ch7': [],
 'rms_ch8': [],
 'rms_ch9': [],
 'rms_ch10': [],
 'rms_ch11': [],
 'rms_ch12': [],
 'rms_ch13': [],
 'rms_ch14': [],
 'rms_ch15': [],
}
# colnames=dict.fromkeys(["rms_ch{0}".format(x) for x in range(0,16)],[])

for filename in os.listdir("/fs/project/PAS0654/ARA_DATA/A23/10pct/other_studies/BasicInfo/A3/c%s/" % (sys.argv[1])):#Loop over desired directory
    if filename.endswith(".root"): #extension, .root in this case
        f = ROOT.TFile.Open(os.path.join("/fs/project/PAS0654/ARA_DATA/A23/10pct/other_studies/BasicInfo/A3/c%s/" % (sys.argv[1]), str(filename)))
        numEntries=f.outTree.GetEntries()
        f.outTree.GetEntry(0)
        runNum=f.outTree.runNum
        if(isBadrun(runNum)):
            continue
        if numEntries==0:
            continue
        f.outTree.GetEntry(0)
        if(f.outTree.isKnownBadRun)>0:
            continue
        for entry in f.outTree:
            colnames["run_number"].append(f.outTree.runNum)
            for i in range(0,16):
                colnames["rms_ch{0}".format(i)].append(f.outTree.deepChannelRMS[i])

#Dump onto pickle file
with open('./files/RMS_A3_c%s.pickle'% (sys.argv[1]), 'wb') as handle:
    pickle.dump(colnames, handle, protocol=pickle.HIGHEST_PROTOCOL)
