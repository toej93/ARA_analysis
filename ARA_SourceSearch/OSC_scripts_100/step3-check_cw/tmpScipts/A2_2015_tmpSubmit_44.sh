#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0310/run005174/event005174.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005171.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0310/run005175/event005175.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005171.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0310/run005177/event005177.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005176.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0311/run005178/event005178.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005176.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0311/run005179/event005179.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005176.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0311/run005180/event005180.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005176.dat &
wait
date 
