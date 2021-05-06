import os
import csv, subprocess

station = 2
config = 1
pol = 1
energy = 255
# file = "/fs/project/PAS0654/ARA_DATA/A23/10pct_redo/ValsForCuts/A2/c1/cutvals_drop_FiltSurface_snrbins_0_0_wfrmsvals_-1.3_-1.4_run_*.root"
# file = "/fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ValsForCuts/A2/c2/cutvals_drop_FiltSurface_CWThresh2.0_snrbins_0_1_wfrmsvals_0.0_0.0_run_*"
outDir = "/users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/ARA_analysis/ARA_SourceSearch/results/gridSearch/A2/all/"
# slope = -2000
for pol in range(0,2):
    for slope in range(-2500,-500,10):
        submit_command = ("sbatch "
        "--job-name=gridScan_A{1}_c{2}_pol{5}_slope_{4} --nodes=1 --ntasks-per-node=1 --output=./logs/gridScan_A{1}_c{2}_pol{5}_slope_{4}.out --account=PAS0654 "
        "--export=,STATION={1},CONFIG={2},ENERGY={3},SLOPE={4},POL={5},OUTDIR={6} runOSC.sh").format(0,station,config,energy,slope,pol,outDir)
        # print(submit_command)
        exit_status = subprocess.call(submit_command, shell=True)
        if exit_status is 1:  # Check to make sure the job submitted
            print("Job {0} failed to submit".format(submit_command))
