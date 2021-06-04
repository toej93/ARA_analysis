#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0523/run007307/event007307.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007302.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0524/run007308/event007308.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007302.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0524/run007309/event007309.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007302.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0524/run007311/event007311.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007302.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0524/run007312/event007312.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007302.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0525/run007313/event007313.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007302.dat &
wait
