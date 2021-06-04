#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0310/run006999/event006999.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006996.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0310/run007000/event007000.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006996.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0311/run007005/event007005.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007001.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0412/run007100/event007100.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007001.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0412/run007101/event007101.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007001.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0413/run007102/event007102.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007001.dat &
wait
