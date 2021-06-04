#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2167/event2167.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002157/pedestalValues.run002157.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2168/event2168.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002157/pedestalValues.run002157.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2169/event2169.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002157/pedestalValues.run002157.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2171/event2171.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002157/pedestalValues.run002157.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2172/event2172.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002157/pedestalValues.run002157.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2173/event2173.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002157/pedestalValues.run002157.dat &
wait
date 
