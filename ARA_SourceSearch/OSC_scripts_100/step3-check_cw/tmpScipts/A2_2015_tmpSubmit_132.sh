#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0719/run005901/event005901.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005898.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0720/run005902/event005902.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005898.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0720/run005904/event005904.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005903.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0720/run005905/event005905.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005903.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0720/run005906/event005906.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005903.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0721/run005907/event005907.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005903.dat &
wait
date 
