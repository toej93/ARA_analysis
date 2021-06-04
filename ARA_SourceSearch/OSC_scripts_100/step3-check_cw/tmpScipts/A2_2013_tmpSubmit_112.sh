#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2371/event2371.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002370/pedestalValues.run002370.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2372/event2372.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002370/pedestalValues.run002370.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2373/event2373.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002370/pedestalValues.run002370.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2374/event2374.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002370/pedestalValues.run002370.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2376/event2376.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002375/pedestalValues.run002375.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2377/event2377.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002375/pedestalValues.run002375.dat &
wait
date 
