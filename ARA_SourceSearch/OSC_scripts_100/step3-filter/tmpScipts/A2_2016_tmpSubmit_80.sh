#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0603/run007357/event007357.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007355.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0603/run007358/event007358.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007355.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0604/run007359/event007359.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007355.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0604/run007361/event007361.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007360.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0604/run007362/event007362.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007360.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0604/run007363/event007363.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007360.dat &
wait
