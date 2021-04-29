#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1012/run004362/event004362.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004360.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1012/run004363/event004363.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004360.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1012/run004364/event004364.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004360.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1013/run004366/event004366.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004365.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1013/run004367/event004367.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004365.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1013/run004368/event004368.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004365.dat &
wait
