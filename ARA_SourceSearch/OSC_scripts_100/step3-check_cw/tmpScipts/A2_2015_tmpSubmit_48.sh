#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0316/run005204/event005204.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005201.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0316/run005205/event005205.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005201.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0316/run005207/event005207.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005206.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0316/run005208/event005208.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005206.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0317/run005209/event005209.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005206.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0317/run005278/event005278.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005206.dat &
wait
date 
