#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0823/run006071/event006071.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006069.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0823/run006072/event006072.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006069.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0823/run006073/event006073.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006069.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0823/run006075/event006075.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006074.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0824/run006076/event006076.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006074.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0824/run006077/event006077.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006074.dat &
wait
date 
