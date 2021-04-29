#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0317/run005218/event005218.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005206.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0317/run005219/event005219.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005206.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0317/run005220/event005220.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005206.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0317/run005221/event005221.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005206.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0317/run005222/event005222.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005206.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0317/run005223/event005223.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005206.dat &
wait
