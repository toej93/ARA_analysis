#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/1016/run008094/event008094.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008093.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/1016/run008095/event008095.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008093.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/1017/run008096/event008096.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008093.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/1017/run008097/event008097.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008093.dat &
wait
