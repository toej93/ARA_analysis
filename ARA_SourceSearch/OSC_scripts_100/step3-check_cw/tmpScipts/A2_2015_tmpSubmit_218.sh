#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1217/run006574/event006574.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006568.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1217/run006576/event006576.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006575.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1217/run006577/event006577.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006575.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1217/run006578/event006578.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006575.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1218/run006579/event006579.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006575.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1218/run006581/event006581.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006580.dat &
wait
date 
