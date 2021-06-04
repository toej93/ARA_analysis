#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0601/run005661/event005661.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005658.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0601/run005662/event005662.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005658.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0602/run005664/event005664.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005663.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0602/run005665/event005665.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005663.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0602/run005666/event005666.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005663.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0602/run005667/event005667.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005663.dat &
wait
