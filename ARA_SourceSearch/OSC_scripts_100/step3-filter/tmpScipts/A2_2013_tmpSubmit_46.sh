#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1823/event1823.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001822/pedestalValues.run001822.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1824/event1824.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001822/pedestalValues.run001822.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1825/event1825.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001822/pedestalValues.run001822.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1826/event1826.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001822/pedestalValues.run001822.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1828/event1828.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001822/pedestalValues.run001822.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1829/event1829.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001822/pedestalValues.run001822.dat &
wait
