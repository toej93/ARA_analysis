#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:05:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_save_vals ${ISSIM} ${STATION} ${CONFIG} 225 1 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ValsForCuts/A2/c5 0 1 0.0 0.0 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/Joined/A2/by_config/c5/processed_station_2_run_7408_joined_bins_6_19.root &
./v2_save_vals ${ISSIM} ${STATION} ${CONFIG} 225 1 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ValsForCuts/A2/c5 0 1 0.0 0.0 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/Joined/A2/by_config/c5/processed_station_2_run_7409_joined_bins_6_19.root &
./v2_save_vals ${ISSIM} ${STATION} ${CONFIG} 225 1 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ValsForCuts/A2/c5 0 1 0.0 0.0 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/Joined/A2/by_config/c5/processed_station_2_run_7410_joined_bins_6_19.root &
./v2_save_vals ${ISSIM} ${STATION} ${CONFIG} 225 1 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ValsForCuts/A2/c5 0 1 0.0 0.0 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/Joined/A2/by_config/c5/processed_station_2_run_7411_joined_bins_6_19.root &
./v2_save_vals ${ISSIM} ${STATION} ${CONFIG} 225 1 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ValsForCuts/A2/c5 0 1 0.0 0.0 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/Joined/A2/by_config/c5/processed_station_2_run_7412_joined_bins_6_19.root &
./v2_save_vals ${ISSIM} ${STATION} ${CONFIG} 225 1 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ValsForCuts/A2/c5 0 1 0.0 0.0 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/Joined/A2/by_config/c5/processed_station_2_run_7413_joined_bins_6_19.root &
wait
date
