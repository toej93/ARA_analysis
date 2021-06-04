#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1932/event1932.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001931/pedestalValues.run001931.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1933/event1933.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001931/pedestalValues.run001931.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1934/event1934.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001931/pedestalValues.run001931.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1935/event1935.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001931/pedestalValues.run001931.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1937/event1937.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001931/pedestalValues.run001931.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1938/event1938.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001931/pedestalValues.run001931.dat &
wait
date 
