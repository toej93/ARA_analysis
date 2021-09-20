"""
#####doPolReco.py#####

Reconstruct polarization of simulated events and store them, along with other MC truth, in a pandas dataframe.
Author: Jorge Torres
Date: Sep 19, 2021.
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
import polReco_util as util
import pyrex
import warnings
warnings.filterwarnings("ignore")

if len( sys.argv ) > 1:
    number = 0
    number = int(sys.argv[1])

else:
    print("Run number is required \n run as $python doPolReco.py <run-number>")
    sys.exit()

#add headers from AraSim. Not sure if all of them are needed, and I'm lazy to check that. MAK SURE to change the location of the headers
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Position.h"')
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Report.h"')
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Detector.h"')
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Settings.h"')

gSystem.Load('/users/PAS0654/osu8354/AraSim/libAra.so') #load the simulation event library. You might get an error asking for the eventSim dictionry. To solve that, go to where you compiled AraSim, find that file, and copy it to where you set LD_LIBRARY_PATH.

simFolder = "/fs/project/PAS0654/ARA_SIM_RECO_PAPER/neutral_current/mc/E2_nomag/"
filename = simFolder+"AraOut.setup_neutral_current_E2.txt.run%i.root"%(200000+int(sys.argv[1]))
file_list = []
file_list.append(filename)
noise=True
eventTree = TChain("eventTree") #Define chain and tree that needs to be read. "VTree" in this case.
SimTree = TChain("AraTree2")

for line in file_list:
    eventTree.AddFile(line)
    SimTree.AddFile(line)

reportPtr = ROOT.Report()#report pointer
eventPtr = ROOT.Event()

rawEvent = ROOT.UsefulAtriStationEvent()
eventTree.SetBranchAddress("UsefulAtriStationEvent",ROOT.AddressOf(rawEvent))
SimTree.SetBranchAddress("report",ROOT.AddressOf(reportPtr))
SimTree.SetBranchAddress("event", ROOT.AddressOf(eventPtr))

totalEvents = eventTree.GetEntries()
print('total events:', totalEvents)
# isTrue=False
theta_reco = []
theta_antenna = []
phi_antenna = []

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
weight_arr = []
view_ang = []
Peak_V = []
Peak_H = []

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
        phi_antenna = reportPtr.stations[0].strings[0].antennas[0].phi_rec[whichSol]

    except:
        continue

    try:
        polVec_x_ = reportPtr.stations[0].strings[0].antennas[0].Pol_vector[whichSol].GetX()
        polVec_y_ = reportPtr.stations[0].strings[0].antennas[0].Pol_vector[whichSol].GetY()
        polVec_z_ = reportPtr.stations[0].strings[0].antennas[0].Pol_vector[whichSol].GetZ()
    except:
        continue
        
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

            if(noise == False):
                maxV = util.findMaxSign(np.array(deConv_v))
                rmsV_ = max(abs(np.array(v)))
            else:
                maxV = util.findMaxSign(np.array(v))
                rmsV_ = np.array(v[0:60]).std()

            powerV = util.integratePowerWindow(deConv_t,deConv_v)-util.integratePowerNoise(deConv_t,deConv_v)
            PeakV = util.findMaxSign(np.array(deConv_v))

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
    dirProp.append(np.array([np.sin(theta_antenna_)*np.cos(phi_ant),np.sin(theta_antenna_)*np.sin(phi_ant),np.cos(theta_antenna_)]))

    print(theta_antenna_)
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
    batch.append(int(sys.argv[2]))
    weight = eventPtr.Nu_Interaction[0].weight
    weight_arr.append(weight)
    view_ang.append(reportPtr.stations[0].strings[0].antennas[0].view_ang[whichSol])
    R_recoSign.append(np.sign(PeakH/PeakV))
    Peak_V.append(PeakV)
    Peak_H.append(PeakH)
    launch_ang.append(reportPtr.stations[0].strings[0].antennas[0].launch_ang[whichSol])

    nnu.append(np.array([eventPtr.Nu_Interaction[0].nnu.GetX(),eventPtr.Nu_Interaction[0].nnu.GetY(),eventPtr.Nu_Interaction[0].nnu.GetZ()]))

    # print(vertex[1])
original_df = pd.DataFrame({"EvNum":np.array(evt_num),"PolTrue":PolVecTrue_array,"PolReco":PolVecReco_array,"rmsV":np.array(rmsV),"rmsH":np.array(rmsH),"maxV":np.array(maxV_array),"maxH":np.array(maxH_array),"powerV":np.array(powerVArr),"powerH":np.array(powerHArr),"energyArr":np.array(energyArr),"batch":np.array(batch),"weight":np.array(weight_arr),"view_ang":np.array(view_ang),"R_recoSign":np.array(R_recoSign),"peak_V":np.array(Peak_V),"peak_H":np.array(Peak_H),"dirProp":dirProp,"nnu":nnu,"launch_ang":launch_ang})
original_df.to_pickle("./noiseOn/window_Sol0/pol_quant_noise_1E%0.1f_%s.pkl"%(energy_,sys.argv[2]))
