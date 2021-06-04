#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1581/event1581.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001564/pedestalValues.run001564.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1582/event1582.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001564/pedestalValues.run001564.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1583/event1583.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001564/pedestalValues.run001564.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1585/event1585.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001584/pedestalValues.run001584.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1586/event1586.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001584/pedestalValues.run001584.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1587/event1587.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001584/pedestalValues.run001584.dat &
wait
date 
