#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0606/run005684/event005684.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005678.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0606/run005685/event005685.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005678.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0606/run005686/event005686.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005678.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0607/run005687/event005687.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005678.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0607/run005689/event005689.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005688.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0607/run005690/event005690.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005688.dat &
wait
