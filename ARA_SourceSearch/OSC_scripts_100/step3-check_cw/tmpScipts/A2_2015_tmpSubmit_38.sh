#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0301/run005129/event005129.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005126.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0301/run005130/event005130.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005126.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0301/run005132/event005132.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005131.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0301/run005133/event005133.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005131.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0302/run005134/event005134.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005131.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0302/run005135/event005135.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005131.dat &
wait
date 
