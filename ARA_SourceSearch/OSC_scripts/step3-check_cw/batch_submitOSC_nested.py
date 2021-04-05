import os
import csv, subprocess

cores = 6 #Number of cores needed
project = "PAS0654" #"PCON0003"
# project = "PCON0003" #what project to use
station = 2
year = 2013
print("Year: %i"%year)
isSim = 0 #data (0) or simulation (1)
anaFolder = os.path.expanduser('/users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/ARA_analysis/ARA_SourceSearch/') #Where are the files with the run lists
step1_makePairs = anaFolder + "OSC_scripts/step1-make_ped_pairs/"
outputDir = "/fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/CWID/A%i/%i"%(station, year)
summaryDir = "/fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/RunSummary/A%i/%i"%(station, year)
file = step1_makePairs+"A%i_%i_File_Ped_Pairs.txt"%(station,year)

count = 0
with open(file, mode='r', newline='', encoding='utf-8-sig') as csvfile:
    reader = csv.reader(csvfile)
    count_core = 0
    for job in reader:
        if(count_core==0):
            f = open("/users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/ARA_analysis/ARA_SourceSearch/OSC_scripts/step3-check_cw/tmpScipts/A%i_%i_tmpSubmit_%i.sh"%(station, year, count), "w+")
            f.write("#!/bin/bash\n\n")
            f.write("#SBATCH --mail-type=FAIL\n")
            f.write("#SBATCH --time=06:10:00\n\n")
            f.write("eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'\n")
            f.write("cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/\n\n")
        dataFile = job[0]
        pedestal = job[1]
        f.write("./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} %s %s &\n"%(dataFile,pedestal))
        count_core+=1

        if(count_core==cores):
            f.write("wait\n")
            f.close()
            count_core = 0
            
            split = os.path.split(job[0])
            run = os.path.splitext(split[1])[0].strip("event")
            submit_command = ("sbatch "
                        "--job-name=CWID_{9}_{7} --nodes=1 --ntasks-per-node={8} --output=./logs/{7}_CWID_{9}.out --account={6} "
                        "--export=ISSIM={1},STATION={2},OUTDIR={5},YEAR={7},SUMMARYDIR={3} tmpScipts/A{2}_{7}_tmpSubmit_{9}.sh").format(run,isSim,station,summaryDir,job[1],outputDir, project, year, cores+1, count)#Add additional core for memory
            exit_status = subprocess.call(submit_command, shell=True)
            if exit_status is 1:  # Check to make sure the job submitted
                print("Job {0} failed to submit".format(submit_command))
            count+=1
            # break

if(count_core<cores):
    f.write("wait\n")
    f.close()

    split = os.path.split(job[0])
    run = os.path.splitext(split[1])[0].strip("event")
    submit_command = ("sbatch "
                "--job-name=CWID_{9}_{7} --nodes=1 --ntasks-per-node={8} --output=./logs/{7}_CWID_{9}.out --account={6} "
                "--export=ISSIM={1},STATION={2},OUTDIR={5},YEAR={7},SUMMARYDIR={3} tmpScipts/A{2}_{7}_tmpSubmit_{9}.sh").format(run,isSim,station,summaryDir,job[1],outputDir, project, year, cores+1, count)#Add additional core for memory
    exit_status = subprocess.call(submit_command, shell=True)
    if exit_status is 1:  # Check to make sure the job submitted
        print("Job {0} failed to submit".format(submit_command))
