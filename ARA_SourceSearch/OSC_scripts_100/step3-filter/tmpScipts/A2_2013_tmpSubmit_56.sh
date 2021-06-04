#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1909/event1909.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001906/pedestalValues.run001906.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1910/event1910.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001906/pedestalValues.run001906.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1912/event1912.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001906/pedestalValues.run001906.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1913/event1913.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001906/pedestalValues.run001906.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1914/event1914.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001906/pedestalValues.run001906.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1915/event1915.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001906/pedestalValues.run001906.dat &
wait
