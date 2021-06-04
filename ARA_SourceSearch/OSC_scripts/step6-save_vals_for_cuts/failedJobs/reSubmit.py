from pathlib import Path
import os
import csv, subprocess
import sys

failedRuns = []
path = "/users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/ARA_analysis/ARA_SourceSearch/OSC_scripts/step6-save_vals_for_cuts/logs/"
pathlist = Path(path).glob('**/*.out')
for path in pathlist:
     # because path is object not string
    path_in_str = str(path)
    with open(path_in_str, 'r') as f:
        for line in f.readlines():
            if 'core dumped' in line:
#                 print(line)
                toParse = line
                splitLine = toParse.split()
                runline = splitLine[len(splitLine)-2]
                print(" ".join(splitLine[8:])+" &")

#                 runline=runline.strip("/var/spool/slurmd/job4063219/slurm_script: line 17: 150015 Bus error               (core dumped) ")
#                 failedRun = runline.partition("processed_station_2_run_")[2].strip(".")
# #                 print(failedRun)
#                 failedRuns.append(failedRun)
# print("%i failed runs"%len(failedRuns))
# failedRuns.sort()
# print(failedRuns)
