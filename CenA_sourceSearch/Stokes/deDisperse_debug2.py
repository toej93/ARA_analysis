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
import itertools
warnings.filterwarnings("ignore")
my_path_plots = os.path.abspath("/users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/thesis_work_daily/plots")



#add headers from AraSim. Not sure if all of them are needed, and I'm lazy to check that. MAK SURE to change the location of the headers
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Position.h"')
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Report.h"')
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Detector.h"')
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Settings.h"')

gSystem.Load('/users/PAS0654/osu8354/AraSim/libAra.so') #load the simulation event library. You might get an error asking for the eventSim dictionry. To solve that, go to where you compiled AraSim, find that file, and copy it to where you set LD_LIBRARY_PATH.

Interpol = pd.read_csv("/users/PAS0654/osu8354/AraSim/outputs/interp.csv")
InterpolV = pd.read_csv("/users/PAS0654/osu8354/AraSim/outputs/interpV.csv")

theta = np.radians(100.04)
phi = np.radians(262.94)

# time_beforeH,deC_H_before = util.deConvolve_antenna(Interpol.T_forfft,Interpol.V_forfft, theta,phi,1)
# time_afterH,deC_H_after = util.deConvolve_antenna(Interpol.T_forint,Interpol.V_forint, theta,phi,1)
# 
# # plt.figure(figsize=(8,5))
# dTH = time_beforeH[1]-time_beforeH[0]
# print("dTH = %0.5f"%dTH)
# powerH = np.sum(deC_H_before**2)*dTH
# # powerH = util.findMaxSign(deC_H_before)
# 
# print(powerH)
# 
# time_beforeV,deC_V_before = util.deConvolve_antenna(InterpolV.T_forfft,InterpolV.V_forfft
# , theta,phi,0)
# time_afterV,deC_V_after = util.deConvolve_antenna(InterpolV.T_forint,InterpolV.V_forint, theta,phi,0)
# 
# # plt.figure(figsize=(8,5))
# dTV = time_beforeV[1]-time_beforeV[0]
# powerV = np.sum(deC_V_before**2)*dTV
# # powerV = util.findMaxSign(deC_V_before)
# # print("dTV = %0.5f"%dTV)
# 
# print(powerV)
# ratio = np.sqrt(powerH/powerV)
# print("Ratio:%0.6f"%ratio)
# print("------AFTER-------")
# # plt.plot(InterpolV.T_forint,InterpolV.V_forint*0.9988589999860037
# # , label = "Before [$A_{max} = %0.3e$]"%powerV)
# #
# dTH = time_afterH[1]-time_afterH[0]
# powerH = np.sum(deC_H_after**2)*dTH
# # powerH = util.findMaxSign(deC_H_after)
# 
# print(powerH)
# 
# dTV = time_afterV[1]-time_afterV[0]
# powerV = np.sum(deC_V_after**2)*dTV
# # powerV = util.findMaxSign(deC_V_after)
# 
# print(powerV)
# ratio = np.sqrt(powerH/powerV)
# print("Ratio:%0.6f"%ratio)

# plt.plot(InterpolV.T_forint,InterpolV.V_forint*1000,label="Vpol")
# plt.plot(Interpol.T_forint,Interpol.V_forint*1000,label="Hpol")
# plt.grid()
# plt.legend()
# plt.savefig(my_path_plots+'/Dumpster/beforeAfter.png', dpi=150)

####### No deconvolution ######
dTH = Interpol.T_forfft[1]-Interpol.T_forfft[0]
print("dTH = %0.5f"%dTH)
powerH = np.sum((Interpol.V_forfft*0.9380)**2)*dTH

dTV = InterpolV.T_forfft[1]-InterpolV.T_forfft[0]
powerV = np.sum((InterpolV.V_forfft*0.3466)**2)*dTV

ratio = np.sqrt(powerH/powerV)
print("Ratio:%0.6f"%ratio)

print("------AFTER-------")

dTH = Interpol.T_forint[1]-Interpol.T_forint[0]
print("dTH = %0.5f"%dTH)
powerH = np.sum((Interpol.V_forint*0.9380)**2)*dTH

dTV = InterpolV.T_forint[1]-InterpolV.T_forint[0]
powerV = np.sum((InterpolV.V_forint*0.3466)**2)*dTV

ratio = np.sqrt(powerH/powerV)
print("Ratio:%0.6f"%ratio)
