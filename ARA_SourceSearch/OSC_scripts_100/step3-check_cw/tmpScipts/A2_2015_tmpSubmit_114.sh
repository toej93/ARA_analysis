#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0622/run005766/event005766.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005763.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0622/run005767/event005767.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005763.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0623/run005769/event005769.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005768.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0623/run005770/event005770.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005768.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0623/run005771/event005771.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005768.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0623/run005772/event005772.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005768.dat &
wait
date 
