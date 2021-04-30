# This will be a standalone function, since C++ needs to import needed modules each time.

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
    Returns the azimuth in ARA's coord system from an AltAz coord. syst. like Astropy's
    
    Parameters
    ----------
    phi_AstroPy : float
        Azimuth in AltAz [radians]
    Returns
    -------
    phi_ARA : float
        Azimuth in ARA's coord system [radians]
    """    
    phi_CCW = np.mod(np.pi/2-phi_AstroPy,2*np.pi) # Convert from CW coord. system to CCW
    phi_ARA = np.mod((phi_CCW+np.pi),2*np.pi)-np.pi/2#+np.pi/2 #Convert from [0,360] to [-180,180]+ 90 deg out of phase with the ISO 6709
    return phi_ARA
    
def ConvertARAtoAltAz(phi_ARA):
    """
    Returns the azimuth in AltAz (Astropy's) coord system from ARA's coord. syst. The inverse function to convertToARACoord

    Parameters
    ----------
    phi_ARA : float
        Azimuth in ARA's coord. syst. [radians]
    Returns
    -------
    Az : float
        Azimuth in AltAz coord system [radians]
    """    
    a = np.mod(phi_ARA-np.pi, 2*np.pi)+np.pi
    az = np.mod(-a+np.pi/2,2*np.pi)+np.pi/2
    return az

def convertARAtoRaDec(station, phi_ARA, theta_ARA, unixTime):
    """
    Returns the RA and Dec (Astropy's) for an azimuth and zenith given in ARA's coord. system.

    Parameters
    ----------
    station : int
        ARA station. Works for TB (0), A2(2), A3(3)
    phi_ARA : float
        Azimuth in ARA's coord. syst. [radians]
    theta_ARA : float
        Zenith in ARA's coord. syst. [radians]
    unixTime : int
        Time Stamp in seconds
    Returns
    -------
    RA, Dec : array_like [radians]
        Azimuth in AltAz coord system [radians]
    """    
    #Define obs point
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
    time = Time(unixTime, format="unix") - utcoffset
    
    #First, we need to convert from ARA's coordinate system to AltAz
    Alt = np.pi/2-theta_ARA
    Az = ConvertARAtoAltAz(phi_ARA)
    
    #Define Astropy AltAz frame
    convert = AltAz(az = Az*u.rad, alt = Alt*u.rad, location=south_pole,obstime=time)
    #Define SkyCoord frame
    sky = SkyCoord(alt = convert.alt, az = convert.az,frame = "altaz", location=south_pole,obstime=time)
    RA = float(sky.icrs.ra/u.deg)
    Dec = float(sky.icrs.dec/u.deg)
    return [RA, Dec]
