#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1209/run006536/event006536.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006533.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1209/run006537/event006537.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006533.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1209/run006539/event006539.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006538.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1210/run006540/event006540.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006538.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1210/run006541/event006541.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006538.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1210/run006542/event006542.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006538.dat &
wait
date 
