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
        if filename.startswith("AraOut.default_A2_c1_E%s.txt.run%s"%(sys.argv[1],sys.argv[2])): #extension, .root in this case
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
angle_stokes = []
angle_ratio = []
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
Peak_V = []
Peak_H = []


for i in range(0,totalEvents):#loop over events
    # if(isTrue):
    #     break
    eventTree.GetEntry(i)
    SimTree.GetEntry(i)
    if(reportPtr.stations[0].Global_Pass <= 0):#making sure that the event did trigger, otherwise there won't be a waveform (this might not be needed if all waveforms are saved)
        continue
    # Check if any of the top antennas has no signal. Reject those events
    t = []
    v = []
    gr = rawEvent.getGraphFromRFChan(13)
    for k in range(0,gr.GetN()):
      t.append(gr.GetX()[k])
      v.append(gr.GetY()[k])
    if(np.array(v).std()<55):
        continue

    try:
        # whichSol = reportPtr.stations[0].strings[0].antennas[0].Likely_Sol #0: direct, #1: reflected/refracted
        whichSol = 0
        # if(whichSol!=0):#If it can't pick what solution triggered, AraSim returns -1
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

    gr = [None]*8
    pyrex_array = []
    evt_num.append(i)
    polVec_x.append(polVec_x_)
    polVec_y.append(polVec_y_)
    polVec_z.append(polVec_z_)
    for ch in [0,4,1,5,2,6,3,7]:
        t = []
        v = []
        gr[ch] = rawEvent.getGraphFromRFChan(ch)#print waveform
        for k in range(0,gr[ch].GetN()):
          t.append(gr[ch].GetX()[k])
          v.append(gr[ch].GetY()[k])
        pyrex_array.append(pyrex.Signal(1E-9*np.array(t), 1E-3*np.array(v)))#Convert to seconds and volts
    # isTrue=True
    plotting = False
    if(plotting == True):
        # fig, axs = plt.subplots(1, 2, figsize = (10,10))
        # axs = axs.ravel()

        for ch in [5,13]:
            t = []
            v = []
            graph = rawEvent.getGraphFromRFChan(ch)#print waveform
            for k in range(0,graph.GetN()):
              t.append(graph.GetX()[k])
              v.append(graph.GetY()[k])
            plt.plot(t,v,linewidth=0.5, label = "Ch %i"%ch)
            plt.legend()
        # plt.title("An example of a triggered simulated event with Python")
        plt.xlabel("Time [ns]")
        plt.ylabel("Voltage [mV]")
        plt.title("Digitized")
        plt.tight_layout()
        plt.savefig("wf_debug.png", dpi=200)
    vertex, corrValue = util.doReco(pyrex_array)
    theta_reco.append(180-vertex[1])
    phi_reco.append(vertex[2])

    # gr = [None]*2
    plt.figure()
    for ch in [5,13]:
        t = []
        v = []
        gr = rawEvent.getGraphFromRFChan(ch)
        for k in range(0,gr.GetN()):
          t.append(gr.GetX()[k])
          v.append(gr.GetY()[k])
    # plt.title("An example of a triggered simulated event with Python")
        if(ch==5):
            deConv_t,deConv_v = util.deConvolve_antennaAraSim(t, v,theta_antenna_, phi_ant, 0)

            # deConv_t,deConv_v = util.deConvolve_antennaAraSim(t, v,np.deg2rad(theta_antenna_), np.deg2rad(vertex[2]), 0)
            # maxV = max(abs(deConv_v))
            if(noise == False):
                maxV = util.findMaxSign(np.array(deConv_v))
                rmsV_ = max(abs(np.array(v)))
            else:
                maxV = util.findMaxSign(np.array(v))
                rmsV_ = np.array(v[0:60]).std()
                
            # dTV = deConv_t[1]-deConv_t[0]
            # powerV = np.sum(deConv_v**2)*dTV
            powerV = util.integratePowerWindow(deConv_t,deConv_v)-util.integratePowerNoise(deConv_t,deConv_v)
            PeakV = util.findMaxSign(np.array(deConv_v))
            if(plotting == True):
                plt.plot(deConv_t,deConv_v,linewidth=0.5, label = "Ch %i"%ch)

        else:
            deConv_t,deConv_v = util.deConvolve_antennaAraSim(t, v,theta_antenna_, phi_ant, 1)
            # deConv_t,deConv_v = util.deConvolve_antennaAraSim(t, v,np.deg2rad(theta_antenna_), np.deg2rad(vertex[2]), 1)
            # maxH = max(abs(deConv_v))
            if(noise == False):
                maxH = util.findMaxSign(np.array(deConv_v))
                rmsH_ = max(abs(np.array(v)))
            else:
                maxH = util.findMaxSign(np.array(v))
                rmsH_ = np.array(v[0:60]).std()
            
            # dTH = deConv_t[1]-deConv_t[0]
            # powerH = np.sum(deConv_v**2)*dTH
            powerH = util.integratePowerWindow(deConv_t,deConv_v)-util.integratePowerNoise(deConv_t,deConv_v)
            PeakH = util.findMaxSign(np.array(deConv_v))

            if(plotting == True):
                plt.plot(deConv_t,deConv_v,linewidth=0.5, label = "Ch %i"%ch)

    if(plotting == True):
        plt.legend()
        plt.xlabel("Time [ns]")
        plt.ylabel("Voltage [mV]")
        plt.title('Deconvolved')
        plt.tight_layout()
        plt.savefig("wf_debug_DeConv.png", dpi=200)
    # angle_stokes.append(util.PolAngleStokes(maxV,maxH))
    # angle_ratio.append(util.PolRatio(maxH, maxV))
    # rms_ = max(rms1,rms2)
    rmsV.append(rmsV_)
    rmsH.append(rmsH_)
    maxV_array.append(maxV)
    maxH_array.append(maxH)
    powerVArr.append(powerV)
    powerHArr.append(powerH)
    theta_antenna.append(theta_antenna_)
    phi_antenna.append(phi_ant)
    PolVecReco = util.PolVectorReco(PeakV,PeakH,theta_antenna_, phi_ant)
    PolVecReco_array.append(PolVecReco)
    PolVecTrue_array.append(np.array([polVec_x_,polVec_y_,polVec_z_]))
    energyArr.append(energy_)
    batch.append(sys.argv[2])
    weight = eventPtr.Nu_Interaction[0].weight
    weight_arr.append(weight)
    view_ang.append(reportPtr.stations[0].strings[0].antennas[0].view_ang[0])
    R_recoSign.append(np.sign(PeakH/PeakV))
    Peak_V.append(PeakV)
    Peak_H.append(PeakH)
    
    # print(vertex[1])
original_df = pd.DataFrame({"EvNum":np.array(evt_num),"theta_reco": np.array(theta_antenna), "phi_reco": np.array(phi_antenna), "PolTrue":PolVecTrue_array,"PolReco":PolVecReco_array,"rmsV":np.array(rmsV),"rmsH":np.array(rmsH),"maxV":np.array(maxV_array),"maxH":np.array(maxH_array),"powerV":np.array(powerVArr),"powerH":np.array(powerHArr),"energyArr":np.array(energyArr),"batch":np.array(batch),"weight":np.array(weight_arr),"view_ang":np.array(view_ang),"R_recoSign":np.array(R_recoSign),"peak_V":np.array(Peak_V),"peak_H":np.array(Peak_H)})
original_df.to_pickle("./noiseOn/window_Sol0/pol_quant_noise_1E%0.1f_%s.pkl"%(energy_,sys.argv[2]))
