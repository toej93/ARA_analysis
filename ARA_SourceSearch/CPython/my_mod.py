# import astropy
import astropy.units as u #astropy's units module
from astropy.time import Time
from astropy.coordinates import SkyCoord, EarthLocation, AltAz
import datetime
from astropy.coordinates import get_sun
import numpy as np

def my_func(unixtime):    
    CenA = SkyCoord.from_name('Cen A')
    south_pole = EarthLocation(lat=-90.0*u.deg, lon=-74.22*u.deg, height=-30*u.m)
    utcoffset = -0*u.hour  # No UTC offset, as the South Pole uses UTC
    time = Time('2013-1-01 00:00:00') - utcoffset
    timestimeRange = time
    frametimeRange = AltAz(obstime=timestimeRange, location=south_pole)
    sunaltazstimeRange = get_sun(timestimeRange).transform_to(frametimeRange)
    coord = float(np.radians(sunaltazstimeRange.az)/u.rad)
    # print(coord)
    return float(coord)

# coord = my_func()
# print()

def returnTime(unixTime):
    return int(unixTime)
