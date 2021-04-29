#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0527/run005637/event005637.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005633.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0528/run005639/event005639.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005638.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0528/run005640/event005640.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005638.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0528/run005641/event005641.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005638.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0528/run005642/event005642.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005638.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0529/run005644/event005644.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005643.dat &
wait
