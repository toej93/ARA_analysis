# This will be a standalone fcuntion, since C++ needs to import needed modules each time.

import astropy.units as u #astropy's units module
from astropy.time import Time
from astropy.coordinates import SkyCoord, EarthLocation, AltAz
# import datetime
import numpy as np

CenA = SkyCoord.from_name('Cen A')

def getCenACoords(station, unixtime):
    """
    Returns the position of CenA in ARA's coordinate system for a given unixTime and station
    
    Parameters
    ----------
    station : int
        ARA station. Works for TB (0), A2(2), A3(3)
    unixTime : int
        Time Stamp in seconds
    Returns
    -------
    Azimuth : array_like
        Azimuth [radians]
    """    
    stationLon = 0
    stationHeight = 0
    
    if(station == 0):
        stationLon = -74.44
        stationHeight = -30
    elif(station == 2):
        stationLon = -109.83
        stationHeight = -179.93 #Mean height of antennas
    elif(station == 3):
        stationLon = -88.17
        stationHeight = -181.66 #Mean height of antennas   
    
    south_pole = EarthLocation(lat=-89.97*u.deg, lon=stationLon*u.deg, height=stationHeight*u.m)#Assuming all stations are at the same Lat
    utcoffset = -0*u.hour  # No UTC offset, as the South Pole uses UTC
    time = Time(unixtime, format="unix") - utcoffset
    
    frametimeRange = AltAz(obstime=time, location=south_pole)
    CenAaltaz = CenA.transform_to(frametimeRange)
    CenAAz = convertToARACoord(float(np.degrees(CenAaltaz.az).rad))
    CenAZen = float(np.degrees(CenAaltaz.zen).rad)
    # print(coord)
    return [CenAAz,CenAZen]#Return a list

def convertToARACoord(phi_AstroPy):
    """
    Returns the position of CenA in ARA's coordinate system from given Astropy coord.
    
    Parameters
    ----------
    station : int
        ARA station. Works for TB (0), A2(2), A3(3)
    unixTime : int
        Time Stamp in seconds
    Returns
    -------
    Azimuth : array_like
        Azimuth [radians]
    """    
    phi_CCW = np.mod(np.pi/2-phi_AstroPy,2*np.pi) # Convert from CW coord. system to CCW
    phi_ARA = np.mod((phi_CCW+np.pi),2*np.pi)-np.pi/2#+np.pi/2 #Convert from [0,360] to [-180,180]+ 90 deg out of phase with the ISO 6709
    return phi_ARA
