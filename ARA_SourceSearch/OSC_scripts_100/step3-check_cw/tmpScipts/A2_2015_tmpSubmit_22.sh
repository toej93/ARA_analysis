#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0205/run005009/event005009.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005006.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0205/run005010/event005010.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005006.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0205/run005012/event005012.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005011.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0205/run005013/event005013.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005011.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0206/run005014/event005014.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005011.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0206/run005015/event005015.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005011.dat &
wait
date 
