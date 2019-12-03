import numpy as np
import matplotlib.pyplot as plt

from limits import (LimitFigure, count_neutrinos, ara_energies,
                    ara_100m, ara_200m, ara_200mpa)

def plot_neutrinos_by_year_ara(fluxes, energies, veff_additions, styles=None,
                               years=[2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023],
                               stations=["ARA 1", "ARA 1-3", "ARA 1-3", "ARA 1-3", "ARA 1-3", "ARA 1-3", "ARA 1-5"],
                               xlim=None, save_name=None, color_damping=0):
    plt.figure(figsize=(7, 6))
#     plt.axhline(5, ls=':', c='k')
#     plt.grid(ls='--', c='dimgray', axis='y')
    detections = {}
    for flux in fluxes:
        detections[flux] = [0]
        for i, year in enumerate(years[1:]):
            nus = count_neutrinos(fluxes[flux], energies, veff_additions[i], stations=1, years=1) * 1e4
            detections[flux].append(np.sum(nus))

    uniq = []
    for name in stations:
        if name not in uniq:
            uniq.append(name)
    i = 0
    c = 0
    while i<min(len(stations), len(years)):
        xmin = years[i]
        st = stations[i]
        j = i+1
        while j<len(stations) and stations[j]==st:
            j += 1
        if j==len(stations):
            xmax = years[-1]
        else:
            xmax = years[j]
        cval = 1-c/(len(uniq)+color_damping)
        plt.axvspan(xmin, xmax, color=(cval, cval, cval, 0.15))
        plt.annotate(str(stations[i]),
                     xy=(i/(len(years)-1)+0.1/(len(years)-1), 0.4), xycoords='axes fraction',
                     color='k', rotation=90, verticalalignment='bottom', fontsize=12)
        i = j
        c += 1

    for flux, counts in detections.items():
        if styles is None:
            style = '.-'
            color = None
            ls = None
        else:
            style = styles[flux]
            color = style.rstrip('.-:&')
            style = style[len(color):]
            ls = None
            if style.endswith('&'):
                style = style[:-1]
                ls = (0, (5, 10))
        line, = plt.plot(years, np.cumsum(counts), style, color=color, label=flux)
        if ls is not None:
            line.set_linestyle(ls)
    plt.xlabel("Year", fontsize=16)
    plt.ylabel("Expected Number of Neutrinos", fontsize=16)
    if xlim is None:
        plt.xlim(years[0], years[-1])
    else:
        plt.xlim(*xlim)
#     plt.ylim(0, plt.ylim()[1])
    plt.ylim(0, 10)
    plt.axvline(2019, c='k', ls='--')
#     ticks = plt.xticks()[0]
#   plt.xticks(ticks[ticks%0==0], [str(int(tick)) for tick in ticks[ticks%1==0]])
    plt.xticks([2013,2015,2017,2019,2021,2023])
    plt.legend(loc=2, fontsize=12)
    ax1 = plt.gca()
    ax2 = ax1.twinx()
    ax2.set_ylim(ax1.get_ylim())
#     ax2.set_yticklabels([])
    for item in (ax1.get_xticklabels() + ax1.get_yticklabels() + ax2.get_yticklabels()):
        item.set_fontsize(14)
    plt.tight_layout()
    if save_name is not None:
        plt.savefig(save_name, dpi=300)
    plt.show()



ahlers_100 = LimitFigure._read_data('sensitivities/ahlers_100.txt')
def ahlers_100_flux(energies):
    return np.interp(energies, ahlers_100[0], ahlers_100[1]*ahlers_100[0]**(-1-ahlers_100[4]['energy_power']))

ahlers_10 = LimitFigure._read_data('sensitivities/ahlers_10.txt')
def ahlers_10_flux(energies):
    return np.interp(energies, ahlers_10[0], ahlers_10[1]*ahlers_10[0]**(-1-ahlers_10[4]['energy_power']))

ahlers_1 = LimitFigure._read_data('sensitivities/ahlers_1.txt')
def ahlers_1_flux(energies):
    return np.interp(energies, ahlers_1[0], ahlers_1[1]*ahlers_1[0]**(-1-ahlers_1[4]['energy_power']))

heinze = LimitFigure._read_data('sensitivities/heinze_cr.txt')
def heinze_flux(energies):
    return np.interp(energies, heinze[0], heinze[1]*heinze[0]**(-1-heinze[4]['energy_power']))
def heinze_min_flux(energies):
    return np.interp(energies, heinze[0], heinze[2]*heinze[0]**(-1-heinze[4]['energy_power']))
def heinze_max_flux(energies):
    return np.interp(energies, heinze[0], heinze[3]*heinze[0]**(-1-heinze[4]['energy_power']))

van_vliet = LimitFigure._read_data('sensitivities/van_vliet_10.txt')
def van_vliet_flux(energies):
    return np.interp(energies, van_vliet[0], van_vliet[1]*van_vliet[0]**(-1-van_vliet[4]['energy_power']))
def van_vliet_min_flux(energies):
    return np.interp(energies, van_vliet[0], van_vliet[2]*van_vliet[0]**(-1-van_vliet[4]['energy_power']))
def van_vliet_max_flux(energies):
    return np.interp(energies, van_vliet[0], van_vliet[3]*van_vliet[0]**(-1-van_vliet[4]['energy_power']))

kotera = LimitFigure._read_data('sensitivities/kotera_ming.txt')
def kotera_min_flux(energies):
    return np.interp(energies, kotera[0], kotera[2]*kotera[0]**(-1-kotera[4]['energy_power']))
def kotera_max_flux(energies):
    return np.interp(energies, kotera[0], kotera[3]*kotera[0]**(-1-kotera[4]['energy_power']))
kotera2 = LimitFigure._read_data('sensitivities/kotera_mid.txt')
def kotera_sfr_flux(energies):
    return np.interp(energies, kotera2[0], kotera2[1]*kotera2[0]**(-1-kotera2[4]['energy_power']))
kotera3 = LimitFigure._read_data('sensitivities/kotera_high_e.txt')
def kotera_high_e_flux(energies):
    return np.interp(energies, kotera3[0], kotera3[1]*kotera3[0]**(-1-kotera3[4]['energy_power']))

kotera_FR2 = LimitFigure._read_data('sensitivities/kotera_FRII.txt')
def kotera_FRII(energies):#scaled
    return np.interp(energies, kotera_FR2[0], (kotera_FR2[1]/3.9)*kotera_FR2[0]**(-1-kotera_FR2[4]['energy_power']))



biehl = LimitFigure._read_data('sensitivities/biehl_tde.txt')
def biehl_tde_flux(energies):
    return np.interp(energies, biehl[0], biehl[1]*biehl[0]**(-1-biehl[4]['energy_power']))
def biehl_min_flux(energies):
    return np.interp(energies, biehl[0], biehl[2]*biehl[0]**(-1-biehl[4]['energy_power']))
def biehl_max_flux(energies):
    return np.interp(energies, biehl[0], biehl[3]*biehl[0]**(-1-biehl[4]['energy_power']))

boncioli = LimitFigure._read_data('sensitivities/boncioli_llgrb.txt')
def boncioli_llgrb_flux(energies):
    return np.interp(energies, boncioli[0], boncioli[1]*boncioli[0]**(-1-boncioli[4]['energy_power']))
def boncioli_min_flux(energies):
    return np.interp(energies, boncioli[0], boncioli[2]*boncioli[0]**(-1-boncioli[4]['energy_power']))
def boncioli_max_flux(energies):
    return np.interp(energies, boncioli[0], boncioli[3]*boncioli[0]**(-1-boncioli[4]['energy_power']))

fang_merger = LimitFigure._read_data('sensitivities/fang_ns_merger.txt')
def fang_merger_flux(energies):
    return np.interp(energies, fang_merger[0], fang_merger[1]*fang_merger[0]**(-1-fang_merger[4]['energy_power']))

fang_cluster = LimitFigure._read_data('sensitivities/fang_cluster.txt')
def fang_cluster_flux(energies):
    return np.interp(energies, fang_cluster[0], fang_cluster[1]*fang_cluster[0]**(-1-fang_cluster[4]['energy_power']))

fang_pulsar = LimitFigure._read_data('sensitivities/fang_pulsar.txt')
def fang_pulsar_min_flux(energies):
    return np.interp(energies, fang_pulsar[0], fang_pulsar[2]*fang_pulsar[0]**(-1-fang_pulsar[4]['energy_power']))
def fang_pulsar_max_flux(energies):
    return np.interp(energies, fang_pulsar[0], fang_pulsar[3]*fang_pulsar[0]**(-1-fang_pulsar[4]['energy_power']))

murase_agn = LimitFigure._read_data('sensitivities/murase_agn.txt')
def murase_agn_flux(energies):
    return np.interp(energies, murase_agn[0], murase_agn[1]*murase_agn[0]**(-1-murase_agn[4]['energy_power']))

murase_grb_ism = LimitFigure._read_data('sensitivities/murase_grb_ism.txt')
def murase_grb_ism_flux(energies):
    return np.interp(energies, murase_grb_ism[0], murase_grb_ism[1]*murase_grb_ism[0]**(-1-murase_grb_ism[4]['energy_power']))

murase_grb_wind = LimitFigure._read_data('sensitivities/murase_grb_wind.txt')
def murase_grb_wind_flux(energies):
    return np.interp(energies, murase_grb_wind[0], murase_grb_wind[1]*murase_grb_wind[0]**(-1-murase_grb_wind[4]['energy_power']))

murase_grb_late = LimitFigure._read_data('sensitivities/murase_grb_late_prompt.txt')
def murase_grb_late_flux(energies):
    return np.interp(energies, murase_grb_late[0], murase_grb_late[1]*murase_grb_late[0]**(-1-murase_grb_late[4]['energy_power']))

def pulsar_koteraFRII(energies):
    kotera_interp=np.interp(fang_pulsar[0],kotera_FR2[0],kotera_FR2[1])
    return np.interp(energies, fang_pulsar[0], ((fang_pulsar[3]+kotera_interp)/4.4)*fang_pulsar[0]**(-1-fang_pulsar[4]['energy_power']))


if __name__=="__main__":
    fluxes = {
        "SFR $E_{max}=10^{21.5}$, Kotera et al.": kotera_high_e_flux,
        "SFR $E_{max}=10^{20.5}$, Kotera et al.": kotera_sfr_flux,
        "IceCube $E^{-2.19}$ Extrapolated": lambda e: LimitFigure._i3_nu_fit(e, slope=-2.19, offset=1.01),
        "100% protons, Ahlers & Halzen": ahlers_100_flux,
        "10% protons, Ahlers & Halzen": ahlers_10_flux,
        "1% protons, Ahlers & Halzen": ahlers_1_flux,
    }

    styles = {
        "SFR $E_{max}=10^{21.5}$, Kotera et al.": "deeppink.--",
        "SFR $E_{max}=10^{20.5}$, Kotera et al.": "darkmagenta.--",
        "IceCube $E^{-2.19}$ Extrapolated": "dodgerblue.-",
        "100% protons, Ahlers & Halzen": "mediumblue.-.",
        "10% protons, Ahlers & Halzen": "royalblue.-.",
        "1% protons, Ahlers & Halzen": "cornflowerblue.-.",
    }

    ara_by_year = [284*ara_100m/366, (217+233)*ara_200m/365, (124*ara_100m+(313+304)*ara_200m)/365,
                   (345+250)*ara_200m/365, (127*ara_100m+(323+297)*ara_200m)/366, 137*ara_200m/365,
                   (316*ara_100m+(303+316+313)*ara_200m+186*ara_200mpa)/365,
                   ara_100m+3*ara_200m+ara_200mpa, ara_100m+3*ara_200m+ara_200mpa, ara_100m+3*ara_200m+ara_200mpa]

    plot_neutrinos_by_year_ara(fluxes, ara_energies, ara_by_year, styles=styles,
                               years=[2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022],
                               stations=["ARA 1", "ARA 1-3", "ARA 1-3", "ARA 1-3", "ARA 1-3", "ARA 1-3", "ARA 1-5"],
                               save_name='yearly_neutrinos_ara_fluxes.pdf')

    fluxes = {
        "AGN, Murase": murase_agn_flux,
        "GRB afterglow-late prompt, Murase": murase_grb_late_flux,
        "GRB afterglow-wind, Murase": murase_grb_wind_flux,
        "GRB afterglow-ISM, Murase": murase_grb_ism_flux,
        "Clusters, Fang & Murase": fang_cluster_flux,
    }

    styles = {
        "AGN, Murase": "red.--",
        "GRB afterglow-late prompt, Murase": "saddlebrown.-.",
        "GRB afterglow-wind, Murase": "goldenrod.-.",
        "GRB afterglow-ISM, Murase": "gold.-.",
        "Clusters, Fang & Murase": "mediumvioletred.&",
    }

    plot_neutrinos_by_year_ara(fluxes, ara_energies, ara_by_year, styles=styles,
                               years=[2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022],
                               stations=["ARA 1", "ARA 1-3", "ARA 1-3", "ARA 1-3", "ARA 1-3", "ARA 1-3", "ARA 1-5"],
                               save_name='yearly_neutrinos_ara_sources.pdf')

