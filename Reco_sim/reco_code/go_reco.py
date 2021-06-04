import os
import numpy as np
import matplotlib.pyplot as plt
import array

import ROOT
from ROOT import TChain, gSystem

# import waveform as waveform

gSystem.Load('/users/PAS0654/osu8354/AraSim_debug/AraSim/libAra.so')

file_list = []
file_list.append("/fs/scratch/PAS0654/jorge/sim_results/noiseOn/AraOut.default_A2_c1_E600.txt.run0.root")

simSettingsTree = TChain("AraTree")
simTree = TChain("AraTree2")

for line in file_list:
	simTree.AddFile(line)
	simSettingsTree.AddFile(line)

# things we need out of the ROOT file
reportPtr = ROOT.Report()
detectorPtr = ROOT.Detector()
eventPtr = ROOT.Event()
iceModelPtr = ROOT.IceModel()
settingsPtr = ROOT.Settings()
simTree.SetBranchAddress("report", ROOT.AddressOf(reportPtr))
simTree.SetBranchAddress("event", ROOT.AddressOf(eventPtr))
simSettingsTree.SetBranchAddress("icemodel", ROOT.AddressOf(iceModelPtr))
simSettingsTree.SetBranchAddress("detector", ROOT.AddressOf(detectorPtr))
simSettingsTree.SetBranchAddress("settings", ROOT.AddressOf(settingsPtr))
simSettingsTree.GetEvent(0)

# other things we need included
ROOT.gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim_debug/AraSim/RaySolver.h"')
raysolver = ROOT.RaySolver()

ROOT.gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim_debug/AraSim/signal.hh"')
signalPtr = ROOT.Signal(settingsPtr)
signalPtr.SetMedium(0)

ROOT.gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim_debug/AraSim/Tools.h"')
tools = ROOT.Tools()

# ROOT.gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim_debug/AraSim/Report.h"')

numEvents = simTree.GetEntries()
isTrue=False
for i in range(0, numEvents):
	if(isTrue):
		break
	simTree.GetEntry(i)
	if(reportPtr.stations[0].Global_Pass<=0):
		continue
	print("Found an event")
	isTrue=True # stop the iteration

	trace_voltages_org = np.empty((16,1280))
	trace_times_org = np.empty((16,1280))

	for iS in range(4):
		for iA in range(4):
			idx = (iS*4)+iA
			num_sols = len(reportPtr.stations[0].strings[iS].antennas[iA].Vm_zoom)
			for iRay in range(num_sols):
				viewang = reportPtr.stations[0].strings[iS].antennas[iA].view_ang[iRay]
				dist = reportPtr.stations[0].strings[iS].antennas[iA].Dist[iRay]
				Pol_factor = reportPtr.stations[0].strings[iS].antennas[iA].Pol_factorV[iRay]
				Pol_vector = reportPtr.stations[0].strings[iS].antennas[iA].Pol_vector[iRay]
				# print("Pol vector {}, {}, {}".format(Pol_vector.GetX(), Pol_vector.GetY(), Pol_vector.GetZ()))

				phi = reportPtr.stations[0].strings[iS].antennas[iA].phi_rec[iRay]
				theta = reportPtr.stations[0].strings[iS].antennas[iA].theta_rec[iRay]

				# print("Pol factor {}, {}, {} is {}".format(iS, iA, iRay, Pol_factor))

				num_samps = reportPtr.stations[0].strings[iS].antennas[iA].time_mimic.size()
				for iSample in range(num_samps):
					t = reportPtr.stations[0].strings[iS].antennas[iA].time_mimic[iSample]
					v = reportPtr.stations[0].strings[iS].antennas[iA].V_mimic[iSample]
					trace_times_org[idx][iSample] = t
					trace_voltages_org[idx][iSample] = v

	num_time_bins = int(settingsPtr.NFOUR/2.)
	num_solutions = ROOT.std.vector('int')(16)
	trace_times = ROOT.std.vector(ROOT.std.vector(ROOT.std.vector('double')))(16,(num_time_bins,num_time_bins))
	trace_voltages = ROOT.std.vector(ROOT.std.vector(ROOT.std.vector('double')))(16,(num_time_bins,num_time_bins))

	reportPtr.rerun_event(eventPtr, detectorPtr, 
		raysolver, signalPtr, iceModelPtr,settingsPtr,
		num_solutions, trace_times, trace_voltages);

	trace_times = np.asarray(trace_times)
	trace_voltages = np.asarray(trace_voltages)

	fig, axs = plt.subplots(4,4,figsize=(12,10))
	for iS in range(4):
		for iA in range(4):
			idx = (iS*4)+iA
			# cut_t, cut_v = waveform.upsample_and_cut(trace_times_org[idx], trace_voltages_org[idx],
			# 				0.25, 256)
			# cut_t -= cut_t[0]
			# axs[iA][iS].plot(cut_t, cut_v)
			num_sol = num_solutions[idx]
			for iRay in range(num_sol):
				trace_times[idx][iRay] -= trace_times[idx][iRay][0]
				axs[iA][iS].plot(trace_times[idx][iRay], 1000.*trace_voltages[idx][iRay], label='ray {}'.format(iRay))
				axs[iA][iS].set_title("string {}, antenna {}".format(iS, iA))
				axs[iA][iS].legend()
				# axs[iA][iS].set_ylim([-0.20, 0.20])
				axs[iA][iS].set_xlabel("Time (ns)")
				axs[iA][iS].set_ylabel("Amplitude (V)")
	plt.tight_layout()
	fig.savefig('traces_vs_redo{}.png'.format(i))
	plt.close(fig)
	del fig, axs
