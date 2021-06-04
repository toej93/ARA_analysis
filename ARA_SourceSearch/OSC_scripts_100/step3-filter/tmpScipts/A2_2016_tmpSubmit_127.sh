#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0823/run007811/event007811.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007804.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0823/run007813/event007813.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007812.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0824/run007814/event007814.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007812.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0824/run007815/event007815.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007812.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0824/run007816/event007816.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007812.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0824/run007818/event007818.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007817.dat &
wait
