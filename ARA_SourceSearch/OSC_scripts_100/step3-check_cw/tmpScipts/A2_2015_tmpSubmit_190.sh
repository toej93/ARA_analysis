#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1017/run006346/event006346.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006344.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1017/run006347/event006347.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006344.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1017/run006348/event006348.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006344.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1017/run006350/event006350.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006349.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1018/run006351/event006351.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006349.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1018/run006352/event006352.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006349.dat &
wait
date 
