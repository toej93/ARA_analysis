#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=00:05:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_join_filter_41_300 ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2013 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2013processed_station_2_run_2696_filter.root &
./v2_analysis_join_filter_41_300 ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2013 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2013processed_station_2_run_2697_filter.root &
./v2_analysis_join_filter_41_300 ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2013 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2013processed_station_2_run_2698_filter.root &
./v2_analysis_join_filter_41_300 ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2013 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2013processed_station_2_run_2699_filter.root &
./v2_analysis_join_filter_41_300 ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2013 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2013processed_station_2_run_2701_filter.root &
./v2_analysis_join_filter_41_300 ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2013 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2013processed_station_2_run_2702_filter.root &
wait
