#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0508/run007226/event007226.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007224.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0508/run007227/event007227.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007224.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0509/run007228/event007228.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007224.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0509/run007230/event007230.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007229.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0509/run007231/event007231.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007229.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0509/run007232/event007232.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007229.dat &
wait
