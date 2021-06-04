#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1662/event1662.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001661/pedestalValues.run001661.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1663/event1663.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001661/pedestalValues.run001661.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1664/event1664.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001661/pedestalValues.run001661.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1665/event1665.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001661/pedestalValues.run001661.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1667/event1667.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001666/pedestalValues.run001666.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1668/event1668.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001666/pedestalValues.run001666.dat &
wait
date 
