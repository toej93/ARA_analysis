import os
import pickle
import numpy as np
import scipy.signal
from pyrex.internal_functions import (normalize, complex_bilinear_interp, complex_interp)
# import pyrex.custom.analysis as analysis
# import pyrex.custom.araroot as araroot
import pyrex.custom.envelope_reco as reco
import pyrex.custom.ara as ara
from pyrex.internal_functions import (normalize, complex_bilinear_interp,
                                      complex_interp)

"""
Most of these functions were modified from PyREx
"""

VPOL_DATA_FILE = os.path.join(ara.antenna.ARA_DATA_DIR,
                              "ARA_bicone6in_output_MY_fixed.txt")
VPOL_THETA_RESPONSE_DATA = ara.antenna._read_arasim_antenna_data(VPOL_DATA_FILE)
VPOL_RESPONSE_DATA = (
    VPOL_THETA_RESPONSE_DATA[0],
    np.zeros(VPOL_THETA_RESPONSE_DATA[0].shape),
    *VPOL_THETA_RESPONSE_DATA[1:]
)
ara_antenna = VPOL_RESPONSE_DATA

theta_response = ara_antenna[0]
phi_response = ara_antenna[1]
response_freqs = ara_antenna[2]
response_zens = ara_antenna[3]
response_azis = ara_antenna[4]

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

def doReco(antenna_waveforms, plot_map=False):
    tof_data, grid_points = load_tof_grid_data("tofs_ara02_vpols_300m_spherical.npz")
    # antenna_waveforms = pyrex_array
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
    # print(inter_vtx, inter_max)
    # plot_map = False
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

    return inter_vtx, inter_max

def interpolate_filter(frequencies):
        """
        Generate interpolated filter values for given frequencies.
        Calculate the interpolated values of the antenna system's filter gain
        data for some frequencies.
        Parameters
        ----------
        frequencies : array_like
            1D array of frequencies (Hz) at which to calculate gains.
        Returns
        -------
        array_like
            Complex filter gain in voltage for the given `frequencies`.
        """
        ARAfilter = ara.antenna.ALL_FILTERS_DATA
        filt_response = ARAfilter[0]
        filt_freqs = ARAfilter[1]
        return complex_interp(
            x=frequencies, xp=filt_freqs, fp=filt_response,
            method='euler', outer=0
        )

def directional_response(theta, phi, polarization=np.array([0,0,1])):
        """
        Generate the (complex) frequency-dependent directional response.
        For given angles and polarization direction, use the model of the
        directional and polarization gains of the antenna to generate a
        function for the interpolated response of the antenna with respect to
        frequency. Used with the `frequency_response` method to calculate
        effective heights.
        Parameters
        ----------
        theta : float
            Polar angle (radians) from which a signal is arriving.
        phi : float
            Azimuthal angle (radians) from which a signal is arriving.
        polarization : array_like
            Normalized polarization vector in the antenna coordinate system.
        Returns
        -------
        function
            A function which returns complex-valued voltage gains for given
            frequencies, using the values of incoming angle and polarization.
        See Also
        --------
        ARAAntenna.frequency_response : Calculate the (complex) frequency
                                        response of the antenna.
        """
#         e_theta = [np.cos(theta) * np.cos(phi),
#                    np.cos(theta) * np.sin(phi),
#                    -np.sin(theta)]
#         e_phi = [-np.sin(phi), np.cos(phi), 0]
#         theta_factor = np.dot(polarization, e_theta)
#         phi_factor = np.dot(polarization, e_phi)
        theta_factor = 1
        phi_factor = 1
        theta_gains = complex_bilinear_interp(
            x=np.degrees(theta), y=np.degrees(phi),
            xp=response_zens,
            yp=response_azis,
            fp=theta_response,
            method='cartesian'
        )
        phi_gains = complex_bilinear_interp(
            x=np.degrees(theta), y=np.degrees(phi),
            xp=response_zens,
            yp=response_azis,
            fp=phi_response,
            method='cartesian'
        )
        freq_interpolator = lambda frequencies: complex_interp(
            x=frequencies, xp=response_freqs,
            fp=theta_factor*theta_gains + phi_factor*phi_gains,
            method='euler', outer=0
        )
        return freq_interpolator

def frequency_response(frequencies):
    """
    Calculate the (complex) frequency response of the antenna.
    Rather than handling the entire frequency response of the antenna, this
    method is being used to convert the frequency-dependent gains from the
    `directional_response` method into effective heights.
    Parameters
    ----------
    frequencies : array_like
        1D array of frequencies (Hz) at which to calculate gains.
    Returns
    -------
    array_like
        Complex gains in voltage for the given `frequencies`.
    See Also
    --------
    ARAAntenna.directional_response : Generate the (complex) frequency
                                      dependent directional response.
    """
    # From AraSim GaintoHeight function, with gain calculation moved to
    # the directional_response method.
    # gain=4*pi*A_eff/lambda^2 and h_eff=2*sqrt(A_eff*Z_rx/Z_air)
    # Then 0.5 to calculate power with heff (cancels 2 above)
    heff = np.zeros(len(frequencies))
    # The index of refraction in this calculation should be the index of
    # the ice used in the production of the antenna model.
    n = 1.78
    heff[frequencies!=0] = np.sqrt((3e8/frequencies[frequencies!=0]/n)**2
                                   * n*50/377 /(4*np.pi))
    return heff

def doFFT(time, volts):
    """
    Calculate the Fast-Fourier transform (FFT) of a signal.
    ----------
    time : array_like
        1D array of times (ns).
    volts : array_like
        1D array of amplitudes (mV).
    Returns
    -------
    fft : array_like
        Amplitude in f-domain.
    freq : array_like
        Frequencies in MHz
    """
    fft = scipy.fft.rfft(np.array(volts))
    dT = abs(time[1]-time[0])
    freq = 1000*scipy.fft.rfftfreq(n=len(time), d=dT)
    return fft, freq, dT

def doInvFFT(spectrum):
    """
    Calculate the inverse Fast-Fourier transform (FFT) of a signal.
    ----------
    spectrum : array_like
        1D array of amplitudes in f-domain
    Returns
    -------
    fft_i_v : array_like
        Amplitudes in mV.
    """
    fft_i_v= scipy.fft.irfft(spectrum)
    return fft_i_v

def deDisperse_filter(time, voltage):
    """
    Apply inverse of ARA filter response phase (amplitudes remain the same)
    ----------
    time : array_like
        1D array of times (ns)
    voltage : array_like
        1D array of amplitudes (mV).

    Returns
    -------
    time : array_like
        1D array of times (ns)
    deDis_wf : array_like
        1D array of amplitudes (mV) of de-dispersed waveform.
    """
    fft_v, fft_f, dT = doFFT(time,voltage)
    response = np.array(interpolate_filter(fft_f*1E6))
    response = np.divide(response,abs(response))
    deDis_wf = np.divide(fft_v,response)
    deDis_wf = np.nan_to_num(deDis_wf)
    deDis_wf = doInvFFT(deDis_wf)
    return time, deDis_wf

def deDisperse_antenna(time, voltage, theta, phi):
    """
    Apply inverse of ARA antenna response phase (amplitudes remain the same)
    ----------
    time : array_like
        1D array of times (ns)
    voltage : array_like
        1D array of amplitudes (mV).
    theta : double
        Incoming signal theta direction
    phi : double
        Incoming signal phi direction

    Returns
    -------
    time : array_like
        1D array of times (ns)
    deDis_wf : array_like
        1D array of amplitudes (mV) of de-dispersed waveform.
    """
    fft_v, fft_f, dT = doFFT(time, voltage)
    dir_res = directional_response(theta,phi)(fft_f*1E6)
    heff = dir_res * frequency_response(fft_f*1E6)
    response = dir_res*heff
    response = np.divide(response,abs(response))
    deDis_wf = np.divide(fft_v,response)
    deDis_wf = np.nan_to_num(deDis_wf)
    deDis_wf = doInvFFT(deDis_wf)
    return time, deDis_wf

def deDisperse(time, voltage, theta, phi):
    """
    Apply inverse of ARA antenna+filter response phase (amplitudes remain the same)
    ----------
    time : array_like
        1D array of times (ns)
    voltage : array_like
        1D array of amplitudes (mV).
    theta : double
        Incoming signal theta direction
    phi : double
        Incoming signal phi direction

    Returns
    -------
    time : array_like
        1D array of times (ns)
    deDis_wf : array_like
        1D array of amplitudes (mV) of de-dispersed waveform.
    """
    sampRate = len(time)/(max(time)-min(time))
    b,a = signal.bessel(4, [0.15,0.4], 'bandpass', analog=False, fs=sampRate)
    voltage = signal.lfilter(b, a, voltage)
    fft_v, fft_f, dT = doFFT(time,voltage)
    response_filter = np.array(interpolate_filter(fft_f*1E6))
    dir_res = directional_response(theta,phi)(fft_f*1E6)
    heff = dir_res * frequency_response(fft_f*1E6)
    response_antenna = dir_res*heff
    response = response_filter + response_antenna
    response = np.divide(response,abs(response))
    deDis_wf = np.divide(fft_v,response)
    deDis_wf = np.nan_to_num(deDis_wf)
    deDis_wf = doInvFFT(deDis_wf)
    return time, deDis_wf

def deConvolve_antenna(time, voltage, theta, phi, pol_ant):
    import scipy.signal as signal
    if(pol_ant == 0):
        ant = ara.VpolAntenna(name="Dummy Vpol", position=(0, 0, 0), power_threshold=0)
        polarization=np.array([0,0,1])
    if(pol_ant == 1):
        ant = ara.HpolAntenna(name="Dummy Hpol", position=(0, 0, 0), power_threshold=0)
        polarization=[0,1,0]
    sampRate = len(time)/(max(time)-min(time))
    b,a = signal.bessel(4, [0.15,0.4], 'bandpass', analog=False, fs=sampRate)
    fft_v, fft_f, dT = doFFT(time,voltage)
    response_filter = np.array(interpolate_filter(fft_f*1E6))
    dir_res = ant.antenna.directional_response(theta=theta, phi=phi, polarization=polarization)(fft_f*1E6)
    heff = ant.antenna.frequency_response(fft_f*1E6)
    response_antenna = dir_res*heff
    response = response_antenna
    deDis_wf = np.divide(fft_v,abs(response))
    response = np.divide(response,abs(response))
    deDis_wf = np.divide(deDis_wf,response)
    deDis_wf = np.nan_to_num(deDis_wf)
    revert = doInvFFT(deDis_wf)
    deDis_wf = signal.lfilter(b, a, revert)
    return time, deDis_wf
    #vetted!

def PolAngleStokes(Hpol,Vpol):
    return np.degrees(0.5*np.arctan2(2*Hpol*Vpol,(Hpol**2-Vpol**2)))

def PolRatio(Hpol,Vpol):
    return np.degrees(np.arctan(Hpol/Vpol))
