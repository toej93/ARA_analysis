#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0627/run007501/event007501.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007497.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0627/run007503/event007503.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007502.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0627/run007504/event007504.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007502.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0627/run007506/event007506.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007502.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0628/run007507/event007507.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007502.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0628/run007508/event007508.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007502.dat &
wait
