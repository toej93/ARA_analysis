#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0703/run007530/event007530.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007521.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0703/run007532/event007532.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007531.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0703/run007533/event007533.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007531.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0703/run007534/event007534.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007531.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0704/run007535/event007535.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007531.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0704/run007536/event007536.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007531.dat &
wait
