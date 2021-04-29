import os
import csv, subprocess

# project = "PAS0654" #"PCON0003"
project = "PCON0003"
station = 2
year = 2014
isSim = 0
anaFolder = os.path.expanduser('/users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/ARA_analysis/ARA_SourceSearch/')

for year in range(2013,2017):
    step1_makePairs = anaFolder + "OSC_scripts/step1-make_ped_pairs/"
    outputDir = "/fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/RunSummary/A%i/%i"%(station, year)
    file = step1_makePairs+"A%i_%i_File_Ped_Pairs.txt"%(station,year)
    f = open("/users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/ARA_analysis/ARA_SourceSearch/OSC_scripts/step2-make_run_summary/allRuns_A%i_%i.txt"%(station,year), "w+")
    with open(file, mode='r', newline='', encoding='utf-8-sig') as csvfile:
        reader = csv.reader(csvfile)
        for job in reader:
            split = os.path.split(job[0])
            run = os.path.splitext(split[1])[0].strip("event")
            dataFile = job[0]
            # else:
            #     dataFile =
            submit_command = ("sbatch "
                        "--job-name=makeSummary_{0}_{7} --output=./logs/{7}_makeSummary_{0}.out --account={6} "
                        "--export=ISSIM={1},STATION={2},DATA={3},PEDESTAL={4},OUTDIR={5} runOSC.sh").format(run,isSim,station,dataFile,job[1],outputDir, project, year)
            # print("Submitted run%s"%run)
            f.write(submit_command)
            f.write("\n\n")
            # exit_status = subprocess.call(submit_command, shell=True)
            # if exit_status is 1:  # Check to make sure the job submitted
            #     print("Job {0} failed to submit".format(submit_command))
            # break
    f.close()
