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
import reco_util as util
import pyrex
import warnings
import pyrex.custom.ara as ara
import time

warnings.filterwarnings("ignore")

theta = np.pi/2
phi = 0 
pol_ant = 0
fft_f = np.linspace(0,1000,1000)
t0 = time.time()

polarization=np.array([-np.sin(phi),np.cos(phi),-1/np.sin(theta)])
if(pol_ant == 0):
    ant = ara.VpolAntenna(name="Dummy Vpol", position=(0, 0, 0), power_threshold=0)
    # ant.set_orientation(z_axis=(0, 0, 1), x_axis=(1, 0, 0))#Adding to convert from global coordinates to local antenna coords.
elif(pol_ant == 1):
    ant = ara.HpolAntenna(name="Dummy Hpol", position=(0, 0, 0), power_threshold=0)
    # ant.set_orientation(z_axis=(0, 0, 1), x_axis=(1, 0, 0))
dir_res = ant.antenna.directional_response(theta=theta, phi=phi, polarization=polarization)(fft_f*1E6)
heff = ant.antenna.frequency_response(fft_f*1E6)
response_antenna = dir_res*heff
plt.plot(fft_f,abs(response_antenna), label = "PyREx")
t1 = time.time()

total = t1-t0
print("PyREx: %f"%total)

t0 = time.time()

_, heffSim, _ = util.getResponseAraSim(theta, phi, fft_f, 1)

t1 = time.time()

total = t1-t0
print("AraSim: %f"%total)
plt.plot(fft_f, abs(heffSim)/2, label = "AraSim")
plt.legend()
plt.show()
