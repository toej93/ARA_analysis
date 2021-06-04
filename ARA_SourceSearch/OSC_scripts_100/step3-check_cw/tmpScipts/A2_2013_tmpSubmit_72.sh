#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2029/event2029.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002021/pedestalValues.run002021.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2030/event2030.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002021/pedestalValues.run002021.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2032/event2032.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002031/pedestalValues.run002031.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2033/event2033.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002031/pedestalValues.run002031.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2034/event2034.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002031/pedestalValues.run002031.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2035/event2035.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002031/pedestalValues.run002031.dat &
wait
date 
