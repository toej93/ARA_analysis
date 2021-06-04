#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0531/run003683/event003683.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003681.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0601/run003684/event003684.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003681.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0601/run003685/event003685.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003681.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0601/run003687/event003687.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003686.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0601/run003688/event003688.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003686.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0602/run003689/event003689.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003686.dat &
wait
date 
