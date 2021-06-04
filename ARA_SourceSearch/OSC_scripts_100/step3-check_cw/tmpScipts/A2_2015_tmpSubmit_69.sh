#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0416/run005429/event005429.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005428.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0416/run005430/event005430.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005428.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0416/run005431/event005431.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005428.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0417/run005432/event005432.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005428.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0417/run005434/event005434.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005433.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0417/run005435/event005435.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005433.dat &
wait
date 
