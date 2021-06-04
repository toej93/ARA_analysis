import os
import csv, subprocess

depth = 3000
radius = [3000,3500,4000,4750,5500,6250,7000,8000,9000,10500]#https://github.com/ara-software/a23_4yr_diffuse_simcon
for energy, radBin in zip(range(560,610,5),range(len(radius))):
    simDir = "/fs/scratch/PAS0654/jorge/sim_results/CenAMono/E%i"%energy
    submit_command = ("sbatch "
    "--job-name=veff_CenA_E{0} --output=./logs/veff_CenA_E{0}.log "
    "--export=,ENERGY={0},DEPTH={1},POSNURAD={2},SIMDIR={3} runVeff.sh").format(energy,depth,radius[radBin],simDir)
    # print(submit_command)
    exit_status = subprocess.call(submit_command, shell=True)
    if exit_status is 1:  # Check to make sure the job submitted
        print("Job {0} failed to submit".format(submit_command))
