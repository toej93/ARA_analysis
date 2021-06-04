"""
#####createHDF5ForSeckel.py#####

Create dataset witj AraSim outputs for Seckel
Author: Jorge Torres
Date: Feb 11, 2021.
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
import h5py 

warnings.filterwarnings("ignore")

#add headers from AraSim. Not sure if all of them are needed, and I'm lazy to check that. MAK SURE to change the location of the headers
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Position.h"')
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Report.h"')
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Detector.h"')
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Settings.h"')

gSystem.Load('/users/PAS0654/osu8354/AraSim/libAra.so') #load the simulation event library. You might get an error asking for the eventSim dictionry. To solve that, go to where you compiled AraSim, find that file, and copy it to where you set LD_LIBRARY_PATH.

file_list=[]#Define an empty list
# for filename in os.listdir("/fs/scratch/PAS0654/jorge/sim_results/noiseOn"):#Loop over desired directory
#         if filename.startswith("AraOut.default_A2_c1_E%s.txt.run%s"%(sys.argv[1],sys.argv[2])): #extension, .root in this case
#             file_list.append(os.path.join("/fs/scratch/PAS0654/jorge/sim_results/noiseOn", str(filename))) #add file name to the list
# 
file_list.append("/users/PAS0654/osu8354/AraSim/outputs/AraOut.default_A2_c1_E610_readIn.txt.runAraSim_input_Seckel.txt.root")
noise=False
eventTree = TChain("eventTree") #Define chain and tree that needs to be read. "VTree" in this case.
SimTree = TChain("AraTree2")

for line in file_list:
    eventTree.AddFile(line)
    SimTree.AddFile(line)

reportPtr = ROOT.Report()#report pointer
eventPtr = ROOT.Event()

# eventTree = test.Get("eventTree")#eventTree, from AraSim output files
# SimTree = test.Get("AraTree2") #AraTree2, from AraSim output files
rawEvent = ROOT.UsefulAtriStationEvent()
eventTree.SetBranchAddress("UsefulAtriStationEvent",ROOT.AddressOf(rawEvent))
SimTree.SetBranchAddress("report",ROOT.AddressOf(reportPtr))
SimTree.SetBranchAddress("event", ROOT.AddressOf(eventPtr))

totalEvents = eventTree.GetEntries()
print('total events:', totalEvents)
isTrue=False
theta_reco = []
theta_antenna = []
phi_antenna = []
phi_reco = []
polVec_x = []
polVec_y = []
polVec_z = []
evt_num = []
rmsV = []
rmsH = []
maxV_array = []
maxH_array = []
PolVecReco_array = []
PolVecTrue_array = []
powerVArr = []
powerHArr = []
energyArr = []
batch = []
weight_arr = []
view_ang = []
R_recoSign = []
powerE_arr = []
powerV_arr = []
dirProp = []
nnu = []
launch_ang = []
posnu = []
current = []
inelasticity = []
emfrac = []
hadfrac = []
flavor = []
nu_nubar = []
energy = []
powerEField_arr = []
powerNoise_arr = []

for i in range(0,totalEvents):#loop over events
    print(i)
    eventTree.GetEntry(i)
    SimTree.GetEntry(i)
    if(reportPtr.stations[0].Global_Pass <= 0):#making sure that the event did trigger, otherwise there won't be a waveform (this might not be needed if all waveforms are saved)
        continue

    whichSol = 0

    launchAngAnt = np.empty(16)
    phiRecAnt = np.empty(16)
    thetaRecAnt = np.empty(16)
    viewAngAnt = np.empty(16)
    pol_x = np.empty(16)
    pol_y = np.empty(16)
    pol_z = np.empty(16)
    powerEField = np.empty(16)
    try:
        
        for string in range(0,4):
            for chan in range(0,4):
                RFchan = util.getRFChannel(string, chan)
                
                pol_x[RFchan] = reportPtr.stations[0].strings[string].antennas[chan].Pol_vector[whichSol].GetX()
                pol_y[RFchan] = reportPtr.stations[0].strings[string].antennas[chan].Pol_vector[whichSol].GetY()
                pol_z[RFchan] = reportPtr.stations[0].strings[string].antennas[chan].Pol_vector[whichSol].GetZ()
                            
                launchAngAnt[RFchan] = reportPtr.stations[0].strings[string].antennas[chan].launch_ang[whichSol]
                
                thetaRecAnt[RFchan] = reportPtr.stations[0].strings[string].antennas[chan].theta_rec[whichSol]
                phiRecAnt[RFchan] = reportPtr.stations[0].strings[string].antennas[chan].phi_rec[whichSol]
                
                viewAngAnt[RFchan] = reportPtr.stations[0].strings[string].antennas[chan].view_ang[whichSol]
                
                wfLength = int(reportPtr.stations[0].strings[string].antennas[chan].Vm_zoom[whichSol].size())
                
                Efield_v = []
                Efield_t = []

                for sample in range(wfLength):
                    Efield_t.append(reportPtr.stations[0].strings[string].antennas[chan].Vm_zoom_T[whichSol][sample])
                    Efield_v.append(reportPtr.stations[0].strings[string].antennas[chan].Vm_zoom[whichSol][sample])
                
                Efield_t = np.array(Efield_t)
                Efield_v = np.array(Efield_v)
                dT = Efield_t[1]-Efield_t[0]
                power = np.sum(Efield_v**2)*dT
                powerEField[RFchan] = power
    except:
        continue
    plotting = False

    powerE = []
    powerV = []
    powerNoise = []
    for ch in range(0,16):
        t = []
        v = []
        gr = rawEvent.getGraphFromRFChan(ch)
        for k in range(0,gr.GetN()):
          t.append(gr.GetX()[k])
          v.append(gr.GetY()[k])
    # plt.title("An example of a triggered simulated event with Python")
        if(ch<8):
            deConv_t,deConv_v = util.deConvolve_antennaAraSim(t, v, thetaRecAnt[ch], phiRecAnt[ch], 0)
            
            powerV.append(util.integratePowerWindow(t,v))
            powerE.append(util.integratePowerWindow(deConv_t,deConv_v))
            if(noise == True):
                powerNoise.append(util.integratePowerNoise(deConv_t,deConv_v))
            else:
                powerNoise.append(0.)            
            
        else:
            deConv_t,deConv_v = util.deConvolve_antennaAraSim(t, v, thetaRecAnt[ch], phiRecAnt[ch], 1)

            powerV.append(util.integratePowerWindow(t,v))
            powerE.append(util.integratePowerWindow(deConv_t,deConv_v))
            if(noise == True):
                powerNoise.append(util.integratePowerNoise(deConv_t,deConv_v))
            else:
                powerNoise.append(0.)
    evt_num.append(i)
    polVec_x.append(pol_x)
    polVec_y.append(pol_y)
    polVec_z.append(pol_z)

    theta_antenna.append(thetaRecAnt)
    phi_antenna.append(phiRecAnt)

    energyArr.append(eventPtr.pnu)
    weight = eventPtr.Nu_Interaction[0].weight
    weight_arr.append(weight)
    view_ang.append(viewAngAnt)
    powerV_arr.append(powerV)
    powerE_arr.append(powerE)
    powerNoise_arr.append(powerNoise)

    # polVec_x.append(pol_x)
    # polVec_y.append(pol_y)
    # polVec_z.append(pol_z)
    powerEField_arr.append(powerEField)

    launch_ang.append(launchAngAnt)
    nnu.append(np.array([eventPtr.Nu_Interaction[0].nnu.GetX(),eventPtr.Nu_Interaction[0].nnu.GetY(),eventPtr.Nu_Interaction[0].nnu.GetZ()]))   
    posnu.append(np.array([eventPtr.Nu_Interaction[0].posnu.GetX(),eventPtr.Nu_Interaction[0].posnu.GetY(),eventPtr.Nu_Interaction[0].posnu.GetZ()]))
    current.append(eventPtr.Nu_Interaction[0].currentint)
    inelasticity.append(eventPtr.Nu_Interaction[0].elast_y)
    emfrac.append(eventPtr.Nu_Interaction[0].emfrac)
    hadfrac.append(eventPtr.Nu_Interaction[0].hadfrac)
    flavor.append(eventPtr.nuflavorint)
    nu_nubar.append(eventPtr.nu_nubar)
    energy.append(eventPtr.pnu)
    
with h5py.File('./hdf_files/AraSim_outputs_forSeckel_1E18_noiseless_v2.hdf5', 'w') as f:
    #Event properties
    f.create_dataset('evNum', data=np.array(evt_num))
    f.create_dataset('current', data=np.array(current))
    f.create_dataset('inelasticity', data=np.array(inelasticity))
    f.create_dataset('emfrac', data=np.array(emfrac))
    f.create_dataset('flavor', data=np.array(flavor))
    f.create_dataset('hadfrac', data=np.array(hadfrac))
    f.create_dataset('nnu', data=np.array(nnu))
    f.create_dataset('nu_nubar', data=np.array(nu_nubar))
    f.create_dataset('posnu', data=np.array(posnu))
    f.create_dataset('weight', data=np.array(weight_arr))
    f.create_dataset('energy', data=np.array(energy))

    #Signal properties per antenna
    f.create_dataset('launch_ang', data=np.array(launch_ang))
    f.create_dataset('theta_antenna', data=np.array(theta_antenna))
    f.create_dataset('phi_antenna', data=np.array(phi_antenna))
    f.create_dataset('view_ang', data=np.array(view_ang))
    f.create_dataset('pol_x', data=np.array(polVec_x))
    f.create_dataset('pol_y', data=np.array(polVec_y))
    f.create_dataset('pol_z', data=np.array(polVec_z))
    f.create_dataset('powerV_deconv', data=np.array(powerE_arr))
    f.create_dataset('powerV', data=np.array(powerV_arr))
    f.create_dataset('powerE', data=np.array(powerEField_arr))
    f.create_dataset('powerNoise_arr', data=np.array(powerNoise_arr))


    f.close()
