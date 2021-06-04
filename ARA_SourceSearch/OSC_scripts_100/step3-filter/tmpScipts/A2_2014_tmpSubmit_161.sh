#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1012/run004364/event004364.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004360.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1012/run004366/event004366.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004365.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1012/run004367/event004367.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004365.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1013/run004368/event004368.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004365.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1013/run004369/event004369.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004365.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1013/run004371/event004371.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004370.dat &
wait
