#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1018/run004394/event004394.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004390.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1018/run004396/event004396.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004395.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1018/run004397/event004397.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004395.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1019/run004398/event004398.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004395.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1019/run004399/event004399.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004395.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1019/run004401/event004401.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004400.dat &
wait
