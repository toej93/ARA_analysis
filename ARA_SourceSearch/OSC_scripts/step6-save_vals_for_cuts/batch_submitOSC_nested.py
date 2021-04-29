import os
import csv, subprocess

cores = 6 #Number of cores needed
project = "PAS0654" #"PCON0003"
# project = "PCON0003" #what project to use
station = 2
V_SNR_BIN = 0
H_SNR_BIN = 1
V_WFRMS_CUT = 0
H_WFRMS_CUT = 0
for config in range(2,6):
    print("config: %i"%config)
    # print("Radius: %i"%radius)
    isSim = 0 #data (0) or simulation (1)
    outputDir = "/fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ValsForCuts/A%i/c%i"%(station, config)
    joinedDir = "/fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/Joined/A%i/by_config/c%i/"%(station, config)
    # file = step1_makePairs+"A%i_%i_File_Ped_Pairs.txt"%(station,year)
    file = "runsInConfig/runs_c%i.csv"%config
    count = 0
    with open(file, mode='r', newline='', encoding='utf-8-sig') as csvfile:
        reader = csv.reader(csvfile)
        next(reader)#Skip header
        count_core = 0
        for line in reader:
            run = int(line[0])
            joinedFileName = joinedDir + "processed_station_2_run_%i_joined_bins_6_19.root"%run
            if(count_core==0):

                # print(run)
                f = open("/users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/ARA_analysis/ARA_SourceSearch/OSC_scripts/step6-save_vals_for_cuts/tmpScipts/A%i_c%i_tmpSubmit_%i.sh"%(station, config, count), "w+")
                f.write("#!/bin/bash\n\n")
                f.write("#SBATCH --mail-type=FAIL\n")
                f.write("#SBATCH --time=02:05:00\n\n")
                f.write("eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'\n")
                f.write("cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/\n\n")

            f.write("./v2_save_vals ${ISSIM} ${STATION} ${CONFIG} 225 1 %s %i %i %0.1f %0.1f %s &\n"%(outputDir, V_SNR_BIN, H_SNR_BIN, V_WFRMS_CUT, H_WFRMS_CUT, joinedFileName))
            count_core+=1

            if(count_core==cores):
                f.write("wait\n")
                f.write("date\n")
                f.close()
                count_core = 0
                                
                submit_command = ("sbatch "
                            "--job-name=saveVals_c{3}_{6} --nodes=1 --ntasks-per-node={5} --output=./logs/c{3}_saveVals_{6}.out --account={4} "
                            "--export=ISSIM={1},STATION={2},CONFIG={3} tmpScipts/A{2}_c{3}_tmpSubmit_{6}.sh").format(run,isSim,station,config,project, cores+1, count)#Add additional core for memory
                # print(submit_command)
                exit_status = subprocess.call(submit_command, shell=True)
                if exit_status is 1:  # Check to make sure the job submitted
                    print("Job {0} failed to submit".format(submit_command))
                count+=1
                # break
    
    if(count_core<cores):
        try:
            f.write("wait\n")
            f.write("date\n")
            f.close()
        
            # split = os.path.split(job[0])
            # run = os.path.splitext(split[1])[0].strip("event")
            submit_command = ("sbatch "
                        "--job-name=saveVals_c{3}_{6} --nodes=1 --ntasks-per-node={5} --output=./logs/c{3}_saveVals_{6}.out --account={4} "
                        "--export=ISSIM={1},STATION={2},CONFIG={3} tmpScipts/A{2}_c{3}_tmpSubmit_{6}.sh").format(run,isSim,station,config,project, cores+1, count)#Add additional core for memory
            exit_status = subprocess.call(submit_command, shell=True)
            if exit_status is 1:  # Check to make sure the job submitted
                print("Job {0} failed to submit".format(submit_command))
        except:
            continue
