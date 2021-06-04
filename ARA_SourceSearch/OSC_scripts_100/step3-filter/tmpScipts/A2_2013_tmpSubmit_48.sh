#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1838/event1838.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001837/pedestalValues.run001837.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1839/event1839.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001837/pedestalValues.run001837.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1840/event1840.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001837/pedestalValues.run001837.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1841/event1841.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001837/pedestalValues.run001837.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1843/event1843.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001837/pedestalValues.run001837.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1844/event1844.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001837/pedestalValues.run001837.dat &
wait
