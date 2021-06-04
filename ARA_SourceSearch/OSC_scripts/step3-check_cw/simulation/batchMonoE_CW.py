import os
import csv, subprocess

station = 2
config = 1
pol = 1
energy = 560

for energy in range(560,610,5):
    outDir = "/fs/project/PAS0654/ARA_DATA/A23/sim_SourceSearch/A2/CWID/E%i"%energy
    simDir = "/fs/scratch/PAS0654/jorge/sim_results/CenAMono_onlyTrig/E%i"%energy

    submit_command = ("sbatch "
    "--job-name=CW_A{0}_E{1} --output=./logs/CW_A{0}_E{1}.out "
    "--export=,STATION={0},ENERGY={1},OUTDIR={2},SIMDIR={3} submit_CW_sim_monoE.sh").format(station,energy,outDir,simDir)
    # print(submit_command)
    exit_status = subprocess.call(submit_command, shell=True)
    if exit_status is 1:  # Check to make sure the job submitted
        print("Job {0} failed to submit".format(submit_command))
