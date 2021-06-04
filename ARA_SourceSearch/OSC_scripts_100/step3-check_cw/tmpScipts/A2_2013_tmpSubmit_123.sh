#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2453/event2453.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002430/pedestalValues.run002430.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2454/event2454.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002430/pedestalValues.run002430.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2456/event2456.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002455/pedestalValues.run002455.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2457/event2457.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002455/pedestalValues.run002455.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2458/event2458.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002455/pedestalValues.run002455.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2459/event2459.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002455/pedestalValues.run002455.dat &
wait
date 
