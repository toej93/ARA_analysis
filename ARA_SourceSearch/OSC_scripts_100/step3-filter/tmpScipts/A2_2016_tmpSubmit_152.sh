#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/1001/run008011/event008011.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008009.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/1001/run008012/event008012.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008009.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/1001/run008013/event008013.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008009.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/1001/run008015/event008015.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008014.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/1002/run008016/event008016.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008014.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/1002/run008017/event008017.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008014.dat &
wait
