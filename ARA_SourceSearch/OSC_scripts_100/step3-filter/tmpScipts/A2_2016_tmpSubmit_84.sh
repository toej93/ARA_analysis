#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0609/run007419/event007419.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007415.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0610/run007421/event007421.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007420.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0610/run007422/event007422.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007420.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0610/run007423/event007423.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007420.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0610/run007424/event007424.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007420.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0611/run007426/event007426.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007425.dat &
wait
