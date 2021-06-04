#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2532/event2532.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002530/pedestalValues.run002530.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2533/event2533.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002530/pedestalValues.run002530.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2534/event2534.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002530/pedestalValues.run002530.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2536/event2536.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002530/pedestalValues.run002530.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2537/event2537.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002530/pedestalValues.run002530.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2538/event2538.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002530/pedestalValues.run002530.dat &
wait
date 
