import os
import csv, subprocess

station = 2
config = 1
pol = 1

for energy in range(560,610,5):
    inDir = "/fs/project/PAS0654/ARA_DATA/A23/sim_SourceSearch/A2/ProcessedFile/E%i"%energy
    outDir = "/fs/project/PAS0654/ARA_DATA/A23/sim_SourceSearch/A2/Joined/E%i"%energy

    submit_command = ("sbatch "
    "--job-name=reco_A{0}_E{1} --output=./logs/join_A{0}_E{1}.out "
    "--export=STATION={0},ENERGY={1},OUTDIR={2},INDIR={3} submit_join_monoE.sh").format(station,energy,outDir,inDir)
    # print(submit_command)
    exit_status = subprocess.call(submit_command, shell=True)
    if exit_status is 1:  # Check to make sure the job submitted
        print("Job {0} failed to submit".format(submit_command))
        print("Job {0} failed to submit".format(submit_command))
