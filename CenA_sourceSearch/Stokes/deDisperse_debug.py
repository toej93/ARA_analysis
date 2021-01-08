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
import itertools
warnings.filterwarnings("ignore")
ntrig=0
nbad=0
#add headers from AraSim. Not sure if all of them are needed, and I'm lazy to check that. MAK SURE to change the location of the headers
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Position.h"')
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Report.h"')
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Detector.h"')
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Settings.h"')

gSystem.Load('/users/PAS0654/osu8354/AraSim/libAra.so') #load the simulation event library. You might get an error asking for the eventSim dictionry. To solve that, go to where you compiled AraSim, find that file, and copy it to where you set LD_LIBRARY_PATH.


# test = ROOT.TFile.Open("/fs/scratch/PAS0654/jorge/sim_results/CenA_atzero/AraOut.CenA_fixed_source_seed4.txt.run0.root")#directory where the simulation files are
# test = ROOT.TFile.Open("/fs/scratch/PAS0654/jorge/sim_results/default/AraOut.default_A2_c1_E610.txt.run9.root")

file_list=[]#Define an empty list
# for filename in os.listdir("/users/PAS0654/osu8354/AraSim/outputs"):#Loop over desired directory
#         if (filename.startswith("AraOut.default_A2_c1_E610_readIn_noise.txt.runAraSim_input_event35936")): #extension, .root in this case
#             file_list.append(os.path.join("/users/PAS0654/osu8354/AraSim/outputs", str(filename))) #add file name to the list
file_list.append("/users/PAS0654/osu8354/AraSim/outputs/AraOut.default_A2_c1_E610_readIn_noise.txt.runAraSim_input_event982.txt.root")
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
isTrue=True
theta_reco = []
# theta_antenna = []
phi_reco = []
polVec_x = []
polVec_y = []
polVec_z = []
angle_stokes = []
angle_ratio = []
evt_num = []
rms = []
rmsH = []
PolVecReco_array = []
PolVecTrue_array = []

for i in range(0,totalEvents):#loop over events
    # if(isTrue):
    #     break
    eventTree.GetEntry(i)
    SimTree.GetEntry(i)

    if(reportPtr.stations[0].Global_Pass <= 0):#making sure that the event did trigger, otherwise there won't be a waveform (this might not be needed if all waveforms are saved)
        continue
    # t = []
    # v = []
    # gr = rawEvent.getGraphFromRFChan(0)
    # for k in range(0,gr.GetN()):
    #   t.append(gr.GetX()[k])
    #   v.append(gr.GetY()[k])
    # if(max(v)<5):
    #     print("Empty ch0")
    #     continue
    try:
        # whichSol = reportPtr.stations[0].strings[0].antennas[0].Likely_Sol #0: direct, #1: reflected/refracted
        whichSol = 0
        # if(whichSol<0):#If it can't pick what solution triggered, AraSim returns -1
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
    plotting = True
    if(plotting == True):
        plt.figure()

        # fig, axs = plt.subplots(1, 2, figsize = (10,10))
        # axs = axs.ravel()

        for ch in [5,13]:
            t = []
            v = []
            graph = rawEvent.getGraphFromRFChan(ch)#print waveform
            for k in range(0,graph.GetN()):
              t.append(graph.GetX()[k])
              v.append(graph.GetY()[k])
            # if(ch>0):
            if(ch==5):
                plt.plot(t,v,linewidth=0.5, label = "Vpol")
            else:
                plt.plot(t,v,linewidth=0.5, label = "Hpol")
        plt.legend()
        # plt.title("An example of a triggered simulated event with Python")
        plt.xlabel("Time [ns]")
        plt.ylabel("Voltage [mV]")
        plt.title("Digitized")
        plt.grid(which="both")
        plt.tight_layout()
        plt.savefig("/users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/thesis_work_daily/plots/Dumpster/wf_debug.png", dpi=100)

        plt.figure()
        for ch in [5,13]:
            t = []
            v = []
            graph = rawEvent.getGraphFromRFChan(ch)#print waveform
            for k in range(0,graph.GetN()):
              t.append(graph.GetX()[k])
              v.append(graph.GetY()[k])
            fft, freq, dT = util.doFFT(t,v)
            plt.plot(freq,abs(fft),linewidth=0.5, label = "Ch %i"%ch)
            plt.xlim(0,1000)
            plt.ylim(10,1E5)
            plt.yscale("log")
            plt.legend()
        # plt.title("An example of a triggered simulated event with Python")
        plt.xlabel("Freq [MHz]")
        plt.ylabel("Amplitude")
        plt.title("Spectra (Digitized waveform)")
        plt.grid(which="both")
        plt.tight_layout()
        plt.savefig("/users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/thesis_work_daily/plots/Dumpster/spectra_debug.png", dpi=100)

    vertex, corrValue = util.doReco(pyrex_array)
    theta_reco.append(180-vertex[1])
    phi_reco.append(vertex[2])


    plt.figure()
    antNum = 0 #antenna number, AraSim numbering
    # ray = 0 #0: reflected, 1:refracted
    solNum = ["direct","reflected"]

    wfLength = int(reportPtr.stations[0].strings[0].antennas[antNum].Vm_zoom[0].size())
    for ray in range(0,2):
        t = []
        v = []
        for sample in range(wfLength):
            try:
                t.append(reportPtr.stations[0].strings[0].antennas[0].Vm_zoom_T[ray][sample])
                v.append(reportPtr.stations[0].strings[0].antennas[0].Vm_zoom[ray][sample])
            except:
                continue
        plt.plot(t,v, label=solNum[ray])
        # print(np.array(v))

        plt.xlabel("Time [ns]")
        plt.ylabel("Amplitude [mV/m]")
        plt.title('Before antenna')
        plt.legend()
        plt.grid(which="both")
        plt.tight_layout()
        plt.savefig("/users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/thesis_work_daily/plots/Dumpster/wf_debug_before.png", dpi=100)

    plt.figure()
    antNum = 0 #antenna number, AraSim numbering
    # ray = 0 #0: reflected, 1:refracted
    solNum = ["direct","reflected"]

    wfLength = int(reportPtr.stations[0].strings[0].antennas[antNum].Vm_zoom[0].size())
    for ray in range(0,1):
        t = []
        v = []
        for sample in range(wfLength):
            try:
                t.append(reportPtr.stations[0].strings[0].antennas[0].Vm_zoom_T[ray][sample])
                v.append(reportPtr.stations[0].strings[0].antennas[0].Vm_zoom[ray][sample])
            except:
                continue

        t2 = []
        v2 = []
        for sample in range(wfLength):
            try:
                t2.append(reportPtr.stations[0].strings[0].antennas[1].Vm_zoom_T[ray][sample])
                v2.append(reportPtr.stations[0].strings[0].antennas[1].Vm_zoom[ray][sample])
            except:
                continue
        # Pol_factorH = reportPtr.stations[0].strings[0].antennas[0].Pol_factorH[0]
        # Pol_factorV = reportPtr.stations[0].strings[0].antennas[0].Pol_factorV[0]
        # fft_V, freq_V, dT_V = util.doFFT(t,np.array(v))
        # fft_H, freq_H, dT_H = util.doFFT(t2,np.array(v2))
        # plt.plot(freq_V,abs(fft_V),linewidth=0.5, label = "Vpol (Ch 0)")
        # plt.plot(freq_H,abs(fft_H),linewidth=0.5, label = "Hpol (Ch 8)")
        # plt.legend()
        # plt.xlabel("Freq. [MHz]")
        # plt.ylabel("Amplitude")
        # plt.title('Spectra (E-fields, Ch. 0 and Ch. 8), %s'%solNum[ray])
        # plt.yscale("log")
        # plt.ylim(1E-4,1)
        # plt.xlim(0,1000)
        # plt.grid(which="both")
        # plt.tight_layout()
        # plt.savefig("/users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/thesis_work_daily/plots/Dumpster/spectra_debug_before.png", dpi=150)
        # original_df = pd.DataFrame({"timeH":np.array(t2),"EFieldH":np.array(v2),"timeV":np.array(t),"EFieldV":np.array(v)})
        # original_df.to_pickle("./EFields_AraSim.pkl")

    plt.figure()
    gr = [None]*16
    fig, axs = plt.subplots(4, 4, figsize = (12,10))
    axs = axs.ravel()
    for string, ch in itertools.product(range(4), range(4)):
        for ray in range(0,2):
            t = []
            v = []

            try:

                Pol_factor = reportPtr.stations[0].strings[string].antennas[ch].Pol_factor[ray]
                Pol_factorH = reportPtr.stations[0].strings[string].antennas[ch].Pol_factorH[ray]
                Pol_factorV = reportPtr.stations[0].strings[string].antennas[ch].Pol_factorV[ray]
                # print("Pol_factorV:%0.2f"%Pol_factorV)
                # print("Pol_factorH:%0.2f"%Pol_factorH)

            except:
                continue
            for sample in range(wfLength):
                t.append(reportPtr.stations[0].strings[string].antennas[ch].Vm_zoom_T[ray][sample])
                v.append(reportPtr.stations[0].strings[string].antennas[ch].Vm_zoom[ray][sample])
            chan = util.getRFChannel(string,ch)
            axs[chan].plot(t,np.array(v)*Pol_factorV,linewidth=1, label="Vpol,%s [pol_factor = %0.3e]"%(solNum[ray],Pol_factorV))
            axs[chan].plot(t,np.array(v)*Pol_factorH,"--",linewidth=1, label="Hpol,%s [pol_factor = %0.2f]"%(solNum[ray],Pol_factorH))
            axs[chan].legend(title="Ch %i"%chan, fontsize=6)
            # if(chan ==5):
            #     print("----Ch0----")
            #     print(util.findMaxSign(np.array(v)*Pol_factorV))
            # if(chan ==8):
            #     print("----Ch8----")
            #     print(util.findMaxSign(np.array(v)*Pol_factorH))
            # print(np.array(v))
            # axs[chan].set_ylim(-0.004,0.004)
    plt.tight_layout()
    plt.grid(which="both")
    plt.savefig("/users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/thesis_work_daily/plots/Dumpster/wf_all_beforeAntenna.png", dpi=100)

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
            # deConv_t_V,deConv_v_V = util.deConvolve_antenna(t, v,np.deg2rad(180-vertex[1]), np.deg2rad(vertex[2]), 0)\
            traceV = np.array(v)
            print(len(traceV))
            try:
                deConv_t_V,deConv_v_V = util.deConvolve_antennaAraSim(t, v,theta_antenna_, phi_ant, 0)
            except:
                continue
            maxV = util.findMaxSign(deConv_v_V)
            rmsV_ = max(abs(np.array(v)))
            dTV = deConv_t_V[1]-deConv_t_V[0]
            powerV = powerH = util.integratePowerWindow(deConv_t_V,deConv_v_V)-util.integratePowerNoise(deConv_t_V,deConv_v_V)
            print("powerV: %0.5f"%powerV)
            print("rmsV_: %0.5f"%rmsV_)

            if(plotting == True):
                plt.plot(deConv_t_V,deConv_v_V,linewidth=0.5, label = "Vpol [$A_{max} = %0.3f$]"%maxV)

        else:
            # deConv_t_H,deConv_v_H = util.deConvolve_antenna(t, v,np.deg2rad(180-vertex[1]), np.deg2rad(vertex[2]), 1)
            traceH = np.array(v)
            print(len(traceH))

            try:
                deConv_t_H,deConv_v_H = util.deConvolve_antennaAraSim(t, v,theta_antenna_, phi_ant, 1)
            except:
                continue
            dTH = deConv_t_H[1]-deConv_t_H[0]
            powerH = np.sum(deConv_v_H**2)*dTH
            powerH = util.integratePowerWindow(deConv_t_H,deConv_v_H)-util.integratePowerNoise(deConv_t_H,deConv_v_H)

            maxH = util.findMaxSign(deConv_v_H)
            rmsH_ = max(abs(np.array(v)))
            print("powerH: %0.5f"%powerH)
            print("rmsH_: %0.5f"%rmsH_)



            if(plotting == True):
                plt.plot(deConv_t_H,deConv_v_H,linewidth=0.5, label = "Hpol [$A_{max} = %0.3f$]"%maxH)
                plt.legend()
                plt.xlabel("Time [ns]")
                plt.ylabel("Amplitude [mV/m]")
                plt.title('Deconvolved')
                plt.grid(which="both")
                plt.tight_layout()
                plt.savefig("/users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/thesis_work_daily/plots/Dumpster/wf_debug_DeConv.png", dpi=150)

    original_df = pd.DataFrame({"time":np.array(t),"traceH":traceH,"traceV":traceV})
    original_df.to_pickle("./Traces.pkl")

    plt.figure()
    fft_V, freq_V, dT_V = util.doFFT(deConv_t_V,deConv_v_V)
    fft_H, freq_H, dT_H = util.doFFT(deConv_t_H,deConv_v_H)
    plt.plot(freq_V,abs(fft_V),linewidth=0.5, label = "Vpol (Ch 5)")
    plt.plot(freq_H,abs(fft_H),linewidth=0.5, label = "Hpol (Ch 13)")

    plt.legend()
    plt.xlabel("Freq. [MHz]")
    plt.ylabel("Amplitude")
    plt.title('Spectra (Deconvolved)')
    plt.yscale("log")
    plt.xlim(0,1000)
    plt.ylim(10,1E5)
    plt.grid(which="both")
    plt.tight_layout()
    plt.savefig("/users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/thesis_work_daily/plots/Dumpster/wf_debug_DeConv_spectrum.png", dpi=100)

    if(plotting == True):
        gr = [None]*16
        fig, axs = plt.subplots(4, 4, figsize = (12,10))
        axs = axs.ravel()
        for ch in range(0,16):
            t = []
            v = []
            gr[ch] = rawEvent.getGraphFromRFChan(ch)#print waveform
            for kk in range(0,gr[ch].GetN()):
              t.append(gr[ch].GetX()[kk])
              v.append(gr[ch].GetY()[kk])
            axs[ch].plot(t,v,linewidth=0.5, label = "Ch %i"%ch)
            axs[ch].legend()
            plt.grid(which="both")
            axs[ch].set_ylim(-500,500)
        plt.tight_layout()
        plt.savefig("/users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/thesis_work_daily/plots/Dumpster/wf_all.png", dpi=100)

    # angle_stokes.append(util.PolAngleStokes(maxV,maxH))
    # angle_ratio.append(util.PolRatio(maxH, maxV))
    rms.append(rmsV_)
    rmsH.append(rmsH_)

    # break
    # nbad+=1
    # print(theta_antenna_)
    # v_V = []
    # v_H = []
    # for sample in range(wfLength):
    #     v_V.append(reportPtr.stations[0].strings[0].antennas[0].Vm_zoom[0][sample])
    #     v_H.append(reportPtr.stations[0].strings[0].antennas[1].Vm_zoom[0][sample])
    #
    # maxV = util.findMaxSign(np.array(v_V)*reportPtr.stations[0].strings[0].antennas[0].Pol_factor[0])
    # maxH = util.findMaxSign(np.array(v_H)*reportPtr.stations[0].strings[0].antennas[1].Pol_factor[0])

    theta = theta_antenna_
    phi = phi_ant
    pol_ev = np.array([polVec_x_,polVec_y_,polVec_z_])
    thetaHat = np.array([np.cos(theta)*np.cos(phi), np.cos(theta)*np.sin(phi), -np.sin(theta)])
    phiHat = np.array([-np.sin(phi), np.cos(phi),0])
    dirProp = np.array([np.sin(theta)*np.cos(phi),np.sin(theta)*np.sin(phi),np.cos(theta)])
    R_true = np.dot(pol_ev,phiHat)/(np.dot(pol_ev,thetaHat))
    # dirProp = np.array([np.sin(theta)*np.cos(phi),np.sin(theta)*np.sin(phi),np.cos(theta)])

    # Reco = util.PolVectorReco(np.dot(thetaHat,pol_ev),np.dot(phiHat,pol_ev),theta,phi)
    # PolVecReco = util.PolVectorReco(maxV,maxH,theta_antenna_,phi_ant)
    PolVecReco = util.PolVectorRecoPower_debug(powerV,powerH,theta_antenna_,phi_ant,np.sign(R_true))
    # PolVecReco = util.PolVectorRecoPower(powerV,powerH,theta_antenna_,phi_ant)
    R_reco = np.sqrt(powerH/powerV)


    # print("Reco: %s"%PolVecReco)
    # print("True: %s"%pol_ev)

    thetaPol_true = np.degrees(np.arccos(abs(polVec_z_)))
    thetaPol_reco = np.degrees(np.arccos(abs(PolVecReco[2])))
    phiPol_true = np.degrees(np.arctan2(abs(polVec_y_),abs(polVec_x_)))
    phiPol_reco = np.degrees(np.arctan2(abs(PolVecReco[1]),abs(PolVecReco[0])))
    # # print(thetaPol_true-thetaPol_reco)
    if(1==1):
        plt.figure()
        # antNum = 0 #antenna number, AraSim numbering
        # ray = 0 #0: reflected, 1:refracted
        antName = ["Vpol","Hpol"]

        wfLength = int(reportPtr.stations[0].strings[0].antennas[0].V_mimic.size())
        for antNum in range(0,2):
            t = []
            v = []
            for sample in range(wfLength):
                try:
                    t.append(reportPtr.stations[0].strings[0].antennas[antNum].time_mimic[sample])
                    v.append(reportPtr.stations[0].strings[0].antennas[antNum].V_mimic[sample])
                except:
                    continue
            plt.plot(t,v, label=antName[antNum])
        # print(np.array(v))
        plt.xlabel("Time [ns]")
        plt.ylabel("Amplitude [mV/m]")
        plt.title('V_mimic')
        plt.legend()
        plt.grid(which="both")
        plt.tight_layout()
        plt.savefig("/users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/thesis_work_daily/plots/Dumpster/wf_vmimic.png", dpi=100)
    # # if(abs((util.PolRatio(maxH, maxV)-np.degrees(np.arccos(abs(polVec_z_)))))>15 and rmsV_>50 and rmsV_<1400 and rmsH_<1400 and rmsH_>50):
    # if(rmsV_>50 and rmsV_<1400 and rmsH_<1400 and rmsH_>50 and abs(thetaPol_reco-thetaPol_true)>8):
        # print(thetaPol_reco-thetaPol_true)
        # print(i)
    #     # print(polVec_x_,polVec_y_,polVec_z_)
    #     # print("Rec. angle:%0.2f"%np.rad2deg(theta_antenna_))
        posnu = []
        nnu = []
        weight = -1
        current = -1
        inelasticity = -1
        emfrac = -1
        hadfrac = -1
        flavor = -1
        nu_nubar = -1
        energy = -1
        
        posnu.append(eventPtr.Nu_Interaction[0].posnu.GetX())
        posnu.append(eventPtr.Nu_Interaction[0].posnu.GetY())
        posnu.append(eventPtr.Nu_Interaction[0].posnu.GetZ())
        nnu.append(eventPtr.Nu_Interaction[0].nnu.GetX())
        nnu.append(eventPtr.Nu_Interaction[0].nnu.GetY())
        nnu.append(eventPtr.Nu_Interaction[0].nnu.GetZ())
        weight = eventPtr.Nu_Interaction[0].weight
        current = eventPtr.Nu_Interaction[0].currentint
        inelast = eventPtr.Nu_Interaction[0].elast_y
        emfrac = eventPtr.Nu_Interaction[0].emfrac
        hadfrac = eventPtr.Nu_Interaction[0].hadfrac
        flavor = eventPtr.nuflavorint
        nu_nubar = eventPtr.nu_nubar
        energy = eventPtr.pnu
        # print("posnu:%s"%posnu)
        print("nnu:%s"%nnu)
        # print("weight:%f"%weight)
        # print("current:%f"%current)
        # print("inelast:%f"%inelast)
        # print("emfrac:%f"%emfrac)
        # print("hadfrac:%f"%hadfrac)
        # print("flavor:%f"%flavor)
        # print("nu_nubar:%f"%nu_nubar)
        # print("energy:%e"%energy)

    # PolVecReco_array.append(PolVecReco)
    # PolVecTrue_array.append(pol_ev)
    #
        print("pol True: (%0.6f,%0.6f,%0.6f)"%(polVec_x_,polVec_y_,polVec_z_))
        print(dirProp)
        # print("pol reco: (%0.3f,%0.3f,%0.3f)"%(PolVecReco[0],PolVecReco[1],PolVecReco[2]))
        # print("omega_true:%0.3f, omega_reco:%0.3f"%(thetaPol_true,thetaPol_reco))
        # print("psi_true:%0.3f, psi_reco:%0.3f"%(phiPol_true,phiPol_reco))
        # print("Theta_antenna:%0.2f"%np.degrees(theta_antenna_))
        # print("phi_antenna:%0.2f"%np.degrees(phi_ant))
        # print("Dot product")
        # print(np.dot(dirProp,pol_ev))
        # print("R_true: %0.4f"%R_true)
        # print("R_reco: %0.4f"%R_reco)
        # Pol_factorH = reportPtr.stations[0].strings[0].antennas[0].Pol_factorH[whichSol]
        # Pol_factorV = reportPtr.stations[0].strings[0].antennas[0].Pol_factorV[whichSol]
        # print("Pol_factorH: %0.4f"%Pol_factorH)
        # print("Pol_factorV: %0.4f"%Pol_factorV)
    #     print("Likely solution: %i"%reportPtr.stations[0].strings[0].antennas[0].Likely_Sol)
    #     print("-------Next event-------")
    #     ff, heffsH, filter_gains = util.getResponseAraSim(theta_antenna_,phi_ant,freq_V,1)
    #     ff, heffsV, filter_gains = util.getResponseAraSim(theta_antenna_,phi_ant,freq_V,0)
    #     print(maxV,maxH)
        # print("whichSol")
        # print(reportPtr.stations[0].strings[0].antennas[0].V[0].size())
        # print(whichSol)
        print(reportPtr.stations[0].strings[0].antennas[0].view_ang[whichSol])

        break
        # print(np.linalg.norm(PolVecReco))

# print("ratios\n")
# print(np.sum(deConv_v_H**2))
# print(np.sum(deConv_v_V**2))

# original_df = pd.DataFrame({"PolVecReco_array":PolVecReco_array,"PolVecTrue_array":PolVecTrue_array, "rmsV":rms, "rmsH":rmsH})

# original_df = pd.DataFrame({"Freqs":ff,"heffsH":heffsH,"heffsV":heffsV, "filter_gains":filter_gains})
# original_df.to_pickle("./polReco_debug_deConv.pkl")
