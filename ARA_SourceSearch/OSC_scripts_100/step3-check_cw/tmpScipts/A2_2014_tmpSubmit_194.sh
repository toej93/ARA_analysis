#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1205/run004629/event004629.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004628.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1205/run004630/event004630.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004628.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1205/run004631/event004631.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004628.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1206/run004632/event004632.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004628.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1206/run004634/event004634.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004633.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1206/run004635/event004635.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004633.dat &
wait
date 
