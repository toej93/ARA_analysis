#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0504/run007203/event007203.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007195.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0504/run007205/event007205.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007204.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0504/run007206/event007206.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007204.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0504/run007207/event007207.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007204.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0505/run007208/event007208.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007204.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0505/run007210/event007210.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007209.dat &
wait
