from limits import LimitFigure, ara_energies, ara_available, ara_projected


if __name__=="__main__":
    figure = LimitFigure(e_power=1, xlims=(1e6, 1e11), ylims=(1e-19, 2e-14), font_size=16, tick_size=14)
    figure.build_base_plot('ara')
    figure.add_limit('ARA', ara_energies, ara_available,
                    stations=2.44, years=1, color='black', linestyle=None,
                    label='Available Data (2012-2019)')
    figure.add_limit('ARA', ara_energies, ara_projected,
                    stations=2.44, years=1, color='black', linestyle='--',
                    label='Projected Data (2012-2022)')
    # figure.title("Trigger Level Sensitivities")
    figure.show(legend_size=10, save_name='e1_sensitivity_plot_ara.pdf')


    figure = LimitFigure(e_power=1, xlims=(1e6, 1e11), ylims=(1e-19, 2e-14), font_size=16, tick_size=14)
    figure.build_base_plot('ara_src')
    figure.add_limit('ARA', ara_energies, ara_available,
                    stations=2.44, years=1, color='black', linestyle=None,
                    label='Available Data (2012-2019)')
    figure.add_limit('ARA', ara_energies, ara_projected,
                    stations=2.44, years=1, color='black', linestyle='--',
                    label='Projected Data (2012-2022)')
    # figure.title("Trigger Level Sensitivities")
    figure.show(legend_size=10, save_name='e1_source_plot_ara.pdf')