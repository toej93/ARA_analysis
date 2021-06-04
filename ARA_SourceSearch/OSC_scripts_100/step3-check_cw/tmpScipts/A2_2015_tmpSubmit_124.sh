#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0707/run005841/event005841.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005838.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0708/run005842/event005842.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005838.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0708/run005844/event005844.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005843.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0708/run005845/event005845.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005843.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0708/run005846/event005846.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005843.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0709/run005847/event005847.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005843.dat &
wait
date 
