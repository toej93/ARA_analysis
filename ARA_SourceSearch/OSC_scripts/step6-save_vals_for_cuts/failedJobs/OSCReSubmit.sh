#!/bin/bash

#SBATCH --job-name=run_saveVals_failed
#SBATCH --account=PAS0654
#SBATCH --nodes=1 --ntasks-per-node=18
#SBATCH --mail-type=FAIL
#SBATCH --time=03:10:00
#SBATCH --output=./logs/failed.log

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'

cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_save_vals 0 2 1 225 1 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ValsForCuts/A2/c1 0 1 0.0 0.0 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/Joined/A2/by_config/c1/processed_station_2_run_2428_joined_bins_6_19.root &
./v2_save_vals 0 2 1 225 1 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ValsForCuts/A2/c1 0 1 0.0 0.0 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/Joined/A2/by_config/c1/processed_station_2_run_2389_joined_bins_6_19.root &
./v2_save_vals 0 2 1 225 1 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ValsForCuts/A2/c1 0 1 0.0 0.0 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/Joined/A2/by_config/c1/processed_station_2_run_2373_joined_bins_6_19.root &
./v2_save_vals 0 2 1 225 1 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ValsForCuts/A2/c1 0 1 0.0 0.0 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/Joined/A2/by_config/c1/processed_station_2_run_2331_joined_bins_6_19.root &
./v2_save_vals 0 2 1 225 1 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ValsForCuts/A2/c1 0 1 0.0 0.0 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/Joined/A2/by_config/c1/processed_station_2_run_2443_joined_bins_6_19.root &
./v2_save_vals 0 2 1 225 1 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ValsForCuts/A2/c1 0 1 0.0 0.0 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/Joined/A2/by_config/c1/processed_station_2_run_2459_joined_bins_6_19.root &
./v2_save_vals 0 2 1 225 1 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ValsForCuts/A2/c1 0 1 0.0 0.0 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/Joined/A2/by_config/c1/processed_station_2_run_2729_joined_bins_6_19.root &
./v2_save_vals 0 2 1 225 1 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ValsForCuts/A2/c1 0 1 0.0 0.0 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/Joined/A2/by_config/c1/processed_station_2_run_2789_joined_bins_6_19.root &
./v2_save_vals 0 2 1 225 1 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ValsForCuts/A2/c1 0 1 0.0 0.0 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/Joined/A2/by_config/c1/processed_station_2_run_2536_joined_bins_6_19.root &
./v2_save_vals 0 2 1 225 1 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ValsForCuts/A2/c1 0 1 0.0 0.0 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/Joined/A2/by_config/c1/processed_station_2_run_2616_joined_bins_6_19.root &
./v2_save_vals 0 2 1 225 1 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ValsForCuts/A2/c1 0 1 0.0 0.0 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/Joined/A2/by_config/c1/processed_station_2_run_3276_joined_bins_6_19.root &
./v2_save_vals 0 2 1 225 1 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ValsForCuts/A2/c1 0 1 0.0 0.0 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/Joined/A2/by_config/c1/processed_station_2_run_3352_joined_bins_6_19.root &
./v2_save_vals 0 2 1 225 1 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ValsForCuts/A2/c1 0 1 0.0 0.0 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/Joined/A2/by_config/c1/processed_station_2_run_3442_joined_bins_6_19.root &
./v2_save_vals 0 2 1 225 1 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ValsForCuts/A2/c1 0 1 0.0 0.0 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/Joined/A2/by_config/c1/processed_station_2_run_2889_joined_bins_6_19.root &
./v2_save_vals 0 2 1 225 1 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ValsForCuts/A2/c1 0 1 0.0 0.0 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/Joined/A2/by_config/c1/processed_station_2_run_2893_joined_bins_6_19.root &
./v2_save_vals 0 2 1 225 1 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ValsForCuts/A2/c1 0 1 0.0 0.0 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/Joined/A2/by_config/c1/processed_station_2_run_2895_joined_bins_6_19.root &

wait
