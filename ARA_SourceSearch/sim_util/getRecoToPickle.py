import sys
import csv
# sys.path.insert(0,"/users/PCON0003/cond0068/.local/lib/python3.7/")
sys.path.append("/users/PAS0654/osu8354/ARA_cvmfs/root_build/lib/") # go to parent dir
sys.path.append("/users/PCON0003/cond0068/.local/lib/python3.7/site-packages/")
# sys.path.append("/users/PCON0003/cond0068/pyrex_sims/fromBen/thesis_work/pyrex-custom/analysis/custom/analysis/")
import ROOT
from ROOT import TH1D,TF1, gRandom, gPad, gStyle
from ROOT import TChain, TSelector, TTree
import os
import pandas as pd
import numpy as np

file_list=[]#Define an empty list
for filename in os.listdir("/fs/project/PAS0654/ARA_DATA/A23/sim_SourceSearch/A2/Joined"):#Loop over desired directory
    if filename.endswith(".root"): #extension, .root in this case
        file_list.append(os.path.join("/fs/project/PAS0654/ARA_DATA/A23/sim_SourceSearch/A2/Joined", str(filename))) #add file name to the list
        
chain = TChain("OutputTree_recoRadius_19") #Define chain and tree that needs to be read. "RecoVals" in this case.
for line in file_list:
    chain.AddFile(line)
    
phi = []
theta = []
corr_value = []
weights = []
print("Looping over trees now")
for entry in chain:

    phi.append(entry.peakPhi_single[0]) 
    theta.append(entry.peakTheta_single[0])
    corr_value.append(entry.peakCorr_single[0])
    weights.append(entry.weight)
    

df = pd.DataFrame({"phi":np.array(phi),"theta":np.array(theta),"corr_value":np.array(corr_value), "weights":np.array(weights)})
df.to_pickle("./InterfRecoCenA.pkl")
    
