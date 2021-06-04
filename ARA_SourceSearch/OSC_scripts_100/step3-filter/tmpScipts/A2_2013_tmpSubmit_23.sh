#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1618/event1618.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001615/pedestalValues.run001615.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1619/event1619.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001615/pedestalValues.run001615.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1621/event1621.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001615/pedestalValues.run001615.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1622/event1622.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001615/pedestalValues.run001615.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1623/event1623.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001615/pedestalValues.run001615.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1624/event1624.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001615/pedestalValues.run001615.dat &
wait
