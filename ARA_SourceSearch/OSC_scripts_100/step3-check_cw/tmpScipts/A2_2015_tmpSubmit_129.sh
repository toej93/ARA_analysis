#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0715/run005879/event005879.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005878.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0715/run005880/event005880.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005878.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0715/run005881/event005881.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005878.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0716/run005882/event005882.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005878.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0716/run005884/event005884.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005883.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0716/run005885/event005885.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005883.dat &
wait
date 
