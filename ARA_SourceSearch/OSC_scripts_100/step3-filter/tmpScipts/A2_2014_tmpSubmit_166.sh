#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1020/run004402/event004402.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004400.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1020/run004403/event004403.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004400.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1020/run004404/event004404.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004400.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1020/run004406/event004406.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004405.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1021/run004407/event004407.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004405.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1021/run004408/event004408.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004405.dat &
wait
