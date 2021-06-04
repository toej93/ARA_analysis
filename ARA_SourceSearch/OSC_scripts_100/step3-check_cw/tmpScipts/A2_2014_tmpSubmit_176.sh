#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1104/run004477/event004477.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004475.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1104/run004478/event004478.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004475.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1104/run004479/event004479.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004475.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1104/run004481/event004481.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004480.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1105/run004482/event004482.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004480.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1105/run004483/event004483.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004480.dat &
wait
date 
