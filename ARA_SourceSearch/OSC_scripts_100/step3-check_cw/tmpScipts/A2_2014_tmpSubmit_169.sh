#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1024/run004424/event004424.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004420.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1024/run004426/event004426.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004425.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1025/run004427/event004427.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004425.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1025/run004428/event004428.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004425.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1025/run004429/event004429.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004425.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1025/run004431/event004431.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004430.dat &
wait
date 
