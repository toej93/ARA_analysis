#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0814/run006029/event006029.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006028.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0814/run006030/event006030.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006028.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0815/run006031/event006031.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006028.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0815/run006032/event006032.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006028.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0815/run006034/event006034.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006033.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0815/run006035/event006035.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006033.dat &
wait
date 
