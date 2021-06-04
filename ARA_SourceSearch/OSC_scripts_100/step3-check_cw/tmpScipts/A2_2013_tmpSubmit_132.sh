#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2591/event2591.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002540/pedestalValues.run002540.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2592/event2592.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002540/pedestalValues.run002540.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2593/event2593.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002540/pedestalValues.run002540.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2594/event2594.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002540/pedestalValues.run002540.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2596/event2596.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002540/pedestalValues.run002540.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2597/event2597.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002540/pedestalValues.run002540.dat &
wait
date 
