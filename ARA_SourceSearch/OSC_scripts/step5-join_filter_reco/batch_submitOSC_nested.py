import os
import csv, subprocess

cores = 6 #Number of cores needed
project = "PAS0654" #"PCON0003"
# project = "PCON0003" #what project to use
station = 2
# year = 2015
# radius = 6
# radius = 19
for year in range(2015,2016):
    print("Year: %i"%year)
    # print("Radius: %i"%radius)
    isSim = 0 #data (0) or simulation (1)
    anaFolder = os.path.expanduser('/users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/ARA_analysis/ARA_SourceSearch/') #Where are the files with the run lists
    step1_makePairs = anaFolder + "OSC_scripts/step1-make_ped_pairs/"
    # outputDir = "/fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A%i/%i"%(station, year)
    summaryDir = "/fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/RunSummary/A%i/%i"%(station, year)
    filterDir = "/fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A%i/%i"%(station, year)
    joinedDir = "/fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/Joined/A%i/%i"%(station, year)
    file = step1_makePairs+"A%i_%i_File_Ped_Pairs.txt"%(station,year)

    count = 0
    with open(file, mode='r', newline='', encoding='utf-8-sig') as csvfile:
        reader = csv.reader(csvfile)
        count_core = 0
        for job in reader:
            split = os.path.split(job[0])
            run = os.path.splitext(split[1])[0].lstrip("event00")
            # print(run)
            filterFile = filterDir + "processed_station_%i_run_%i_filter.root"%(station,int(run))
            if(count_core==0):

                # print(run)
                f = open("/users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/ARA_analysis/ARA_SourceSearch/OSC_scripts/step5-join_filter_reco/tmpScipts/A%i_%i_tmpSubmit_%i.sh"%(station, year, count), "w+")
                f.write("#!/bin/bash\n\n")
                f.write("#SBATCH --mail-type=FAIL\n")
                f.write("#SBATCH --time=00:05:00\n\n")
                f.write("eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'\n")
                f.write("cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/\n\n")
            dataFile = job[0]
            pedestal = job[1]
            f.write("./v2_analysis_join_filter_41_300 ${STATION} ${OUTDIR} %s %s &\n"%(filterDir, filterFile))
            count_core+=1

            if(count_core==cores):
                f.write("wait\n")
                f.close()
                count_core = 0
                                
                submit_command = ("sbatch "
                            "--job-name=join_{9}_{7} --nodes=1 --ntasks-per-node={8} --output=./logs/{7}_join_{9}.out --account={6} "
                            "--export=ISSIM={1},STATION={2},OUTDIR={5},YEAR={7},FILTERDIR={3} tmpScipts/A{2}_{7}_tmpSubmit_{9}.sh").format(run,isSim,station,filterDir,job[1],joinedDir, project, year, cores+1, count, 0)#Add additional core for memory
                # print(submit_command)
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
                    "--job-name=join_{9}_{7} --nodes=1 --ntasks-per-node={8} --output=./logs/{7}_join_{9}.out --account={6} "
                    "--export=ISSIM={1},STATION={2},OUTDIR={5},YEAR={7},FILTERDIR={3} tmpScipts/A{2}_{7}_tmpSubmit_{9}.sh").format(run,isSim,station,filterDir,job[1],joinedDir, project, year, cores+1, count, 0)#Add additional core for memory
        exit_status = subprocess.call(submit_command, shell=True)
        if exit_status is 1:  # Check to make sure the job submitted
            print("Job {0} failed to submit".format(submit_command))
