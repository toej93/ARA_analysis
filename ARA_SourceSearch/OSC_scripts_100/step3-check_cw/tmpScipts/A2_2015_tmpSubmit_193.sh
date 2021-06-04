#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1021/run006368/event006368.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006364.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1021/run006370/event006370.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006369.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1022/run006371/event006371.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006369.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1022/run006372/event006372.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006369.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1022/run006373/event006373.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006369.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1022/run006375/event006375.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006374.dat &
wait
date 
