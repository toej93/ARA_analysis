#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=05:05:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_save_vals ${ISSIM} ${STATION} ${CONFIG} 225 1 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ValsForCuts/A2/c1 0 1 0.0 0.0 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/Joined/A2/by_config/c1/processed_station_2_run_3145_joined_bins_6_19.root &
./v2_save_vals ${ISSIM} ${STATION} ${CONFIG} 225 1 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ValsForCuts/A2/c1 0 1 0.0 0.0 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/Joined/A2/by_config/c1/processed_station_2_run_3146_joined_bins_6_19.root &
./v2_save_vals ${ISSIM} ${STATION} ${CONFIG} 225 1 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ValsForCuts/A2/c1 0 1 0.0 0.0 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/Joined/A2/by_config/c1/processed_station_2_run_3147_joined_bins_6_19.root &
./v2_save_vals ${ISSIM} ${STATION} ${CONFIG} 225 1 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ValsForCuts/A2/c1 0 1 0.0 0.0 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/Joined/A2/by_config/c1/processed_station_2_run_3148_joined_bins_6_19.root &
./v2_save_vals ${ISSIM} ${STATION} ${CONFIG} 225 1 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ValsForCuts/A2/c1 0 1 0.0 0.0 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/Joined/A2/by_config/c1/processed_station_2_run_3149_joined_bins_6_19.root &
./v2_save_vals ${ISSIM} ${STATION} ${CONFIG} 225 1 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ValsForCuts/A2/c1 0 1 0.0 0.0 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/Joined/A2/by_config/c1/processed_station_2_run_3150_joined_bins_6_19.root &
wait
date