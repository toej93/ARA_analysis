#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2268/event2268.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002266/pedestalValues.run002266.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2269/event2269.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002266/pedestalValues.run002266.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2270/event2270.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002266/pedestalValues.run002266.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2272/event2272.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002266/pedestalValues.run002266.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2273/event2273.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002266/pedestalValues.run002266.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2274/event2274.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002266/pedestalValues.run002266.dat &
wait
date 
