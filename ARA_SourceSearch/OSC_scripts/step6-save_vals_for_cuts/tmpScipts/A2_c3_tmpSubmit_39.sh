#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:05:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_save_vals ${ISSIM} ${STATION} ${CONFIG} 225 1 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ValsForCuts/A2/c3 0 1 0.0 0.0 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/Joined/A2/by_config/c3/processed_station_2_run_3768_joined_bins_6_19.root &
./v2_save_vals ${ISSIM} ${STATION} ${CONFIG} 225 1 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ValsForCuts/A2/c3 0 1 0.0 0.0 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/Joined/A2/by_config/c3/processed_station_2_run_3769_joined_bins_6_19.root &
./v2_save_vals ${ISSIM} ${STATION} ${CONFIG} 225 1 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ValsForCuts/A2/c3 0 1 0.0 0.0 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/Joined/A2/by_config/c3/processed_station_2_run_3770_joined_bins_6_19.root &
./v2_save_vals ${ISSIM} ${STATION} ${CONFIG} 225 1 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ValsForCuts/A2/c3 0 1 0.0 0.0 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/Joined/A2/by_config/c3/processed_station_2_run_3772_joined_bins_6_19.root &
./v2_save_vals ${ISSIM} ${STATION} ${CONFIG} 225 1 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ValsForCuts/A2/c3 0 1 0.0 0.0 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/Joined/A2/by_config/c3/processed_station_2_run_3773_joined_bins_6_19.root &
./v2_save_vals ${ISSIM} ${STATION} ${CONFIG} 225 1 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ValsForCuts/A2/c3 0 1 0.0 0.0 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/Joined/A2/by_config/c3/processed_station_2_run_3774_joined_bins_6_19.root &
wait
date