"""
#####deDisperse.py#####

Get de-dispersed waveform from data events with Python
Author: Jorge Torres
Date: Jul 29, 2020.
"""
from ROOT import TCanvas, TGraph
from ROOT import gROOT
import ROOT
import os
import matplotlib.pyplot as plt
import numpy as np
import pyrex
import pyrex.custom.analysis as analysis
import pyrex.custom.araroot as araroot
import pyrex.custom.envelope_reco as reco
from ROOT import gInterpreter, gSystem
import pandas as pd

gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/ARA_cvmfs/build/include/FFTtools.h"')
gSystem.Load('libAraEvent.so') #load the simulation event library. You might get an error asking for the eventSim dictionry. To solve that, go to where you compiled AraSim, find that file, and copy it to where you set LD_LIBRARY_PATH.
gSystem.Load("/users/PAS0654/osu8354/ARA_cvmfs/build/lib/libRootFftwWrapper.so")

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
# try:
test = ROOT.TFile.Open("/fs/scratch/PAS0654/brian/L1/ARA02/1224/run_012559/event012559.root")#directory where the files are
# if(test.IsOpen()):
#     print('made it')
# else:
#     return -1
calibrator = ROOT.AraEventCalibrator.Instance()
eventTree = test.Get("eventTree")
rawEvent = ROOT.RawAtriStationEvent()
eventTree.SetBranchAddress("event",ROOT.AddressOf(rawEvent))
totalEvents = eventTree.GetEntries()
print('total events:', totalEvents)
isTrue=False

for i in range(42,43):#loop over events
    if(isTrue):
        break
    eventTree.GetEntry(i)
    if(rawEvent.isSoftwareTrigger()): #if not soft trigger
        continue
        
    if(rawEvent.isCalpulserEvent()): #if not a cal pulser
        continue
    usefulEvent = ROOT.UsefulAtriStationEvent(rawEvent,ROOT.AraCalType.kLatestCalib)#get useful event
    gr = [None]*8
    pyrex_array = []

    for ch in [0,4,1,5,2,6,3,7]:
        t = []
        v = []
        gr[ch] = usefulEvent.getGraphFromRFChan(ch)#print waveform
        gr[ch] = ROOT.FFTtools.getInterpolatedGraph(gr[ch],0.5)
        gr[ch] = ROOT.FFTtools.padWaveToLength(gr[ch],2048)

        for i in range(0,gr[ch].GetN()):
          t.append(gr[ch].GetX()[i])
          v.append(gr[ch].GetY()[i])
        pyrex_array.append(pyrex.Signal(1E-9*np.array(t), 1E-3*np.array(v)))
        # print(len(np.array(t)))
    # original_df = pd.DataFrame({"time": np.array(t), "voltage": np.array(v)})
    # original_df.to_pickle("./wform_forDebug_calpulser.pkl")
    isTrue=True
    plotting = True
    if(plotting == True):
        fig, axs = plt.subplots(2, 4, figsize = (10,5))
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
        plt.suptitle("A2, calpulser event, Run 3826")
        # plt.xlabel("Time [ns]")
        # plt.ylabel("Voltage [mV]")
        plt.tight_layout()
        plt.show()

    tof_data, grid_points = load_tof_grid_data("tofs_ara02_vpols_calpulser_spherical.npz")
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

    plot_map = True
    if(plot_map):
        max_idx = np.unravel_index(np.argmax(inter_data), inter_data.shape)
        # print("Hilbert Coherence", name+":", np.max(inter_data))
        with np.load(os.path.join('tofs_ara02_vpols_300m_spherical.npz')) as f:
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
