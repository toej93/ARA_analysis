"""
#####getSunPosition.py#####

Get positions of Sun from Brian's code
Author: Jorge Torres
Date: Mar 19, 2021.
"""
from ROOT import TCanvas, TGraph
from ROOT import gROOT
import ROOT
import os
import pandas as pd
import numpy as np
from ROOT import gInterpreter, gSystem
from ROOT import TChain, TSelector, TTree
import scipy
import sys

#add headers from AraSim. Not sure if all of them are needed, and I'm lazy to check that. MAK SURE to change the location of the headers
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Position.h"')
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Report.h"')
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Detector.h"')
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Settings.h"')

gSystem.Load('/users/PAS0654/osu8354/AraSim/libAra.so') #load the simulation event library. You might get an error asking for the eventSim dictionry. To solve that, go to where you compiled AraSim, find that file, and copy it to where you set LD_LIBRARY_PATH.

def TransformPredictedAzimuth(inputAzimuth, station_long, ReRange):
	new_azimuth = 0
	new_domain_azimuth = 0
	#//Thing 1:                                                                                  
	if((inputAzimuth + station_long)<0.):
		inputAzimuth+=360
		inputAzimuth+=station_long
		
	elif((inputAzimuth + station_long)>360.):
		inputAzimuth-=360.
		inputAzimuth-=station_long
		
	else:
		inputAzimuth +=station_long
		
		#Thing2:
		
	new_azimuth = 450. - inputAzimuth
		
	if(new_azimuth > 360.):
		new_azimuth -=360
			
	# #Thing3:
	new_domain_azimuth = new_azimuth;

	if(ReRange):
		if(new_azimuth > 180.):
			new_domain_azimuth = -360. + new_azimuth
		elif (new_azimuth < -180.):
			new_domain_azimuth = 360. +new_azimuth                                                                            
			
	return new_domain_azimuth

def getSunLocUnixtimeTB(unixTime):
	geomTool = ROOT.AraGeomTool.Instance()
	stationVector = geomTool.getStationVector(0)

	station_long = geomTool.getLongitudeFromArrayCoords(stationVector[1], stationVector[0], 2011)

	station_lat = geomTool.getGeographicLatitudeFromArrayCoords(stationVector[1], stationVector[0], 2011)

	this_event_phi = geomTool.getSunAzimuthLongLat(station_long,station_lat,unixTime)

	this_event_phi_corrected = TransformPredictedAzimuth(this_event_phi,station_long, 1)
	return this_event_phi_corrected
	
timeArray = np.array([1297733400, 1297733430, 1297733460, 1297733490, 1297733520,
       1297733550, 1297733580, 1297733610, 1297733640, 1297733670,
       1297733700, 1297733730, 1297733760, 1297733790, 1297733820,
       1297733850, 1297733880, 1297733910, 1297733940, 1297733970,
       1297734000, 1297734030, 1297734060, 1297734090, 1297734120,
       1297734150, 1297734180, 1297734210, 1297734240, 1297734270,
       1297734300, 1297734330, 1297734360, 1297734390, 1297734420,
       1297734450, 1297734480, 1297734510, 1297734540, 1297734570,
       1297734600, 1297734630, 1297734660, 1297734690, 1297734720,
       1297734750, 1297734780, 1297734810, 1297734840, 1297734870,
       1297734900, 1297734930, 1297734960, 1297734990, 1297735020,
       1297735050, 1297735080, 1297735110, 1297735140, 1297735170,
       1297735200, 1297735230, 1297735260, 1297735290, 1297735320,
       1297735350, 1297735380, 1297735410, 1297735440, 1297735470,
       1297735500, 1297735530, 1297735560, 1297735590, 1297735620,
       1297735650, 1297735680, 1297735710, 1297735740, 1297735770,
       1297735800, 1297735830, 1297735860, 1297735890, 1297735920,
       1297735950, 1297735980, 1297736010, 1297736040, 1297736070,
       1297736100, 1297736130, 1297736160, 1297736190, 1297736220,
       1297736250, 1297736280, 1297736310, 1297736340, 1297736370,
       1297736400, 1297736430, 1297736460, 1297736490, 1297736520,
       1297736550, 1297736580, 1297736610, 1297736640, 1297736670,
       1297736700, 1297736730, 1297736760, 1297736790, 1297736820,
       1297736850, 1297736880, 1297736910, 1297736940, 1297736970,
       1297737000, 1297737030, 1297737060, 1297737090, 1297737120,
       1297737150, 1297737180, 1297737210, 1297737240, 1297737270,
       1297737300, 1297737330, 1297737360, 1297737390, 1297737420,
       1297737450, 1297737480, 1297737510, 1297737540, 1297737570,
       1297737600, 1297737630, 1297737660, 1297737690, 1297737720,
       1297737750, 1297737780, 1297737810, 1297737840, 1297737870,
       1297737900, 1297737930, 1297737960, 1297737990, 1297738020,
       1297738050, 1297738080, 1297738110, 1297738140, 1297738170,
       1297738200, 1297738230, 1297738260, 1297738290, 1297738320,
       1297738350, 1297738380, 1297738410, 1297738440, 1297738470,
       1297738500, 1297738530, 1297738560, 1297738590, 1297738620,
       1297738650, 1297738680, 1297738710, 1297738740, 1297738770])
	  

posSun = []
for time in timeArray:
	# print(getSunLocUnixtimeTB(int(time))-74.22)
	posSun.append(getSunLocUnixtimeTB(int(time))-74.22)
	
colNames = ["azimuth"]

original_df2 = pd.DataFrame(posSun, columns = colNames)
original_df2.to_csv("./posSun.csv")
