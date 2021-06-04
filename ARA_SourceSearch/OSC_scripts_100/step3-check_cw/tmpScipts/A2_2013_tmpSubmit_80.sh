#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2097/event2097.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002093/pedestalValues.run002093.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2099/event2099.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002093/pedestalValues.run002093.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2100/event2100.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002093/pedestalValues.run002093.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2101/event2101.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002093/pedestalValues.run002093.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2102/event2102.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002093/pedestalValues.run002093.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2104/event2104.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002103/pedestalValues.run002103.dat &
wait
date 
