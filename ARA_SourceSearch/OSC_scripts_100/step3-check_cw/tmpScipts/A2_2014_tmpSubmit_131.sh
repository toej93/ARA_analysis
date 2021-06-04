#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0812/run004062/event004062.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004059.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0813/run004063/event004063.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004059.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0813/run004065/event004065.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004064.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0813/run004066/event004066.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004064.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0813/run004067/event004067.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004064.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0814/run004068/event004068.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004064.dat &
wait
date 
