import numpy as np
import matplotlib.pyplot as plt

# PyRex version 1.8.1 used to make plots for 2018 ARA Analysis Proposal
import pyrex


# This class based on Anna Nelles's plotting script:
# https://github.com/nu-radio/NuRadioMC/blob/138f8419e2db935bd07cb41d88ff2ea1b9ee99e1/NuRadioMC/examples/Sensitivities/E2_fluxes2.py
class LimitFigure:
    def __init__(self, figsize=(7, 6), xlims=(1e5, 1e11), ylims=(1e-11, 1e-5),
                 energy_units=1, flux_units=1, e_bins_per_decade=1, e_power=2,
                 font_size=12, tick_size=12):
        self.fig, self.ax = plt.subplots(1, 1, figsize=figsize)

        self.ax.set_xscale('log')
        self.ax.set_yscale('log')

        self.ax.set_xlabel(r'Neutrino Energy [GeV]')
        if e_power==2:
            self.ax.set_ylabel(r'$E^2\Phi$ [GeV cm$^{-2}$ s$^{-1}$ sr$^{-1}$]')
        elif e_power==1:
#             self.ax.set_ylabel(r'$E\Phi$ [cm$^{-2}$ s$^{-1}$ sr$^{-1}$]')
            self.ax.set_ylabel(r'$E\ dN/(dE\ dA\ d\Omega\ dt)$ [cm$^{-2}$ s$^{-1}$ sr$^{-1}$]')
        else:
            raise ValueError("Invalid power ("+e_power+")")

        self.ax.set_xlim(*xlims)
        self.ax.set_ylim(*ylims)

        self.ax.title.set_fontsize(font_size)

        plt.tight_layout()

        self.ax.xaxis.label.set_fontsize(font_size)
        self.ax.yaxis.label.set_fontsize(font_size)
        for label in self.ax.get_xticklabels() + self.ax.get_yticklabels():
            label.set_fontsize(tick_size)

        self.e_power = e_power
        self.e_unit = energy_units
        self.f_unit = flux_units
        self.e_bins = e_bins_per_decade
        self.font_size = font_size
        
        self.neutrino_models = []
        self.custom_limits = []

    @staticmethod
    def _i3_nu_fit(energy, slope=-2.13, offset=0.9):
        flux = 3 * offset * (energy / (100 * 1e3))**slope * 1e-18
        return flux

    @classmethod
    def _get_i3_mu_range(cls):
        energy = np.arange(1e5, 5e6, 1e5)
        upper = np.maximum(cls._i3_nu_fit(energy, offset=0.9, slope=-2.),
                           cls._i3_nu_fit(energy, offset=1.2, slope=-2.13))
        lower = np.minimum(cls._i3_nu_fit(energy, offset=0.9, slope=-2.26),
                           cls._i3_nu_fit(energy, offset=0.63, slope=-2.13))
        return energy, upper, lower

    @classmethod
    def _get_i3_hese_range(cls):
        energy = np.arange(1e5, 5e6, 1e5)
        upper = np.maximum(cls._i3_nu_fit(energy, offset=2.46, slope=-2.63),
                           cls._i3_nu_fit(energy, offset=2.76, slope=-2.92))
        lower = np.minimum(cls._i3_nu_fit(energy, offset=2.46, slope=-3.25),
                           cls._i3_nu_fit(energy, offset=2.16, slope=-2.92))
        return energy, upper, lower

    units = {
        "eV":  1e-9,
        "keV": 1e-6,
        "MeV": 1e-3,
        "GeV": 1,
        "TeV": 1e3,
        "PeV": 1e6,
        
        "mm": 1e-1,
        "cm": 1,
        "m":  1e2,
        "km": 1e5,
        
        "ns": 1e-9,
        "us": 1e-6,
        "ms": 1e-3,
        "s":  1,
        "min": 60,
        "hr": 60*60,
        "yr": 365*24*60*60,
        
        "sr": 1,
    }

    @classmethod
    def _read_data(cls, file):
        energy_col = None
        flux_col = None
        min_col = None
        max_col = None
        e_power = None
        bins_per_decade = None
        data_type = None
        with open(file, 'r') as f:
            column_number = -1
            for line in f:
                line = line.rstrip()
                if line=='':
                    continue
                if not line.startswith('#'):
                    break
                line = line.strip('#')
                words = line.split()
                column_number += 1
                if 'data type:' in line.lower():
                    data_type = " ".join(words[2:]).lower()
                    continue
                if 'bins per decade' in line.lower():
                    bins_per_decade = float(words[-1])
                    continue
                if words[0].lower().startswith("column"):
                    column_number = -1
                    continue
                if words[0].lower()=='energy':
                    unit = words[1].strip('[').rstrip(']')
                    if unit not in cls.units:
                        raise ValueError("Unable to interpret unit "+words[2])
                    energy_unit = cls.units[unit]
                    energy_col = column_number
                elif words[0].lower()=='flux' and words[1].lower()!='band':
                    flux_unit = 1
                    for word in words[1:]:
                        word = word.strip('[').rstrip(']')
                        bits = word.split("^")
                        unit = bits[0]
                        power = float(bits[1]) if len(bits)>1 else 1
                        if unit not in cls.units:
                            raise ValueError("Unable to interpret unit ["+word+"]")
                        if unit.endswith('eV'):
                            e_power = power
                        elif unit.endswith('m'):
                            if power!=-2:
                                raise ValueError("Expected unit ["+word+"] to be to the -2 power")
                        else:
                            if power!=-1:
                                raise ValueError("Expected unit ["+word+"] to be to the -1 power")
                        flux_unit *= cls.units[unit]
                    flux_col = column_number
                elif 'minimum' in words:
                    min_col = column_number
                elif 'maximum' in words:
                    max_col = column_number

        data = np.loadtxt(file, comments='#')
        energies = data[:, energy_col] * energy_unit
        fluxes = data[:, flux_col] * flux_unit
        band_min = data[:, min_col] * flux_unit
        band_max = data[:, max_col] * flux_unit
        meta = {
            "energy_unit": energy_unit,
            "flux_unit": flux_unit,
            "energy_power": e_power,
            "data_type": data_type,
            "bins_per_decade": bins_per_decade
        }
        return energies, fluxes, band_min, band_max, meta


    def get_data(self, filename):
        energies, fluxes, band_min, band_max, meta = self._read_data(filename)
        energies /= self.e_unit
        fluxes /= self.f_unit
        band_min /= self.f_unit
        band_max /= self.f_unit
        e_power = self.e_power - 1 - meta['energy_power']
        fluxes *= energies**e_power
        band_min *= energies**e_power
        band_max *= energies**e_power
        if 'limit' in meta['data_type']:
            fluxes *= self.e_bins / meta['bins_per_decade']
            band_min *= self.e_bins / meta['bins_per_decade']
            band_max *= self.e_bins / meta['bins_per_decade']
        return energies, fluxes, band_min, band_max


    def add_model(self, name):
        if name=='heinze':
            energy, flux, band_min, band_max = self.get_data('sensitivities/heinze_cr.txt')
            heinze, = self.ax.plot(energy, flux,
                                   color='black', linestyle='-.',
                                   label=r'Best fit, Heinze et al.')
#                                    label=r'Best fit UHECR ($\pm$ 3$\sigma$), Heinze et al.')
#             self.ax.fill_between(energy, band_min, band_max,
#                                  color='0.8')
            self.neutrino_models.append(heinze)

        elif name=='van_vliet':
            energy, flux, band_min, band_max = self.get_data('sensitivities/van_vliet_10.txt')
            prot10, = self.ax.plot(energy, flux,
                                   color='orchid', linestyle='-.',
                                   label=r'10% protons, van Vliet et al.')
            self.neutrino_models.append(prot10)
    

        elif name=='ahlers':
            energy, flux, _, _ = self.get_data('sensitivities/ahlers_100.txt')
            prot100, = self.ax.plot(energy, flux,
                                    color='mediumblue', linestyle='-.',
                                    label=r'100% protons, Ahlers & Halzen')
            energy, flux, _, _ = self.get_data('sensitivities/ahlers_10.txt')
            prot10, = self.ax.plot(energy, flux,
                                   color='royalblue', linestyle='-.',
                                   label=r'10% protons, Ahlers & Halzen')
            energy, flux, _, _ = self.get_data('sensitivities/ahlers_1.txt')
            prot1, = self.ax.plot(energy, flux,
                                  color='cornflowerblue', linestyle='-.',
                                  label=r'1% protons, Ahlers & Halzen') # (1208.4181)
            self.neutrino_models.extend([prot100, prot10, prot1])
            
            
            
        elif name=='ahlers_1':
            energy, flux, band_min, band_max = self.get_data('sensitivities/ahlers_1.txt')
#             prot10, = self.ax.plot(energy, flux,
#                                    color='cornflowerblue', linestyle='-.',
#                                    label=r'1% protons, Ahlers & Halzen')
#             self.neutrino_models.append(prot10)
            energy2, flux_kot, band_min, band_max  = self.get_data('sensitivities/kotera_FRII.txt')
            fluxInterp = np.interp(energy2, energy, flux)
            fill2 = self.ax.fill_between(energy2, fluxInterp, flux_kot,
                             color='red',label="Cosmogenic", alpha=0.1)
            self.neutrino_models.append(fill2)   
    
            energy_SFRHiE, flux_SFRHiE, band_min, band_max  = self.get_data('sensitivities/kotera_high_e.txt')
            fluxInterp_SFRHiE = np.interp(energy2, energy_SFRHiE, flux_SFRHiE)
            arrow_SFRHiE = self.ax.annotate(s='', xy=(energy2[33],fluxInterp_SFRHiE[33]), xytext=(energy2[33],flux_kot[33]),                 arrowprops=dict(arrowstyle='<|-|>',color='rosybrown',lw=2))
            
            energy_heavyComp, flux_heavyComp, band_min, band_max  = self.get_data('sensitivities/ahlers_100.txt')
            fluxInterp_heavyComp = np.interp(energy2, energy_heavyComp, flux_heavyComp)
            arrow_heavyComp = self.ax.annotate(s='', xy=(energy2[45],fluxInterp_heavyComp[45]), xytext=(energy2[45],fluxInterp[45]), arrowprops=dict(arrowstyle='<|-|>',color='rosybrown',lw=2))
            

#             self.neutrino_models.append([arrow_SFRHiE,arrow_heavyComp])
            
        elif name=='ahlers_100':
            energy, flux, band_min, band_max = self.get_data('sensitivities/ahlers_100.txt')
            prot10, = self.ax.plot(energy, flux,
                                   color='cornflowerblue', linestyle='--')
#                                    label=r'100% protons, Ahlers & Halzen')
            self.neutrino_models.append(prot10)

        elif name=='kotera':
#             energy, _, band_min, band_max = self.get_data('sensitivities/kotera_ming.txt')
#             compositions = self.ax.fill_between(energy, band_min, band_max,
#                                                 color='gray', alpha=0.25,
#                                                 label=r'UHECR, Olinto et al.')

            energy, flux, _, _ = self.get_data('sensitivities/kotera_high_e.txt')
            kotera_high, = self.ax.plot(energy, flux,
                                        color='blue', linestyle='--',
                                        label=r'SFR $E_{max}=10^{21.5}$, Kotera et al.') # (1009.1382)

            energy, flux, _, _ = self.get_data('sensitivities/kotera_mid.txt')
            kotera, = self.ax.plot(energy, flux,
                                   color='blue', linestyle='-.',
                                   label=r'SFR $E_{max}=10^{20.5}$, Kotera et al.') # (1009.1382)
            self.neutrino_models.extend([kotera_high, kotera])#[compositions, kotera_high, kotera])
        
        elif name=='kotera_grb':
            energy, flux, _, _ = self.get_data('sensitivities/kotera_GRB.txt')
            ns_merger, = self.ax.plot(energy, flux,
                                      color='green', linestyle=(0, (3, 5, 1, 5)),
                                      label='Kotera GRB') # (1707.04263)
            self.neutrino_models.append(ns_merger)
            
        elif name=='fang_merger':
            energy, flux, _, _ = self.get_data('sensitivities/fang_ns_merger.txt')
            ns_merger, = self.ax.plot(energy, flux,
                                      color='palevioletred', linestyle=(0, (3, 5, 1, 5)),
                                      label='NS-NS merger, Fang & Metzger') # (1707.04263)
            self.neutrino_models.append(ns_merger)

        elif name=='fang_pulsar':
            energy, _, band_min, band_max = self.get_data('sensitivities/fang_pulsar.txt')
            p_pulsar = self.ax.fill_between(energy, band_min, band_max,
                                            color='pink', alpha=0.5,
                                            label="Pulsar, Fang et al.") # (1311.2044)
            self.neutrino_models.append(p_pulsar)
            
        elif name=='fang_pulsar_max':
            energy, _, _, band_max = self.get_data('sensitivities/fang_pulsar.txt')
            energy2, flux_kot, _, _  = self.get_data('sensitivities/kotera_FRII.txt')
            fluxInterp = np.interp(energy2, energy, band_max)
#             fill2 = self.ax.fill_between(energy2, fluxInterp, flux_kot,
#                              color='0.8',label="", alpha=0.6)
#             self.neutrino_models.append(fill2)  
            
#             p_pulsar, = self.ax.plot(energy2, (fluxInterp+flux_kot)/4.4,
#                                             color='teal',
#                                             linestyle="--",
#                                             label="Pulsar (upper limit)+Kotera FRII (scaled)") # (1311.2044)
#             self.neutrino_models.append(p_pulsar)
            
            
            
            
        elif name=='fang_cluster':
            energy, flux, _, _ = self.get_data('sensitivities/fang_cluster.txt')
            p_cluster, = self.ax.plot(energy, flux,
                                      color="mediumvioletred", zorder=1, linestyle=(0, (5, 10)),
                                      label="Clusters, Fang & Murase") # (1704.00015)
            self.neutrino_models.append(p_cluster)

        elif name=='biehl':
            energy, flux, band_min, band_max = self.get_data('sensitivities/biehl_tde.txt')
            self.ax.fill_between(energy, band_min, band_max,
                                 color='thistle', alpha=0.5)
            p_tde, = self.ax.plot(energy, flux,
                                  color='darkmagenta', linestyle=':',zorder=1,
                                  label="TDE, Biehl et al.") # (1711.03555)
            self.neutrino_models.append(p_tde)

        elif name=='boncioli':
            energy, flux, band_min, band_max = self.get_data('sensitivities/boncioli_llgrb.txt')
            self.ax.fill_between(energy, band_min, band_max,
                                 color='0.8')
            p_ll_grb, = self.ax.plot(energy, flux,
                                     linestyle='-.', c='k', zorder=1,
                                     label="LLGRB, Boncioli et al.") # (1808.07481)
            self.neutrino_models.append(p_ll_grb)

        elif name=='murase_agn':
            energy, flux, _, _ = self.get_data('sensitivities/murase_agn.txt')
            agn, = self.ax.plot(energy, flux,
                                color="saddlebrown", linestyle='--',
                                label="AGN, Murase") # (1511.01590)
            self.neutrino_models.append(agn)
            
        elif name=='wittkowski':
            energy, flux, _, _ = self.get_data('sensitivities/wittkowski_BFields.txt')
            bfields, = self.ax.plot(energy, flux,
                                color="red", linestyle='--',
                                label="With/Without extra-gal. B fields") # (1810.03769)
            self.neutrino_models.append(bfields)
        
        elif name=='wittkowski_off':
            energy, flux, _, _ = self.get_data('sensitivities/wittkowski_BFields_off.txt')
            bfields, = self.ax.plot(energy, flux,
                                color="red", linestyle='-.')#,
#                                 label="Without extra-gal. B fields") # (1810.03769)
            self.neutrino_models.append(bfields)
            
        elif name=='batista':
            energy, flux, _, _ = self.get_data('sensitivities/batista18.txt')
            rshift, = self.ax.plot(energy, flux,
                                color="saddlebrown", linestyle='-.',
                                label="High/Low redshift cutoff") # (1810.03769)
            self.neutrino_models.append(rshift)
        
        elif name=='batista_low_z':
            energy, flux, _, _ = self.get_data('sensitivities/batista18_lowz.txt')
            rshift, = self.ax.plot(energy, flux,
                                color="saddlebrown", linestyle='--')
#                                 label="Low redshift cutoff") # (1810.03769)
            self.neutrino_models.append(rshift)
            
        elif name=='van_vliet2019':
                energy, flux, band_min, band_max = self.get_data('sensitivities/vanvliet19.txt')
#                 prot10, = self.ax.plot(energy, flux,
#                                        color='orchid', linestyle='-.',
#                                        label=r'High/Low $E_{max}$')
    #             prot = self.ax.fill_between(energy, band_min, band_max,
    #                                         color='orchid', alpha=0.25,
    #                                         label=r'not excluded from UHECRs')
    #             self.neutrino_models.append(prot)
#                 self.neutrino_models.append(prot10)
        
                energy_lowE, flux_lowE, band_min, band_max  = self.get_data('sensitivities/vanvliet19_Elow.txt')
                fluxInterp_lowE = np.interp(energy, energy_lowE, flux_lowE)
                arrow_heavyComp = self.ax.annotate(s='', xy=(energy[37]+3e9,fluxInterp_lowE[37]), xytext=(2.5e10,fluxInterp_lowE[37]), arrowprops=dict(arrowstyle='<|-|>',color='rosybrown',lw=2))
        
        elif name=='van_vliet2019_Elow':
                energy, flux, band_min, band_max = self.get_data('sensitivities/vanvliet19_Elow.txt')
                prot10, = self.ax.plot(energy, flux,
                                       color='orchid', linestyle='--')
                self.neutrino_models.append(prot10)
            
        elif name=='van_vliet2019_hard':
                energy, flux, band_min, band_max = self.get_data('sensitivities/vanvliet19_hard.txt')
                prot10, = self.ax.plot(energy, flux,
                                       color='deeppink', linestyle='--')
                self.neutrino_models.append(prot10)
                
        elif name=='van_vliet2019_soft':
                energy, flux, band_min, band_max = self.get_data('sensitivities/vanvliet19_soft.txt')
                prot10, = self.ax.plot(energy, flux,
                                       color='deeppink', linestyle='-.',
                                       label=r'Hard/soft spectrum ($E_{max}=10^{12}$ GeV)')
                self.neutrino_models.append(prot10)
                
        elif name=='diagonal':
                energy, flux, band_min, band_max = self.get_data('sensitivities/diagonal_E2dNdE.txt')
                prot10, = self.ax.plot(energy, flux,
                                       color='gray', linestyle='--')#,
#                                        label=r'$E^2\frac{dN}{dE}=10^{-9}$ [GeV$\,cm^{-2}\, s^{-1} \,sr^{-1}]$')
                self.ax.annotate("$E^2dN/dE=10^{-9}$ [GeV$\,cm^{-2}\, s^{-1} \,sr^{-1}]$",(1e6,1e-15),rotation=-43, color="gray")
                self.neutrino_models.append(prot10)
                
        elif name=='kotera_FRII':#3.9
                energy, flux, band_min, band_max = self.get_data('sensitivities/kotera_FRII.txt')
#                 energy2, flux2, band_min, band_max  = self.get_data('sensitivities/vanvliet19_highE_hard.txt')
#                 fluxInterp = np.interp(energy2, energy, flux)
                prot10, = self.ax.plot(energy, flux/3.9, 
                                       color='firebrick', linestyle='-',
                                       label=r'FRII evolution - saturate limits')
                self.neutrino_models.append(prot10)
                
        elif name=='vanvliet19_highE_hard':
                energy, flux, band_min, band_max = self.get_data('sensitivities/vanvliet19_highE_hard.txt')
                prot10, = self.ax.plot(energy[26:], flux[26:],
                                       color='red', linestyle='-.',
                                       label=r'$E_{max}=10^{14}$ GeV, $\alpha=2.0$')
                self.neutrino_models.append(prot10)
#                 energy2, flux_kot, band_min, band_max  = self.get_data('sensitivities/kotera_FRII.txt')
#                 fluxInterp = np.interp(energy, energy2, flux_kot)
#                 fill2=self.ax.fill_between(energy, flux, fluxInterp,
#                                  color='0.8',label="Shaded region", alpha=0.6)
#                 self.neutrino_models.append(fill2)

                
                
                

        elif name=='murase_grb':
#             energy, flux, _, _ = self.get_data('sensitivities/murase_grb_late_prompt.txt')
#             late, = self.ax.plot(energy, flux,
#                                  color="saddlebrown", linestyle='-.',
#                                  label="GRB afterglow-late prompt, Murase") # (0707.1140)
            energy, flux, _, _ = self.get_data('sensitivities/murase_grb_wind.txt')
#             wind, = self.ax.plot(energy, flux,
#                                  color="goldenrod", linestyle='-.',
#                                  label="GRB afterglow-wind, Murase") # (0707.1140)
#             energy, flux, _, _ = self.get_data('sensitivities/murase_grb_ism.txt')
#             ism, = self.ax.plot(energy, flux,
#                                 color="gold", linestyle='-.',
#                                 label="GRB afterglow-ISM, Murase") # (0707.1140)
#             self.neutrino_models.extend([late, wind, ism])
#             self.neutrino_models.append(wind)
           
            energy2, _, _, band_max = self.get_data('sensitivities/fang_pulsar.txt')
            fluxInterp = np.interp(energy2, energy, flux)
            fill2 = self.ax.fill_between(energy2, fluxInterp, band_max,
                             color='blue',label="Astrophysical", alpha=0.1)
            self.neutrino_models.append(fill2)   
            
            

        else:
            raise ValueError("Unrecognized data set '"+str(name)+"'")


    def add_experiment(self, name):
        if 'ice_cube' in name:
            if self.e_power==2:
                self.ax.annotate('IceCube',
                                 xy=(1e6, 5e-8), xycoords='data',
                                 horizontalalignment='center', color='dodgerblue', rotation=0)
            if self.e_power==1:
                self.ax.annotate('IceCube \n (9yr limit)',
                                 xy=(1.3e7, 2.1e-15), xycoords='data',
                                 horizontalalignment='center', color='dodgerblue', rotation=-30)

        if name=='grand_10k':
            energy, flux, _, _ = self.get_data('sensitivities/grand_10k.txt')
            self.ax.plot(energy, flux,
                         color='saddlebrown', linestyle="--")
            if self.e_power==2:
                self.ax.annotate('GRAND 10k',
                                 xy=(1e10, 5e-8*self.e_bins), xycoords='data',
                                 horizontalalignment='left', color='saddlebrown', rotation=40)
            if self.e_power==1:
                self.ax.annotate('GRAND 10k',
                                 xy=(2e9, 5e-18*self.e_bins), xycoords='data',
                                 horizontalalignment='left', color='saddlebrown', rotation=-10)

        elif name=='grand_200k':
            energy, flux, _, _ = self.get_data('sensitivities/grand_200k.txt')
            self.ax.plot(energy, flux,
                         color='saddlebrown', linestyle="--")
            if self.e_power==2:
                self.ax.annotate('GRAND 200k',
                                 xy=(1e10, 3e-9*self.e_bins), xycoords='data',
                                 horizontalalignment='left', color='saddlebrown', rotation=40)

        elif name=='radar':
            energy, _, band_min, band_max = self.get_data('sensitivities/radar.txt')
            self.ax.fill_between(energy, band_min, band_max,
                                 facecolor='None', edgecolor='0.8', hatch='x')
            if self.e_power==2:
                self.ax.annotate('Radar',
                                 xy=(1e9, 3e-8*self.e_bins), xycoords='data',
                                 horizontalalignment='left', color='0.7', rotation=45)

        elif name=='ice_cube_ehe':
            energy, flux, _, _ = self.get_data('sensitivities/ice_cube_ehe.txt')
            self.ax.plot(energy, flux,
                         color='dodgerblue')

        elif name=='ice_cube_hese_data':
            energy, flux, err_min, err_max = self.get_data('sensitivities/ice_cube_hese.txt')
            uplimit = err_max-flux
            uplimit[np.where(err_max-flux == 0)] = 1
            uplimit[np.where(err_max-flux != 0)] = 0

            self.ax.errorbar(energy, flux*3,
                             yerr=np.asarray([flux-err_min, err_max-flux])*3, uplims=uplimit,
                             color='dodgerblue', marker='o', ecolor='dodgerblue', linestyle='None')

        elif name=='ice_cube_hese_fit':
            ice_cube_hese_range = self._get_i3_hese_range()
            energy = ice_cube_hese_range[0] / self.e_unit
            band_min = ice_cube_hese_range[1] * energy**self.e_power / self.f_unit
            band_max = ice_cube_hese_range[2] * energy**self.e_power / self.f_unit
            self.ax.fill_between(energy, band_min, band_max,
                                 hatch='\\', edgecolor='dodgerblue', facecolor='azure')
            flux = self._i3_nu_fit(ice_cube_hese_range[0], offset=2.46, slope=-2.92) * energy**self.e_power / self.f_unit
            self.ax.plot(energy, flux,
                         color='dodgerblue')

        elif name=='ice_cube_mu_fit':
            ice_cube_mu_range = self._get_i3_mu_range()
            energy = ice_cube_mu_range[0] / self.e_unit
            band_min = ice_cube_mu_range[1] * energy**self.e_power / self.f_unit
            band_max = ice_cube_mu_range[2] * energy**self.e_power / self.f_unit
            self.ax.fill_between(energy, band_min, band_max,
                                 edgecolor='dodgerblue', facecolor='azure')
            flux = self._i3_nu_fit(ice_cube_mu_range[0], offset=1.01, slope=-2.19) * energy**self.e_power / self.f_unit
            self.ax.plot(energy, flux,
                         color='dodgerblue')

        elif name=='anita':
            energy, flux, _, _ = self.get_data('sensitivities/anita_iv.txt')
            self.ax.plot(energy, flux,
                         color='darkorange')
            if self.e_power==2:
                self.ax.annotate('ANITA I - IV',
                                 xy=(2e9, 5e-6*self.e_bins), xycoords='data',
                                 horizontalalignment='left', color='darkorange')
            if self.e_power==1:
                self.ax.annotate('ANITA I - IV',
                                 xy=(3e9, 1e-15*self.e_bins), xycoords='data',
                                 horizontalalignment='left', color='darkorange')

        elif name=='auger':
            energy, flux, _, _ = self.get_data('sensitivities/auger2019.txt')
            self.ax.plot(energy, flux,
                         color='forestgreen')
            
#             energy, flux, _, _ = self.get_data('sensitivities/IceCube_from_Auger.txt')
#             self.ax.plot(energy, flux, #Need to multiply by 3/2 as sensitivity data is for one neutrino flavor.
#                          color='pink')
            
            if self.e_power==2:
                self.ax.annotate('Auger (14.7yr)',
                                 xy=(1.2e8, 1.1e-7*self.e_bins), xycoords='data',
                                 horizontalalignment='left', color='forestgreen', rotation=-40)
            if self.e_power==1:
                self.ax.annotate('Auger (14.7yr)',
                                 xy=(9.e7,8e-16*self.e_bins), xycoords='data',
                                 horizontalalignment='left', color='forestgreen', rotation=-58)

        elif name=='ara':
            energy, flux, _, _ = self.get_data('sensitivities/ara_2019.txt')
            self.ax.plot(energy, flux,
                         color='#2288AA')
            energy, flux, _, _ = self.get_data('sensitivities/ara_projected.txt')
#             self.ax.plot(energy, flux,
#                          color='#2288AA', linestyle='--')
            if self.e_power==2:
#                 self.ax.annotate('ARA (2x1yr)',
#                                  xy=(3e8, 6e-7*self.e_bins), xycoords='data',
#                                  horizontalalignment='left', color='#2288AA', rotation=-10)
                self.ax.annotate('ARA (2x4yr)',
                                 xy=(3e8, 1.5e-7*self.e_bins), xycoords='data',
                                 horizontalalignment='left', color='#2288AA', rotation=-10)
            if self.e_power==1:
#                 self.ax.annotate('ARA (2x1yr)',
#                                  xy=(3.5e8, 4e-15*self.e_bins), xycoords='data',
#                                  horizontalalignment='left', color='#2288AA', rotation=-50)
                self.ax.annotate('ARA (2x4yr)',
                                 xy=(3.1e8, 9e-16*self.e_bins), xycoords='data',
                                 horizontalalignment='left', color='#2288AA', rotation=-50)
#                 self.ax.annotate('ARA 2023 (SES)',
#                                  xy=(5e7, 2e-16*self.e_bins), xycoords='data',
#                                  horizontalalignment='left', color='black', rotation=-47)

        elif name=='arianna':
            energy, flux, _, _ = self.get_data('sensitivities/arianna_2019.txt')
            self.ax.plot(energy, flux,
                         color='firebrick')
            if self.e_power==2:
                self.ax.annotate('ARIANNA',
                                 xy=(1.2e8, 1.1e-7*self.e_bins), xycoords='data',
                                 horizontalalignment='left', color='forestgreen', rotation=-40)
            if self.e_power==1:
                self.ax.annotate('ARIANNA (4.5yr)',
                                 xy=(5e9, 4.3e-16*self.e_bins), xycoords='data',
                                 horizontalalignment='left', color='firebrick', rotation=-28)
    
        else:
            raise ValueError("Unrecognized data set '"+str(name)+"'")


    def build_base_plot(self, group='clean', experiments=None, models=None):
        if group=='all':
            if experiments is None:
                experiments = ['grand_10k', 'grand_200k', 'radar', 'anita', 'auger', 'ara',
                               'ice_cube_ehe', 'ice_cube_hese_data', 'ice_cube_hese_fit', 'ice_cube_mu_fit']
            if models is None:
                models = ['heinze', 'ahlers', 'kotera', 'van_vliet']
        elif group=='clean':
            if experiments is None:
                experiments = ['grand_10k', 'anita', 'auger', 'ara',
                               'ice_cube_ehe', 'ice_cube_hese_data', 'ice_cube_mu_fit']
            if models is None:
                models = ['kotera', 'ahlers']
        elif group=='ice_cube':
            if experiments is None:
                experiments = ['ice_cube_ehe', 'ice_cube_hese_data', 'ice_cube_hese_fit', 'ice_cube_mu_fit']
            if models is None:
                models = []
        elif group=='ming':
            if experiments is None:
                experiments = ['ice_cube_ehe', 'ice_cube_hese_data', 'ice_cube_mu_fit', 'ara', 'anita', 'auger']
            if models is None:
                models = ['ahlers', 'kotera']
        elif group=='rno':
            if experiments is None:
                experiments = ['grand_10k', 'anita', 'auger', 'ara',
                               'ice_cube_ehe', 'ice_cube_hese_data', 'ice_cube_mu_fit']
            if models is None:
                models = ['heinze', 'ahlers']
        elif group=='ara':
            if experiments is None:
                experiments = ['anita', 'auger', 'ara',
                               'ice_cube_ehe', 'ice_cube_hese_data', 'ice_cube_mu_fit', 'arianna']
            if models is None:
                models = ['kotera', 'ahlers']
        elif group=='ara_src':
            if experiments is None:
                experiments = ['anita', 'auger', 'ara',
                               'ice_cube_ehe', 'ice_cube_hese_data', 'ice_cube_mu_fit']
            if models is None:
                models = ['fang_pulsar', 'murase_agn', 'murase_grb', 'fang_cluster']
        elif group=='test':
            if experiments is None:
                experiments = ['grand_10k', 'anita', 'auger', 'ara',
                               'ice_cube_ehe', 'ice_cube_hese_data', 'ice_cube_mu_fit']
            if models is None:
                models = ['biehl', 'boncioli', 'fang_merger', 'fang_pulsar', 'fang_cluster'] 
        else:
            if experiments is None:
                experiments = []
            if models is None:
                models = []
        for name in models:
            self.add_model(name)
        for name in experiments:
            self.add_experiment(name)


    def add_limit(self, name, energies, veffs, stations=1, years=1, color=None, linestyle=None, label=None):
        limits = calculate_flux(energies, veffs, stations, years)
        limits *= energies**self.e_power # convert to GeV m^-2 s^-1 sr^-1 (if this is an E^2 plot)
        limits *= 1e-4 # convert to GeV cm^-2 s^-1 sr^-1

        # Scale by energy bin size
        log_energy = np.log10(energies)
        d_log_energy = np.diff(log_energy)
        bins_per_decade = 1/d_log_energy[0]
        limits *= self.e_bins / bins_per_decade

        if label is None:
            label = "{2}: {0} stations, {1} years".format(stations, years, name)

        # Plot limit
        _plt, = self.ax.plot(energies / self.e_unit,
                             limits / self.f_unit,
                             color=color, linestyle=linestyle,
                             label=label,
                             linewidth=3,
                             zorder=100+len(self.custom_limits))
        self.custom_limits.append(_plt)


    def title(self, title, size=None):
        self.ax.set_title(title)
        if size is None:
            size = self.font_size
        self.ax.title.set_fontsize(size)

    def show(self, legend_size=12, save_name=None, *args, **kwargs):
        if self.e_power==2:
            self.ax.add_artist(plt.legend(handles=self.neutrino_models, loc=4, fontsize=legend_size))
            self.ax.add_artist(plt.legend(handles=self.custom_limits, loc=2, fontsize=legend_size))
        elif self.e_power==1:
            joined = self.neutrino_models+self.custom_limits
            self.ax.add_artist(plt.legend(handles=joined, loc=3,fontsize=legend_size))
#             self.ax.add_artist(plt.legend(handles=self.custom_limits, loc=1, fontsize=legend_size))
        plt.tight_layout()
        if save_name is not None:
            plt.savefig(save_name, *args, **kwargs)
        plt.show()



def calculate_flux(energies, veffs, stations=1, years=1):
    """Calculate flux (m^-2 s^-1 sr^-1 GeV^-1) for energies in GeV and veffs in km3sr and livetime in years"""
    energies = np.asarray(energies)
    veffs = np.asarray(veffs)

    # Get number of energy bins per decade
    log_energy = np.log10(energies)
    d_log_energy = np.diff(log_energy)
    for d_log in d_log_energy:
        if not np.isclose(d_log, d_log_energy[0]):
            raise ValueError("Energies should be evenly spaced in log-10-space")
    bins_per_decade = 1/d_log_energy[0]

    # Get average interaction lengths (harmonic mean, since average should be in cross section)
    int_len = np.zeros(len(energies))
    for i, e in enumerate(energies):
        nu = pyrex.Particle('nu_e', (0, 0, 0), (0, 0, -1), e)
        nubar = pyrex.Particle('nu_e_bar', (0, 0, 0), (0, 0, -1), e)
        avg_int = 2/((1/nu.interaction.total_interaction_length)+(1/nubar.interaction.total_interaction_length))
        int_len[i] = avg_int # cmwe

    # Get effective area
    ice_density = 0.92 # g/cm^3
    ice_density *= 1e15 # convert to g/km^3 = nucleons/km^3
    aeffs = veffs * ice_density / int_len # cm^2 sr
    aeffs *= 1e-4 # convert to m^2 sr

    aeff_tots = aeffs * stations * (years * 365.25 * 24 * 60 * 60)

    # Upper limit on events
    # 2.3 for Neyman UL w/ 0 background,
    # 2.44 for F-C UL w/ 0 background, etc
    upper_limit = 2.44

    return upper_limit / aeff_tots * bins_per_decade / np.log(10) / energies


def count_neutrinos(flux, energies, veffs, stations=1, years=1):
    """Count the number of neutrinos observed for a given flux at each energy"""
    log_energy = np.log10(energies)
    step = np.diff(log_energy)[0]
    mean_fluxes = np.zeros(len(energies))
    for i, (e, log_e) in enumerate(zip(energies, log_energy)):
        e_range = np.logspace(log_e-step/2, log_e+step/2, 101)
        log_e_range = np.linspace(log_e-step/2, log_e+step/2, 101)
        mean_fluxes[i] = np.trapz(flux(e_range), x=log_e_range) / step
    return mean_fluxes / calculate_flux(energies, veffs, stations, years) * 2.44
#     return flux(energies) / calculate_flux(energies, veffs, stations, years) * 2.44




# ARA data

data_ara_200 = {
    "pyrex": {
        "energy": 10**np.array([16.0, 16.5, 17.0, 17.5, 18.0, 18.5, 19.0, 19.5, 20.0]) / 1e9,
        "veff": np.array([7.753e-03, 6.872e-02, 4.235339e-01, 1.646e+00, 5.110e+00,
                          1.106e+01, 2.053e+01, 34.070, 51.321])
    },
    "arasim": {
        "energy": 10**np.array([16.5, 17.0, 17.5, 18.0, 18.5, 19.0, 19.5, 20.0]) / 1e9,
        "veff": np.array([1.105E-1, 5.195E-1, 1.826E+0, 5.259E+0,
                          1.106E+1, 2.077E+1, 3.431E+1, 5.073E+1])
    }
}

data_ara_200pa = {
    "pyrex": {
        "energy": 10**np.array([16.0, 16.5, 17.0, 17.5, 18.0, 18.5, 19.0, 19.5, 20.0]) / 1e9,
        "veff": np.array([8.955E-2/1.853935, 5.910E-1/1.426338, 2.175E+0/1.231167, 6.272E+0/1.088942,
                          1.495E+1/1.103670, 2.872E+1, 5.680E+1, 1.377E+2, 2.294E+2])
    },
    "arasim": {
        "energy": 10**np.array([16.5, 17.0, 17.5, 18.0, 18.5, 19.0, 19.5, 20.0]) / 1e9,
        "veff": np.array([2.618E-1, 1.003E+0, 3.096E+0, 7.406E+0,
                          1.466E+1, 2.578E+1, 4.039E+1, 5.073E+1])
    }
}

data_ara_100 = {
    "pyrex": {
        "energy": 10**np.array([16.0, 16.5, 17.0, 17.5, 18.0, 18.5, 19.0, 19.5, 20.0]) / 1e9,
        "veff": np.array([2.480E-2, 1.990E-1, 8.686E-1, 2.798E+0, 6.346E+0,
                          1.206E+1, 2.301E+1, 5.336E+1, 1.016E+2])
    },
    "arasim": {
        "energy": 10**np.array([16.5, 17.0, 17.5, 18.0, 18.5, 19.0, 19.5, 20.0]) / 1e9,
        "veff": np.array([8.818E-2/1.853935, 4.006E-1/1.426338, 1.381E+0/1.231167, 3.143E+0/1.088942,
                          6.155E+0/1.103670, 1.045E+1, 1.565E+1, 2.248E+1])
    }
}


# 1.5 sigma PA RNO data

data_60m = {
    "pyrex": {
        "energy": 10**np.array([15.5, 16.0, 16.5, 17.0, 17.5, 18.0, 18.5, 19.0, 19.5, 20.0]) / 1e9,
        "veff": np.array([8.031E-3, 6.989E-2, 3.711E-1, 1.290E+0, 3.250E+0,
                          7.013E+0, 1.249E+1, 2.290E+1, 4.273E+1, 6.479E+1])
    },
    "nuradiomc": {
        "energy": 10**np.array([16.0, 16.5, 17.0, 17.5, 18.0, 18.5, 19.0, 19.5]) / 1e9,
        "veff": np.array([27257318.17625904, 240894146.38634944, 1171484843.5128613,
                          4087321232.053297, 9629773573.429602, 17038490756.169498,
                          25843649903.426907, 37673542872.434845]) / 1e9
    },
    "arasim": {
        "energy": 10**np.array([16.5, 17.0, 17.5, 18.0, 18.5, 19.0, 19.5, 20.0]) / 1e9,
        "veff": np.array([1.330E-1, 4.790E-1, 1.324E+0, 2.997E+0,
                          5.563E+0, 9.094E+0, 1.276E+1, 1.713E+1])
    }
}

data_100m = {
    "pyrex": {
        "energy": 10**np.array([15.5, 16.0, 16.5, 17.0, 17.5, 18.0, 18.5, 19.0, 19.5, 20.0]) / 1e9,
        "veff": np.array([9.033E-3, 6.816E-2, 5.060E-1, 1.717E+0, 4.931E+0,
                          1.056E+1, 1.971E+1, 3.530E+1, 6.863E+1, 1.083E+2])
    },
    "arasim": {
        "energy": 10**np.array([16.5, 17.0, 17.5, 18.0, 18.5, 19.0, 19.5, 20.0]) / 1e9,
        "veff": np.array([1.453E-1, 5.370E-1, 1.665E+0, 4.151E+0,
                          8.062E+0, 1.303E+1, 1.960E+1, 2.758E+1])
    }
}



def get_mean_veffs(energies, simulation_data):
    veffs = np.zeros_like(energies)
    for i, energy in enumerate(energies):
        veff = 1
        n_matches = 0
        for key, val in simulation_data.items():
            match = val['veff'][val['energy']==energy]
            if len(match)==1:
                veff *= match[0]
                n_matches += 1
        if n_matches>0:
            veffs[i] = veff**(1/n_matches)
    return veffs


# Averaging AraSim and PyRex ARA data

ara_energies = 10**np.array([16.5, 17.0, 17.5, 18.0, 18.5, 19.0, 19.5, 20.0]) / 1e9
ara_200m = get_mean_veffs(ara_energies, data_ara_200)
ara_200mpa = get_mean_veffs(ara_energies, data_ara_200pa)
ara_100m = get_mean_veffs(ara_energies, data_ara_100)

ara_available = ((851+365)*ara_100m + (3351+365*(2+7/12+10/12))*ara_200m + (306*(1+10/12))*ara_200mpa)/365.25
ara_yearly = ara_100m + 3*ara_200m + ara_200mpa
ara_projected = ara_available + 3*ara_yearly
