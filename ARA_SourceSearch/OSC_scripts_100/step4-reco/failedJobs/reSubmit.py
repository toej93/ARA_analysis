from pathlib import Path
import os
import csv, subprocess
import sys

# failedRuns = []
# path = str(sys.argv[1])
# pathlist = Path(path).glob('**/*.out')
# for path in pathlist:
#      # because path is object not string
#     path_in_str = str(path)
#     with open(path_in_str, 'r') as f:
#         for line in f.readlines():
#             if 'core dumped' in line:
#                 toParse = line
#                 splitLine = toParse.split()
#                 runline = splitLine[len(splitLine)-2]
#                 runline=runline.strip("/fs/scratch/PAS0654/jorge/ARA_data/")
#                 failedRun = runline.partition("event00")[2].strip(".")
# #                 print(failedRun)
#                 failedRuns.append(failedRun)
# print("%i failed runs"%len(failedRuns))
# failedRuns.sort()
# print(failedRuns)
failedRuns = [1500,1501,1503,1504,1505,1506]
# project = "PCON0003" #what project to use
project = "PAS0654" #what project to use

station = 2
year = 2013
print("Year: %i"%year)
isSim = 0 #data (0) or simulation (1)
anaFolder = os.path.expanduser('/users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/ARA_analysis/ARA_SourceSearch/') #Where are the files with the run lists
step1_makePairs = anaFolder + "OSC_scripts/step1-make_ped_pairs/"
outputDir = "/fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A%i/%i"%(station, year)
summaryDir = "/fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/RunSummary/A%i/%i"%(station, year)
filterDir = "/fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A%i/%i"%(station, year)

file = step1_makePairs+"A%i_%i_File_Ped_Pairs.txt"%(station,year)
print(failedRuns)
with open(file, mode='r', newline='', encoding='utf-8-sig') as csvfile:
    reader = csv.reader(csvfile)

    count_core = 0
    for job in reader:
        split = os.path.split(job[0])
        run = os.path.splitext(split[1])[0].lstrip("event00")
        # print("%i"%run)

        if(int(run) not in failedRuns):
            continue
        print(run)
        submit_command = ("sbatch "
                            "--job-name=reco_{0}_{7}_redo --output=./logs/{7}_reco_{0}.out --account={6} "
                            "--export=ISSIM={1},STATION={2},OUTDIR={5},YEAR={7},SUMMARYDIR={3},DATA={8},FILTERDIR={9} OSCReSubmit.sh").format(run,isSim,station,summaryDir,job[1],outputDir, project, year, job[0], filterDir, 0)#Add additional core for memory
        # print(submit_command)
        # break
        exit_status = subprocess.call(submit_command, shell=True)
        if exit_status is 1:  # Check to make sure the job submitted
            print("Job {0} failed to submit".format(submit_command))
