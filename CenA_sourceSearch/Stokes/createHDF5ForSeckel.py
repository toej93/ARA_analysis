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
import h5py 

warnings.filterwarnings("ignore")

#add headers from AraSim. Not sure if all of them are needed, and I'm lazy to check that. MAK SURE to change the location of the headers
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Position.h"')
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Report.h"')
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Detector.h"')
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Settings.h"')

gSystem.Load('/users/PAS0654/osu8354/AraSim/libAra.so') #load the simulation event library. You might get an error asking for the eventSim dictionry. To solve that, go to where you compiled AraSim, find that file, and copy it to where you set LD_LIBRARY_PATH.


# test = ROOT.TFile.Open("/fs/scratch/PAS0654/jorge/sim_results/CenA_atzero/AraOut.CenA_fixed_source_seed4.txt.run0.root")#directory where the simulation files are
# test = ROOT.TFile.Open("/fs/scratch/PAS0654/jorge/sim_results/default/AraOut.default_A2_c1_E610.txt.run9.root")

file_list=[]#Define an empty list
for filename in os.listdir("/fs/scratch/PAS0654/jorge/sim_results/noiseOn"):#Loop over desired directory
        if filename.startswith("AraOut.default_A2_c1_E%s.txt.run%s.root"%(sys.argv[1],sys.argv[2])): #extension, .root in this case
            file_list.append(os.path.join("/fs/scratch/PAS0654/jorge/sim_results/noiseOn", str(filename))) #add file name to the list


noise=True
eventTree = TChain("eventTree") #Define chain and tree that needs to be read. "VTree" in this case.
SimTree = TChain("AraTree2")
energy_=(int(sys.argv[1])-400)/10

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
PeakE_arr = []
PeakV_arr = []
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


for i in range(0,totalEvents):#loop over events

    eventTree.GetEntry(i)
    SimTree.GetEntry(i)
    if(reportPtr.stations[0].Global_Pass <= 0):#making sure that the event did trigger, otherwise there won't be a waveform (this might not be needed if all waveforms are saved)
        continue

    try:
        # whichSol = reportPtr.stations[0].strings[0].antennas[0].Likely_Sol #0: direct, #1: reflected/refracted
        whichSol = 0
        # if(whichSol!=0):#If it can't pick what solution triggered, AraSim returns -1
            # continue
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

    gr = [None]*8
    
    plotting = False

    peakE = []
    peakV = []
    for ch in range(0,16):
        t = []
        v = []
        gr = rawEvent.getGraphFromRFChan(ch)
        for k in range(0,gr.GetN()):
          t.append(gr.GetX()[k])
          v.append(gr.GetY()[k])
    # plt.title("An example of a triggered simulated event with Python")
        if(ch<8):
            deConv_t,deConv_v = util.deConvolve_antennaAraSim(t, v,theta_antenna_, phi_ant, 0)

            # deConv_t,deConv_v = util.deConvolve_antennaAraSim(t, v,np.deg2rad(theta_antenna_), np.deg2rad(vertex[2]), 0)
            # maxV = max(abs(deConv_v))
            # if(noise == False):
            #     maxV = util.findMaxSign(np.array(deConv_v))
            #     rmsV_ = max(abs(np.array(v)))
            # else:
            #     maxV = util.findMaxSign(np.array(v))
            #     rmsV_ = np.array(v[0:60]).std()
            peakV.append(util.findMaxSign(np.array(v)))
            peakE.append(util.findMaxSign(np.array(deConv_v)))
            # dTV = deConv_t[1]-deConv_t[0]
            # powerV = np.sum(deConv_v**2)*dTV
            # powerV = util.integratePowerWindow(deConv_t,deConv_v)-util.integratePowerNoise(deConv_t,deConv_v)
            
        else:
            deConv_t,deConv_v = util.deConvolve_antennaAraSim(t, v,theta_antenna_, phi_ant, 1)

            # if(noise == False):
            #     maxH = util.findMaxSign(np.array(deConv_v))
            #     rmsH_ = max(abs(np.array(v)))
            # else:
            #     maxH = util.findMaxSign(np.array(v))
            #     rmsH_ = np.array(v[0:60]).std()
            peakV.append(util.findMaxSign(np.array(v)))
            peakE.append(util.findMaxSign(np.array(deConv_v)))
            # dTH = deConv_t[1]-deConv_t[0]
            # powerH = np.sum(deConv_v**2)*dTH
            # powerH = util.integratePowerWindow(deConv_t,deConv_v)-util.integratePowerNoise(deConv_t,deConv_v)
            # PeakH = util.findMaxSign(np.array(deConv_v))

    # dirProp.append(np.array([np.sin(theta_antenna_)*np.cos(phi_ant),np.sin(theta_antenna_)*np.sin(phi_ant),np.cos(theta_antenna_)]))
    
    evt_num.append(i)
    polVec_x.append(polVec_x_)
    polVec_y.append(polVec_y_)
    polVec_z.append(polVec_z_)
    # rmsV.append(rmsV_)
    # rmsH.append(rmsH_)
    # maxV_array.append(maxV)
    # maxH_array.append(maxH)
    # powerVArr.append(powerV)
    # powerHArr.append(powerH)
    theta_antenna.append(theta_antenna_)
    phi_antenna.append(phi_ant)
    # PolVecReco = util.PolVectorReco(PeakV,PeakH,theta_antenna_, phi_ant)
    # PolVecReco_array.append(PolVecReco)
    PolVecTrue_array.append(np.array([polVec_x_,polVec_y_,polVec_z_]))
    energyArr.append(energy_)
    weight = eventPtr.Nu_Interaction[0].weight
    weight_arr.append(weight)
    view_ang.append(reportPtr.stations[0].strings[0].antennas[0].view_ang[whichSol])
    # R_recoSign.append(np.sign(PeakH/PeakV))
    PeakV_arr.append(peakV)
    PeakE_arr.append(peakE)

    # Peak_H_arr.append(PeakH)
    launch_ang.append(reportPtr.stations[0].strings[0].antennas[0].launch_ang[whichSol])
    nnu.append(np.array([eventPtr.Nu_Interaction[0].nnu.GetX(),eventPtr.Nu_Interaction[0].nnu.GetY(),eventPtr.Nu_Interaction[0].nnu.GetZ()]))   
    # posnu.append(np.array([eventPtr.Nu_Interaction[0].posnu.GetX(),eventPtr.Nu_Interaction[0].posnu.GetY(),eventPtr.Nu_Interaction[0].posnu.GetZ()]))
    current.append(eventPtr.Nu_Interaction[0].currentint)
    inelasticity.append(eventPtr.Nu_Interaction[0].elast_y)
    emfrac.append(eventPtr.Nu_Interaction[0].emfrac)
    hadfrac.append(eventPtr.Nu_Interaction[0].hadfrac)
    flavor.append(eventPtr.nuflavorint)
    nu_nubar.append(eventPtr.nu_nubar)
    energy.append(eventPtr.pnu)
    
with h5py.File('AraSim_outputs_forSeckel.hdf5', 'w') as f:
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
    
    #Signal properties per antenna
    f.create_dataset('launch_ang', data=np.array(launch_ang))
    f.create_dataset('theta_antenna', data=np.array(theta_antenna))
    f.create_dataset('phi_antenna', data=np.array(phi_antenna))
    f.create_dataset('view_ang', data=np.array(view_ang))


    f.close()
    # print(vertex[1])
# original_df = pd.DataFrame({"EvNum":np.array(evt_num),"theta_reco": np.array(theta_antenna), "phi_reco": np.array(phi_antenna), "PolTrue":PolVecTrue_array,"PolReco":PolVecReco_array,"rmsV":np.array(rmsV),"rmsH":np.array(rmsH),"maxV":np.array(maxV_array),"maxH":np.array(maxH_array),"powerV":np.array(powerVArr),"powerH":np.array(powerHArr),"energyArr":np.array(energyArr),"batch":np.array(batch),"weight":np.array(weight_arr),"view_ang":np.array(view_ang),"R_recoSign":np.array(R_recoSign),"peak_V":np.array(Peak_V),"peak_H":np.array(Peak_H),"dirProp":dirProp,"nnu":nnu,"launch_ang":launch_ang})
# original_df.to_pickle("./noiseOn/window_Sol0/pol_quant_noise_1E%0.1f_%s.pkl"%(energy_,sys.argv[2]))
