import os
import csv, subprocess

# project = "PAS0654" #"PCON0003"
project = "PCON0003"
station = 2
year = 2016
isSim = 0
anaFolder = os.path.expanduser('/users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/ARA_analysis/ARA_SourceSearch/')
cores = 6
for year in range(2016,2017):
    step1_makePairs = anaFolder + "OSC_scripts/step1-make_ped_pairs/"
    outputDir = "/fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/CWID/A%i/%i"%(station, year)
    summaryDir = "/fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/RunSummary/A%i/%i"%(station, year)
    file = step1_makePairs+"A%i_%i_File_Ped_Pairs.txt"%(station,year)
    f = open("/users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/ARA_analysis/ARA_SourceSearch/OSC_scripts/step3-check_cw/allRuns_A%i_%i.txt"%(station,year), "w+")
    with open(file, mode='r', newline='', encoding='utf-8-sig') as csvfile:
        reader = csv.reader(csvfile)
        for job in reader:
            split = os.path.split(job[0])
            run = os.path.splitext(split[1])[0].strip("event")
            dataFile = job[0]
            # else:
            #     dataFile =
            submit_command = ("sbatch "
                        "--job-name=CWID_{9}_{7} --nodes=1 --ntasks-per-node={8} --output=./logs/{7}_CWID_{9}.out --account={6} "
                        "--export=ISSIM={1},STATION={2},OUTDIR={5},YEAR={7},SUMMARYDIR={3} tmpScipts/A{2}_{7}_tmpSubmit_{9}.sh").format(run,isSim,station,summaryDir,job[1],outputDir, project, year, cores+1, count)#Add additional core for memory
            # print("Submitted run%s"%run)
            f.write(submit_command)
            f.write("\n\n")
            # exit_status = subprocess.call(submit_command, shell=True)
            # if exit_status is 1:  # Check to make sure the job submitted
            #     print("Job {0} failed to submit".format(submit_command))
            break
    f.close()
