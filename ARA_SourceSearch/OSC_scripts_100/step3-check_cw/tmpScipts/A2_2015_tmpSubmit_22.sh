#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0121/run004917/event004917.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004870.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0121/run004918/event004918.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004870.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0121/run004919/event004919.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004870.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0121/run004920/event004920.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004870.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0121/run004921/event004921.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004870.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0121/run004922/event004922.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004870.dat &
wait
