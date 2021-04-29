#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=00:05:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_join_filter_41_300 ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2015 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2015processed_station_2_run_4887_filter.root &
./v2_analysis_join_filter_41_300 ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2015 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2015processed_station_2_run_4888_filter.root &
./v2_analysis_join_filter_41_300 ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2015 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2015processed_station_2_run_4889_filter.root &
./v2_analysis_join_filter_41_300 ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2015 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2015processed_station_2_run_4890_filter.root &
./v2_analysis_join_filter_41_300 ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2015 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2015processed_station_2_run_4891_filter.root &
./v2_analysis_join_filter_41_300 ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2015 /fs/project/PAS0654/ARA_DATA/A23/10pctCalibBugFix/ProcessedFile/A2/2015processed_station_2_run_4892_filter.root &
wait
