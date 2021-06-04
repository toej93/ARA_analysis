#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0927/run006248/event006248.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006244.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0927/run006250/event006250.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006249.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0928/run006251/event006251.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006249.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0928/run006252/event006252.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006249.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0928/run006253/event006253.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006249.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0929/run006255/event006255.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006254.dat &
wait
date 
