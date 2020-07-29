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
import pyrex
import pyrex.custom.analysis as analysis
import pyrex.custom.araroot as araroot
from ROOT import gInterpreter, gSystem
import pyrex.custom.envelope_reco as reco

#add headers from AraSim. Not sure if all of them are needed, and I'm lazy to check that. MAK SURE to change the location of the headers
gInterpreter.ProcessLine('#include "/users/PCON0003/cond0068/ARA/AraSim/Position.h"')
gInterpreter.ProcessLine('#include "/users/PCON0003/cond0068/ARA/AraSim/Report.h"')
gInterpreter.ProcessLine('#include "/users/PCON0003/cond0068/ARA/AraSim/Detector.h"')
gInterpreter.ProcessLine('#include "/users/PCON0003/cond0068/ARA/AraSim/Settings.h"')

gSystem.Load('libAra.so') #load the simulation event library. You might get an error asking for the eventSim dictionry. To solve that, go to where you compiled AraSim, find that file, and copy it to where you set LD_LIBRARY_PATH.

def load_tof_grid_data(filename, antenna_positions=None):
    with np.load(filename) as f:
        if antenna_positions is not None:
            for i, pos in enumerate(antenna_positions):
                if not np.all(np.isclose(pos, f['antennas'][i])):
                    raise ValueError("File does not match antenna positions")
        rs = f['rs']
        thetas = f['thetas']
        phis = f['phis']
        tofs_dir = f['tofs_dir']
        tofs_ref = f['tofs_ref']
    return (tofs_dir, tofs_ref), (rs, thetas, phis)

def calculate_interferometric_grid(waveforms, tofs, hilbert=False):
    from itertools import combinations
    bins = len(waveforms[0].values)
    dt = waveforms[0].dt
    t0s = np.asarray([wave.times[0] for wave in waveforms])
    xtof = tofs[:, :, :, :, np.newaxis] - tofs[:, :, :, np.newaxis, :]
    xtdiff = t0s[:, np.newaxis] - t0s[np.newaxis, :]
    shifts = (xtof-xtdiff)/dt
    int_shifts = np.asarray(shifts, dtype=np.int_) + bins - 1
    nan_shifts = (np.isnan(shifts) | np.asarray(int_shifts<0)
                  | np.asarray(int_shifts>=2*bins-1))
    int_shifts[nan_shifts] = 0
    xcorrs = reco.calculate_cross_correlations(waveforms, hilbert=hilbert)
    inter_data = np.zeros(tofs.shape[:3])
    combos = list(combinations(range(len(waveforms)), 2))
    for idx1, idx2 in combos:
        val = xcorrs[idx1, idx2, int_shifts[:, :, :, idx1, idx2]]
        val[nan_shifts[:, :, :, idx1, idx2]] = 0
        inter_data += val
    inter_data /= len(combos)


    return inter_data



test = ROOT.TFile.Open("/fs/scratch/PAS0654/jorge/sim_results/CenA_atzero/AraOut.CenA_fixed_source_seed4.txt.run0.root")#directory where the simulation files are
# test = ROOT.TFile.Open("/fs/scratch/PAS0654/jorge/sim_results/default/AraOut.default_A2_c1_E610.txt.run9.root")
reportPtr = ROOT.Report()#report pointer
eventTree = test.Get("eventTree")#eventTree, from AraSim output files
SimTree = test.Get("AraTree2") #AraTree2, from AraSim output files
rawEvent = ROOT.UsefulAtriStationEvent()
eventTree.SetBranchAddress("UsefulAtriStationEvent",ROOT.AddressOf(rawEvent))
SimTree.SetBranchAddress("report",ROOT.AddressOf(reportPtr))

totalEvents = eventTree.GetEntries()
print('total events:', totalEvents)
isTrue=False

for i in range(0,totalEvents):#loop over events
    if(isTrue):
        break
    eventTree.GetEntry(i)
    SimTree.GetEntry(i)
    if(reportPtr.stations[0].Global_Pass <= 0):#making sure that the event did trigger, otherwise there won't be a waveform (this might not be needed if all waveforms are saved)
        continue
    rec_angle = []
    for ch_ID in range(0,4):
        rec_angle.append(reportPtr.stations[0].strings[0].antennas[ch_ID].rec_ang[0])
    print(np.rad2deg(np.array(rec_angle).mean()))#180-rec_PyREx should be approx. equal to this avg
    gr = [None]*8
    pyrex_array = []

    for ch in [0,4,1,5,2,6,3,7]:
        t = []
        v = []
        gr[ch] = rawEvent.getGraphFromRFChan(ch)#print waveform
        for i in range(0,gr[ch].GetN()):
          t.append(gr[ch].GetX()[i])
          v.append(gr[ch].GetY()[i])
        pyrex_array.append(pyrex.Signal(1E-9*np.array(t), 1E-3*np.array(v)))#Convert to seconds and volts
    isTrue=True
    plotting = False
    if(plotting == True):
        fig, axs = plt.subplots(2, 4, figsize = (10,10))
        axs = axs.ravel()
        for ch in [0,4,1,5,2,6,3,7]:
            t = []
            v = []
            # gr[ch] = rawEvent.getGraphFromRFChan(ch)#print waveform
            for i in range(0,gr[ch].GetN()):
              t.append(gr[ch].GetX()[i])
              v.append(gr[ch].GetY()[i])
            axs[ch].plot(t,v,linewidth=0.5, label = "Ch %i"%ch)
            axs[ch].legend()
        # plt.title("An example of a triggered simulated event with Python")
        # plt.xlabel("Time [ns]")
        # plt.ylabel("Voltage [mV]")
        plt.tight_layout()
        plt.show()

tof_data, grid_points = load_tof_grid_data("tofs_ara02_vpols_300m_spherical.npz")
antenna_waveforms = pyrex_array
mask = None
if mask is not None:
    if len(mask)!=len(antennas):
        raise ValueError("Mask must have same length as antenna list")
    antenna_waveforms = [pos for pos, use in zip(antenna_waveforms, mask)
                         if use]
else:
    mask = slice(None)
# Get the best interferometric fit among the time of flight data sets
inter_max = 0
best_data = None
for tofs in tof_data:
    inter_data = reco.calculate_interferometric_grid(antenna_waveforms,
                                                tofs[:, :, :, mask],
                                                hilbert=True)
    max_val = np.max(inter_data)
    if best_data is None or max_val>inter_max:
        best_data = np.array(inter_data, copy=True)
        inter_max = max_val
# Get the vertex of the highest interferometric value
i, j, k = np.unravel_index(np.argmax(best_data), best_data.shape)
inter_vtx = np.array((grid_points[0][i],
                      grid_points[1][j],
                      grid_points[2][k]))
# print(inter_data[1][0])
print(inter_vtx, inter_max)
plot_map = False
if(plot_map):
    max_idx = np.unravel_index(np.argmax(inter_data), inter_data.shape)
    # print("Hilbert Coherence", name+":", np.max(inter_data))
    with np.load(os.path.join('tofs_ara02_vpols_calpulser_spherical.npz')) as f:
        antenna_positions = None
        if antenna_positions is not None:
            for i, pos in enumerate(antenna_positions):
                if not np.all(np.isclose(pos, f['antennas'][i])):
                    raise ValueError("File does not match antenna positions")
        rs = f['rs']
        thetas = f['thetas']
        phis = f['phis']
        tofs_dir = f['tofs_dir']
        tofs_ref = f['tofs_ref']
    tof_data = (tofs_dir, tofs_ref)
    grid_points = (rs, thetas, phis)
    mesh_thetas = np.concatenate((thetas, [thetas[-1]+(thetas[1]-thetas[0])]))
    mesh_phis = np.concatenate((phis, [phis[-1]+(phis[1]-phis[0])]))

    for name, tofs in zip(('Direct', 'Reflected'), tof_data):
        inter_data = reco.calculate_interferometric_grid(antenna_waveforms, tofs, hilbert=True)
        max_idx = np.unravel_index(np.argmax(inter_data), inter_data.shape)
        print("Hilbert Coherence", name+":", np.max(inter_data))
        plt.pcolormesh(mesh_phis, mesh_thetas, inter_data[0, :, :], vmin=0, vmax=1)
        plt.colorbar()
        plt.scatter(phis[max_idx[2]], thetas[max_idx[1]], color='k', marker=',', s=1)
        plt.title("Fullband Hilbert Reconstruction "+name)
        plt.show()
