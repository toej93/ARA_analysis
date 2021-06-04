#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0930/run004304/event004304.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004300.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0930/run004306/event004306.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004305.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0930/run004307/event004307.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004305.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1001/run004308/event004308.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004305.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1001/run004309/event004309.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004305.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1001/run004311/event004311.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004310.dat &
wait
date 
