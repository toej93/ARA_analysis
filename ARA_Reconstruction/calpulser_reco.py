"""Script for reconstructing calpulser locations"""

import argparse
import os.path
import numpy as np
import pyrex
import pyrex.custom.ara as ara
import pyrex.custom.analysis as analysis
import pyrex.custom.envelope_reco as reco

# Parse arguments
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('station', type=int,
                    help="ARA station index")
parser.add_argument('-c', '--config', type=float,
                    help="ARA station configuration (default all configs)")
parser.add_argument('-r', '--runs', type=int, default=1,
                    help="Number of runs to analyze (default 1)")
parser.add_argument('-s', '--skip', type=int, default=0,
                    help="Number of runs to skip at the start (default 0)")
parser.add_argument('-e', '--events', type=int, default=100,
                    help="Number of events to analyze per run (default 100)")
parser.add_argument('--skip_events', type=int, default=0,
                    help="Number of events to skip at the start (default 0)")
parser.add_argument('--use_fullband', action='store_true',
                    help="Use fullband (hilbert) reco instead of envelope")
parser.add_argument('--use_timing', action='store_true',
                    help="Use hit-time reco instead of interferometry")
parser.add_argument('--tof_dir', default='/users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/Stokes',
                    help="Directory containing tof data files")
parser.add_argument('--spherical', action='store_true',
                    help="Use spherical coordinate system for reconstruction")
parser.add_argument('--snr', type=float, default=0,
                    help="Minimum SNR for waveforms in the reconstruction")
parser.add_argument('-o', '--outfile',
                    help="Output file (default based on parameters)")
args = parser.parse_args()


# Prepare detector object and other station-dependent variables
if args.station==1:
    station_name = 'ARA01'
    reco_file = 'tofs_ara01_vpols_calpulser.npz'
    reco_file_sph = 'tofs_ara01_vpols_calpulser_spherical.npz'
    det = ara.ARA01()
    det.build_antennas(6)
elif args.station==2:
    station_name = 'ARA02'
    reco_file = 'tofs_ara02_vpols_calpulser.npz'
    reco_file_sph = 'tofs_ara02_vpols_calpulser_spherical.npz'
    det = ara.ARA02()
    det.build_antennas(6)
elif args.station==3:
    station_name = 'ARA03'
    reco_file = 'tofs_ara03_vpols_calpulser.npz'
    reco_file_sph = 'tofs_ara03_vpols_calpulser_spherical.npz'
    det = ara.ARA03()
    det.build_antennas(6)
elif args.station==4:
    station_name = 'ARA04'
    reco_file = 'tofs_ara04_vpols_calpulser.npz'
    reco_file_sph = 'tofs_ara04_vpols_calpulser_spherical.npz'
    det = ara.ARA04()
    det.build_antennas(6)
elif args.station==5:
    station_name = 'ARA05'
    reco_file = 'tofs_ara05_vpols_calpulser.npz'
    reco_file_sph = 'tofs_ara05_vpols_calpulser_spherical.npz'
    det = ara.ARA05()
    det.build_antennas(6)
else:
    raise ValueError("No known ARA station with index "+str(args.station))

# Get file names
infiles = ["/fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0628/run003826/event003826.root"]#analysis.get_station_files(station_name, args.config)
infiles = infiles[args.skip:args.skip+args.runs]

# Get reconstruction grid
vpols = [ant for ant in det if isinstance(ant, ara.VpolAntenna)]
if args.spherical:
    antenna_positions = [ant.position for ant in vpols]
    with np.load(os.path.join(args.tof_dir, reco_file_sph)) as f:
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
else:
    tof_data, grid_points = reco.load_tof_grid_data(
        os.path.join(args.tof_dir, reco_file),
        [ant.position for ant in vpols]
    )

# Prepare method for extracting waveforms
get_wave = lambda ant: ant._event_waveform

# Prepare method for calculating SNR
def get_snr(wave, exclusion_window=50e-9):
    n_exclude = int(exclusion_window / wave.dt)
    if exclusion_window%wave.dt:
        n_exclude += 1
    max_bin = np.argmax(np.abs(wave.values))
    if max_bin<n_exclude:
        noise = wave.values[max_bin+n_exclude:]
    elif max_bin>len(wave.values)-n_exclude:
        noise = wave.values[:max_bin-n_exclude]
    else:
        noise = np.concatenate((
            wave.values[:max_bin-n_exclude],
            wave.values[max_bin+n_exclude:]
        ))
    return (np.max(np.abs(wave.values)) - np.mean(noise)) / np.std(noise)

# Prepare methods for timing reconstruction
def constant_fraction(waveform, fraction=0.5):
    max_bin = np.argmax(waveform.values)
    max_val = waveform.values[max_bin]
    below_fraction = np.where(waveform.values < fraction*max_val)[0]
    if below_fraction[0]<max_bin:
        frac_bin = below_fraction[below_fraction<max_bin][-1] + 1
    else:
        frac_bin = 0
    return wave.times[frac_bin]

def calculate_lsq_grid(hit_times, tofs):
    ht = np.asarray(hit_times)
    ht_deltas = ht[:, np.newaxis] - ht[np.newaxis, :]
    tof_deltas = tofs[:, :, :, :, np.newaxis] - tofs[:, :, :, np.newaxis, :]
    return (np.sum((ht_deltas*1e9 - tof_deltas*1e9)**2, axis=(-1, -2))
             / 2 / (ht.size**2 - ht.size))

vertices = []
values = []
for filename in infiles:
    print(filename)
    # Prepare event iterator
    event_iter = analysis.iterate_ara_files(
        [filename], det, size=1000, event_type='good calpulser'
    )
    for i, event in enumerate(event_iter):
        if i<args.skip_events:
            continue
        elif i>=args.skip_events+args.events:
            break
        print(i, end='..', flush=True)
        # Process waveforms into envelopes if necessary
        if not args.use_fullband:
            event = analysis.create_envelope_event(event)
        # Pad waveforms to the same length
        max_len = max([len(wave.values) for ant, wave
                    in zip(event.antennas, event.waveforms)
                    if isinstance(ant, ara.VpolAntenna)])
        for ant in vpols:
            wave = get_wave(ant)
            n_extra = max_len - len(wave.values)
            if n_extra:
                wave.values = np.concatenate((wave.values, np.zeros(n_extra)))
                wave.times = np.concatenate((wave.times,
                                            (np.arange(n_extra)+1)*wave.dt
                                            + wave.times[-1]))
        if args.snr>0:
            use_vpols = [get_snr(get_wave(vpol))>=args.snr for vpol in vpols]
        else:
            use_vpols = [True]*len(vpols)
        if args.use_timing:
            # Perform hit-time reconstruction
            hit_times = []
            for ant, use in zip(vpols, use_vpols):
                if use:
                    wave = get_wave(ant)
                    hit_times.append(constant_fraction(wave, fraction=0.6))
            value = np.inf
            vertex = None
            for tofs in tof_data:
                lsq_data = calculate_lsq_grid(hit_times, tofs[:, :, :, use_vpols])
                min_val = np.min(lsq_data)
                if vertex is None or min_val<value:
                    value = min_val
                    i, j, k = np.unravel_index(np.argmin(lsq_data),
                                               lsq_data.shape)
                    vertex = np.array((grid_points[0][i],
                                       grid_points[1][j],
                                       grid_points[2][k]))
        else:
            # Perform interferometric reconstruction
            vertex, value = reco.full_interferometric_reconstruction(
                antennas=vpols, get_waveform=get_wave,
                tof_data=tof_data, grid_points=grid_points,
                hilbert=args.use_fullband, fit_line=False,
                mask=use_vpols
            )
        # Store results
        vertices.append(vertex)
        values.append(value)
    print()


# Prepare output file name
if args.outfile is None:
    reco_type = 'hilb' if args.use_fullband else 'env'
    args.outfile = f'calpulser_reco_{reco_type}_{station_name.lower()}'
    if args.config is not None:
        args.outfile += f'_conf{args.config}'
    if args.spherical:
        args.outfile += '_spherical'
    args.outfile += '.npz'

np.savez_compressed(args.outfile,
                    vertices=np.asarray(vertices),
                    values=np.asarray(values))
