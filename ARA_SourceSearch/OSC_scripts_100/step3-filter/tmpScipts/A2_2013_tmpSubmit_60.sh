#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1939/event1939.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001931/pedestalValues.run001931.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1940/event1940.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001931/pedestalValues.run001931.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1942/event1942.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001931/pedestalValues.run001931.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1943/event1943.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001931/pedestalValues.run001931.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1944/event1944.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001931/pedestalValues.run001931.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1945/event1945.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001931/pedestalValues.run001931.dat &
wait
