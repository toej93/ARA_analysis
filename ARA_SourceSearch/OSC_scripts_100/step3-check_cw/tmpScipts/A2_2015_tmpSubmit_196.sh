#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1026/run006391/event006391.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006389.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1026/run006392/event006392.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006389.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1026/run006393/event006393.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006389.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1026/run006395/event006395.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006394.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1027/run006396/event006396.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006394.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1027/run006397/event006397.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006394.dat &
wait
date 
