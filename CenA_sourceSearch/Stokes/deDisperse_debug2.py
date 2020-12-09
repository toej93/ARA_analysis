# from ROOT import TCanvas, TGraph
# from ROOT import gROOT
# import ROOT
# import os
# import pandas as pd
# import matplotlib.pyplot as plt
# import numpy as np
# from ROOT import gInterpreter, gSystem
# from ROOT import TChain, TSelector, TTree
# import scipy
# import sys
# import deDisperse_util as util
# import pyrex
# import warnings
# import itertools
# warnings.filterwarnings("ignore")
# my_path_plots = os.path.abspath("/users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/thesis_work_daily/plots")
#
#
#
# #add headers from AraSim. Not sure if all of them are needed, and I'm lazy to check that. MAK SURE to change the location of the headers
# gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Position.h"')
# gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Report.h"')
# gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Detector.h"')
# gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Settings.h"')
#
# gSystem.Load('/users/PAS0654/osu8354/AraSim/libAra.so') #load the simulation event library. You might get an error asking for the eventSim dictionry. To solve that, go to where you compiled AraSim, find that file, and copy it to where you set LD_LIBRARY_PATH.
#
# Interpol = pd.read_csv("/users/PAS0654/osu8354/AraSim/outputs/interp.csv")
# InterpolV = pd.read_csv("/users/PAS0654/osu8354/AraSim/outputs/interpV.csv")
#
# theta = np.radians(82.01)
# phi = np.radians(342.54)
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
# # plt.plot(Interpol.T_forint,Interpol.V_forint*0.04776032866311522
# # , label = "Before [$A_{max} = %0.3e$]"%powerH)
# #
# # # plt.plot(Interpol.T_forint,Interpol.V_forint*0.04776032866311522, label = "Before [$A_{max} = %0.3e$]"%util.findMaxSign(np.array(Interpol.V_forint)*0.04776032866311522))
# # # plt.plot(Interpol.T_forint,Interpol.V_forint, label = "After [$A_{max} = %0.3e$]"%util.findMaxSign(np.array(Interpol.V_forint)))
# #
# # plt.xlabel("Time [ns]")
# # plt.ylabel("Amplitude [V]")
# # # plt.ylim(1,1E5)
# # plt.grid(which="both")
# # # plt.xticks(np.arange(0, 1000, step=100))
# # # plt.yscale("log")
# # # plt.xlim(-30,40)
# # plt.legend()
# # plt.title("AraSim, deconvolved event 1 (Hpol)")
# # plt.tight_layout()
# # plt.savefig(my_path_plots+'/Dumpster/beforeAfterDeconvHpol.png', dpi=150)
#
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

# plt.plot(time_afterV,deC_V_after,label="Vpol")
# plt.plot(time_afterH,deC_H_after,label="Hpol")

# plt.plot(InterpolV.T_forint,InterpolV.V_forint*1000,label="Vpol")
# plt.plot(Interpol.T_forint,Interpol.V_forint*1000,label="Hpol")
# plt.grid()
# plt.legend()
# plt.savefig(my_path_plots+'/Dumpster/beforeAfter.png', dpi=150)

# plt.plot(InterpolV.T_forint,InterpolV.V_forint*0.9988589999860037
# , label = "Before [$A_{max} = %0.3e$]"%util.findMaxSign(np.array(InterpolV.V_forint)*0.9988589999860037))
# plt.plot(InterpolV.T_forint,InterpolV.V_forint, label = "After [$A_{max} = %0.3e$]"%util.findMaxSign(np.array(InterpolV.V_forint)))

# plt.xlabel("Time [ns]")
# plt.ylabel("Amplitude [V]")
# # plt.ylim(1,1E5)
# plt.grid(which="both")
# # plt.xticks(np.arange(0, 1000, step=100))
# # plt.yscale("log")
# # plt.xlim(-30,40)
# plt.legend()
# plt.title("AraSim, deconvolved event 1 (Vpol)")
# plt.tight_layout()
# # plt.savefig(my_path_plots+'/Dumpster/beforeAfter.png', dpi=150)
"""
####deDisperse.py#####

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
for filename in os.listdir("/users/PAS0654/osu8354/AraSim/outputs"):#Loop over desired directory
        if filename.startswith("AraOut.default_A2_c1_E610.txt.run"): #extension, .root in this case
            file_list.append(os.path.join("/users/PAS0654/osu8354/AraSim/outputs", str(filename))) #add file name to the list



eventTree = TChain("eventTree") #Define chain and tree that needs to be read. "VTree" in this case.
SimTree = TChain("AraTree2")
energy_=(int(sys.argv[1])-400)/10

for line in file_list:
    eventTree.AddFile(line)
    SimTree.AddFile(line)

reportPtr = ROOT.Report()#report pointer
# eventTree = test.Get("eventTree")#eventTree, from AraSim output files
# SimTree = test.Get("AraTree2") #AraTree2, from AraSim output files
rawEvent = ROOT.UsefulAtriStationEvent()
eventTree.SetBranchAddress("UsefulAtriStationEvent",ROOT.AddressOf(rawEvent))
SimTree.SetBranchAddress("report",ROOT.AddressOf(reportPtr))

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


for i in range(0,totalEvents):#loop over events
    # if(isTrue):
    #     break
    eventTree.GetEntry(i)
    SimTree.GetEntry(i)
    if(reportPtr.stations[0].Global_Pass <= 0):#making sure that the event did trigger, otherwise there won't be a waveform (this might not be needed if all waveforms are saved)
        continue
    t = []
    v = []
    gr = rawEvent.getGraphFromRFChan(0)
    for k in range(0,gr.GetN()):
      t.append(gr.GetX()[k])
      v.append(gr.GetY()[k])
    if(max(v)<5):
        continue

    try:
        numSols = reportPtr.stations[0].strings[0].antennas[0].rec_ang.size()
        # if(numSols>1):
        #     continue
        whichSol = reportPtr.stations[0].strings[0].antennas[0].Likely_Sol #0: direct, #1: reflected/refracted
        if(whichSol!=0):#If it can't pick what solution triggered, AraSim returns -1
            continue
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
            maxV = util.findMaxSign(np.array(deConv_v))
            rmsV_ = max(abs(np.array(v)))
            dTV = deConv_t[1]-deConv_t[0]
            powerV = np.sum(deConv_v**2)*dTV
            if(plotting == True):
                plt.plot(deConv_t,deConv_v,linewidth=0.5, label = "Ch %i"%ch)

        else:
            deConv_t,deConv_v = util.deConvolve_antennaAraSim(t, v,theta_antenna_, phi_ant, 1)
            # deConv_t,deConv_v = util.deConvolve_antennaAraSim(t, v,np.deg2rad(theta_antenna_), np.deg2rad(vertex[2]), 1)
            # maxH = max(abs(deConv_v))
            maxH = util.findMaxSign(np.array(deConv_v))
            rmsH_ = max(abs(np.array(v)))
            dTH = deConv_t[1]-deConv_t[0]
            powerH = np.sum(deConv_v**2)*dTH

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
    PolVecReco = util.PolVectorRecoPower(powerV,powerH,theta_antenna_, phi_ant)
    PolVecReco_array.append(PolVecReco)
    PolVecTrue_array.append(np.array([polVec_x_,polVec_y_,polVec_z_]))
    energyArr.append(energy_)
    # batch.append(sys.argv[2])

    # print(vertex[1])
original_df = pd.DataFrame({"EvNum":np.array(evt_num),"theta_reco": np.array(theta_antenna), "phi_reco": np.array(phi_antenna), "PolTrue":PolVecTrue_array,"PolReco":PolVecReco_array,"rmsV":np.array(rmsV),"rmsH":np.array(rmsH),"maxV":np.array(maxV_array),"maxH":np.array(maxH_array),"powerV":np.array(powerVArr),"powerH":np.array(powerHArr),"energyArr":np.array(energyArr)})
original_df.to_pickle("./debug/pol_quant_noiseless.pkl")
