#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0203/run005002/event005002.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005001.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0203/run005003/event005003.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005001.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0204/run005004/event005004.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005001.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0204/run005005/event005005.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005001.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0204/run005007/event005007.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005006.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0204/run005008/event005008.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005006.dat &
wait
