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
import itertools
import sys

#add headers from AraSim. Not sure if all of them are needed, and I'm lazy to check that. MAK SURE to change the location of the headers
gInterpreter.ProcessLine('#include "/users/PCON0003/cond0068/ARA/AraSim/Position.h"')
gInterpreter.ProcessLine('#include "/users/PCON0003/cond0068/ARA/AraSim/Report.h"')
gInterpreter.ProcessLine('#include "/users/PCON0003/cond0068/ARA/AraSim/Detector.h"')
gInterpreter.ProcessLine('#include "/users/PCON0003/cond0068/ARA/AraSim/Settings.h"')

gSystem.Load('libAra.so') #load the simulation event library. You might get an error asking for the eventSim dictionry. To solve that, go to where you compiled AraSim, find that file, and copy it to where you set LD_LIBRARY_PATH.


# test = ROOT.TFile.Open("/fs/scratch/PAS0654/jorge/sim_results/CenA_atzero/AraOut.CenA_fixed_source_seed4.txt.run0.root")#directory where the simulation files are
# test = ROOT.TFile.Open("/fs/scratch/PAS0654/jorge/sim_results/default/AraOut.default_A2_c1_E610.txt.run9.root")

def getRFChannel(string, channel):
    if(channel%2==0):
        RFChannel = string + 2*channel
    else:
        if(channel==1):
            RFChannel = 8 + string*channel
        if(channel==3):
            RFChannel = 12 + string
    return int(RFChannel)



file_list=[]#Define an empty list
for filename in os.listdir("/fs/scratch/PAS0654/jorge/sim_results/default"):#Loop over desired directory
    if filename.startswith("AraOut.default_A2_c1_E%s.txt.run%s"%(sys.argv[1],sys.argv[2])): #extension, .root in this case
        file_list.append(os.path.join("/fs/scratch/PAS0654/jorge/sim_results/default", str(filename))) #add file name to the list



eventTree = TChain("eventTree") #Define chain and tree that needs to be read. "VTree" in this case.
SimTree = TChain("AraTree2")
AraTree = TChain("AraTree")


for line in file_list:
    eventTree.AddFile(line)
    SimTree.AddFile(line)
    AraTree.AddFile(line)

reportPtr = ROOT.Report()#report pointer
detectorPtr = ROOT.Detector()#report pointer

rawEvent = ROOT.UsefulAtriStationEvent()
eventTree.SetBranchAddress("UsefulAtriStationEvent",ROOT.AddressOf(rawEvent))
SimTree.SetBranchAddress("report",ROOT.AddressOf(reportPtr))
AraTree.SetBranchAddress("detector",ROOT.AddressOf(detectorPtr))
# AraTree.GetEvent(1)
energy_=(int(sys.argv[1])-400)/10
snr=[]
chForArray=[]
energy=[]
totalEvents = eventTree.GetEntries()
print('total events:', totalEvents)
for i in range(0,totalEvents):#loop over events
    # if(isTrue):
    #     break
    eventTree.GetEntry(i)
    SimTree.GetEntry(i)

    if(reportPtr.stations[0].Global_Pass <= 0):#making sure that the event did trigger, otherwise there won't be a waveform (this might not be needed if all waveforms are saved)
        continue
    trigV = 0
    trigH = 0
    channelsH = []
    channelsV = []
    for string, ch in itertools.product(range(4), range(4)):
        if(reportPtr.stations[0].strings[string].antennas[ch].Trig_Pass>0):
            # print("string:%i, ch:%i"%(string,ch))
            # print(reportPtr.stations[0].strings[string].antennas[ch].Trig_Pass)
            if(ch%2 == 0):
                trigV+=1
                channelsV.append(getRFChannel(string,ch))
            elif(ch%2 != 0):
                trigH+=1
                channelsH.append(getRFChannel(string,ch))
            # print(getRFChannel(string, ch))
    if (trigV>2):
        TrigChan = np.array(channelsV)
    if (trigH>2):
        TrigChan = np.array(channelsH)
    # print(TrigChan)
    # print(i)
    snr_=[]
    chForArray.append(TrigChan[0])
    gr = [None]*16
    for ch in TrigChan:
        t = []
        v = []
        gr[ch] = rawEvent.getGraphFromRFChan(int(ch))#print waveform
        for kk in range(0,gr[ch].GetN()):
          t.append(gr[ch].GetX()[kk])
          v.append(gr[ch].GetY()[kk])
        snr_.append(max(abs(np.array(v)))/np.array(v[:50]).std())
    snr.append(np.array(snr_).mean())
    energy.append(energy_)
    # print(np.array(snr_).mean())
    # gr = [None]*16
    # fig, axs = plt.subplots(4, 4, figsize = (12,10))
    # axs = axs.ravel()
    # for ch in range(0,16):
    #     t = []
    #     v = []
    #     gr[ch] = rawEvent.getGraphFromRFChan(ch)#print waveform
    #     for kk in range(0,gr[ch].GetN()):
    #       t.append(gr[ch].GetX()[kk])
    #       v.append(gr[ch].GetY()[kk])
    #     axs[ch].plot(t,v,linewidth=0.5, label = "Ch %i"%ch)
    #     axs[ch].legend()
    # # plt.title("An example of a triggered simulated event with Python")
    # # plt.xlabel("Time [ns]")
    # # plt.ylabel("Voltage [mV]")
    # plt.tight_layout()
    # plt.show()

    # break
original_df = pd.DataFrame({"Energy":np.array(energy_),"SNR":np.array(snr),"Channel":np.array(chForArray)})
original_df.to_pickle("./TrigFiles/AraSim_triggersSNR_1E%i_%s.pkl"%(energy_,sys.argv[2]))
