#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1815/event1815.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001812/pedestalValues.run001812.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1816/event1816.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001812/pedestalValues.run001812.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1818/event1818.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001812/pedestalValues.run001812.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1819/event1819.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001812/pedestalValues.run001812.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1820/event1820.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001812/pedestalValues.run001812.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1821/event1821.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001812/pedestalValues.run001812.dat &
wait
