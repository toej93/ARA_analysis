#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0805/run004025/event004025.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004015.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0805/run004026/event004026.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004015.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0806/run004027/event004027.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004015.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0806/run004029/event004029.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004015.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0806/run004030/event004030.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004015.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0806/run004031/event004031.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004015.dat &
wait
date 
