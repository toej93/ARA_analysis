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
gInterpreter.ProcessLine('#include "/users/PCON0003/cond0068/ARA/AraSim/Position.h"')
gInterpreter.ProcessLine('#include "/users/PCON0003/cond0068/ARA/AraSim/Report.h"')
gInterpreter.ProcessLine('#include "/users/PCON0003/cond0068/ARA/AraSim/Detector.h"')
gInterpreter.ProcessLine('#include "/users/PCON0003/cond0068/ARA/AraSim/Settings.h"')

gSystem.Load('libAra.so') #load the simulation event library. You might get an error asking for the eventSim dictionry. To solve that, go to where you compiled AraSim, find that file, and copy it to where you set LD_LIBRARY_PATH.


# test = ROOT.TFile.Open("/fs/scratch/PAS0654/jorge/sim_results/CenA_atzero/AraOut.CenA_fixed_source_seed4.txt.run0.root")#directory where the simulation files are
# test = ROOT.TFile.Open("/fs/scratch/PAS0654/jorge/sim_results/default/AraOut.default_A2_c1_E610.txt.run9.root")

file_list=[]#Define an empty list
for filename in os.listdir("/users/PAS0654/osu8354/AraSim/outputs"):#Loop over desired directory
		if (filename.startswith("AraOut.root")): #extension, .root in this case
			file_list.append(os.path.join("/users/PAS0654/osu8354/AraSim/outputs", str(filename))) #add file name to the list



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
# theta_antenna = []
phi_reco = []
polVec_x = []
polVec_y = []
polVec_z = []
angle_stokes = []
angle_ratio = []
evt_num = []
rms = []

for i in range(0,totalEvents):#loop over events
	if(isTrue):
		break
	eventTree.GetEntry(i)
	SimTree.GetEntry(i)
	if(reportPtr.stations[0].Global_Pass <= 0):#making sure that the event did trigger, otherwise there won't be a waveform (this might not be needed if all waveforms are saved)
		continue
	try:
		theta_antenna_ = reportPtr.stations[0].strings[0].antennas[0].rec_ang[0]
	except:
		continue
	# print("Rec. angle:%0.2f"%np.rad2deg(theta_antenna_))
	# print("Rec. angle:%0.2f"%np.deg2rad(theta_antenna_))


	# isTrue=True
	# rec_angle = []
	# for ch_ID in range(0,1):
	#     try:
	#         rec_angle.append(reportPtr.stations[0].strings[0].antennas[ch_ID].rec_ang[0])
	#     except:
	#         continue
	# # doing nothing on exception
	# try:
	#     theta_antenna_ = np.rad2deg(np.array(rec_angle).mean())
	#     theta_antenna.append(theta_antenna_)#180-rec_PyREx should be approx. equal to this avg
	# except:
	#     continue
	# polVec = np.zeros(3)
	try:
		polVec_x_ = reportPtr.stations[0].strings[0].antennas[0].Pol_vector[0].GetX()
		polVec_y_ = reportPtr.stations[0].strings[0].antennas[0].Pol_vector[0].GetY()
		polVec_z_ = reportPtr.stations[0].strings[0].antennas[0].Pol_vector[0].GetZ()
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

		for ch in [0,8]:
			t = []
			v = []
			graph = rawEvent.getGraphFromRFChan(ch)#print waveform
			for k in range(0,graph.GetN()):
			  t.append(graph.GetX()[k])
			  v.append(graph.GetY()[k])
			# if(ch>0):
			if(ch==0):
				plt.plot(t,v,linewidth=0.5, label = "Vpol")
			else:
				plt.plot(t,v,linewidth=0.5, label = "Hpol")
		plt.legend()
		# plt.title("An example of a triggered simulated event with Python")
		plt.xlabel("Time [ns]")
		plt.ylabel("Voltage [mV]")
		plt.title("Digitized")
		plt.tight_layout()
		plt.savefig("/users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/thesis_work_daily/plots/Dumpster/wf_debug.png", dpi=100)

		plt.figure()
		for ch in [0,8]:
			t = []
			v = []
			graph = rawEvent.getGraphFromRFChan(ch)#print waveform
			for k in range(0,graph.GetN()):
			  t.append(graph.GetX()[k])
			  v.append(graph.GetY()[k])
			fft, freq, dT = util.doFFT(t,v)
			plt.plot(freq,abs(fft),linewidth=0.5, label = "Ch %i"%ch)
			plt.xlim(0,1000)
			plt.yscale("log")
			plt.legend()
		# plt.title("An example of a triggered simulated event with Python")
		plt.xlabel("Freq [MHz]")
		plt.ylabel("Amplitude")
		plt.title("Spectra (Digitized waveform)")
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
			t.append(reportPtr.stations[0].strings[0].antennas[0].Vm_zoom_T[ray][sample])
			v.append(reportPtr.stations[0].strings[0].antennas[0].Vm_zoom[ray][sample])
		plt.plot(t,v, label=solNum[ray])
		plt.xlabel("Time [ns]")
		plt.ylabel("Amplitude [mV/m]")
		plt.title('Before antenna')
		plt.legend()
		plt.tight_layout()
		plt.savefig("/users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/thesis_work_daily/plots/Dumpster/wf_debug_before.png", dpi=100)

	# gr = [None]*2
	plt.figure()
	for ch in [0,8]:
		t = []
		v = []
		gr = rawEvent.getGraphFromRFChan(ch)
		for k in range(0,gr.GetN()):
		  t.append(gr.GetX()[k])
		  v.append(gr.GetY()[k])
	# plt.title("An example of a triggered simulated event with Python")
		if(ch==0):
			# deConv_t_V,deConv_v_V = util.deConvolve_antenna(t, v,np.deg2rad(180-vertex[1]), np.deg2rad(vertex[2]), 0)
			deConv_t_V,deConv_v_V = util.deConvolve_antenna(t, v,theta_antenna_, np.deg2rad(vertex[2]), 0)
			maxV = max(abs(deConv_v_V))
			rmsV_ = max(abs(np.array(v)))

			if(plotting == True):
				plt.plot(deConv_t_V,deConv_v_V,linewidth=0.5, label = "VPol")

		else:
			# deConv_t_H,deConv_v_H = util.deConvolve_antenna(t, v,np.deg2rad(180-vertex[1]), np.deg2rad(vertex[2]), 1)
			deConv_t_H,deConv_v_H = util.deConvolve_antenna(t, v,theta_antenna_, np.deg2rad(vertex[2]), 1)
			maxH = max(abs(deConv_v_H))
			rmsH_ = max(abs(np.array(v)))

			if(plotting == True):
				plt.plot(deConv_t_H,deConv_v_H,linewidth=0.5, label = "Hpol")
				plt.legend()
				plt.xlabel("Time [ns]")
				plt.ylabel("Amplitude [mV/m]")
				plt.title('Deconvolved')
				plt.tight_layout()
				plt.savefig("/users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/thesis_work_daily/plots/Dumpster/wf_debug_DeConv.png", dpi=100)


	plt.figure()
	fft_V, freq_V, dT_V = util.doFFT(deConv_t_V,deConv_v_V)
	fft_H, freq_H, dT_H = util.doFFT(deConv_t_H,deConv_v_H)
	plt.plot(freq_V,abs(fft_V),linewidth=0.5, label = "Vpol")
	plt.plot(freq_H,abs(fft_H),linewidth=0.5, label = "Hpol")

	plt.legend()
	plt.xlabel("Freq. [MHz]")
	plt.ylabel("Amplitude")
	plt.title('Spectra (Deconvolved)')
	plt.yscale("log")
	plt.xlim(0,1000)
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

		plt.tight_layout()
		plt.savefig("/users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/thesis_work_daily/plots/Dumpster/wf_all.png", dpi=100)
	# if((util.PolRatio(maxH, maxV)-np.degrees(np.arccos(abs(polVec_z_))))<-10 and rmsV_>50 and rmsH_<1400 and rmsH_<1400 and rmsH_>50):
	if(1==1):
		Pol_factor = reportPtr.stations[0].strings[0].antennas[0].Pol_factor[0]
		print("Pol_factor:%0.3f"%Pol_factor)
	# if((util.PolRatio(maxH, maxV)-np.degrees(np.arccos(abs(polVec_z_))))<-10):
		print("ThetaPol_reco:%0.2f"%util.PolAngleStokes(maxH,maxV))
		print("ThetaPol_true:%0.2f"%np.degrees(np.arccos(abs(polVec_z_))))
		print(i)
		print(polVec_x_,polVec_y_,polVec_z_)
		print("Rec. angle:%0.2f"%np.rad2deg(theta_antenna_))
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
		print("posnu:%s"%posnu)
		print("nnu:%s"%nnu)
		print("weight:%f"%weight)
		print("current:%f"%current)
		print("inelast:%f"%inelast)
		print("emfrac:%f"%emfrac)
		print("hadfrac:%f"%hadfrac)
		print("flavor:%f"%flavor)
		print("nu_nubar:%f"%nu_nubar)
		print("energy:%e"%energy)




		break
	angle_stokes.append(util.PolAngleStokes(maxV,maxH))
	angle_ratio.append(util.PolRatio(maxH, maxV))
	# rms.append(rms_)

# original_df = pd.DataFrame({"EvNum":np.array(evt_num),"theta_reco": np.array(theta_reco), "phi_reco": np.array(phi_reco), "thetaPol_reco":np.degrees(np.arccos(abs(np.array(polVec_z)))), "AngStokes":np.array(angle_stokes),"AngRatio":np.array(angle_ratio),"rms":np.array(rms)})
