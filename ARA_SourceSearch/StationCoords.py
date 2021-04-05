"""
#####getSunPosition.py#####

Get positions of CenA
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
import astropy
import astropy.units as u #astropy's units module
from astropy.time import Time
from astropy.coordinates import SkyCoord, EarthLocation, AltAz
from matplotlib.ticker import FormatStrFormatter
from matplotlib.ticker import StrMethodFormatter
import datetime

gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Position.h"')
gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Report.h"')
00gInterpreter.ProcessLine('#include "/users/PAS0654/osu8354/AraSim/Settings.h"')

gSystem.Load('/users/PAS0654/osu8354/AraSim/libAra.so') #load the simulation event library. You might get an error asking for the eventSim dictionry. To solve that, go to where you compiled AraSim, find that file, and copy it to where you set LD_LIBRARY_PATH.

CenA = SkyCoord.from_name('Cen A')
south_pole = EarthLocation(lat=-90.0*u.deg, lon=-74.22*u.deg, height=-100*u.m)
utcoffset = -0*u.hour  # No UTC offset, as the South Pole uses UTC
geomTool = ROOT.AraGeomTool.Instance()

def GetStationLatLong(station):    
    stationVector = geomTool.getStationVector(station)

    station_long = geomTool.getLongitudeFromArrayCoords(stationVector[1], stationVector[0], 2015)
    station_lat = geomTool.getGeographicLatitudeFromArrayCoords(stationVector[1], stationVector[0], 2015)
    return station_lat, station_long
    
print(GetStationLatLong(3))
