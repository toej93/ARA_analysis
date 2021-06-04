#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1917/event1917.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001906/pedestalValues.run001906.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1918/event1918.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001906/pedestalValues.run001906.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1919/event1919.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001906/pedestalValues.run001906.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1920/event1920.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001906/pedestalValues.run001906.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1922/event1922.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001921/pedestalValues.run001921.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1923/event1923.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001921/pedestalValues.run001921.dat &
wait
