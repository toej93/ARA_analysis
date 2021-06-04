#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0613/run005721/event005721.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005718.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0614/run005722/event005722.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005718.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0614/run005724/event005724.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005723.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0614/run005725/event005725.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005723.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0614/run005726/event005726.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005723.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0615/run005727/event005727.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005723.dat &
wait
date 
