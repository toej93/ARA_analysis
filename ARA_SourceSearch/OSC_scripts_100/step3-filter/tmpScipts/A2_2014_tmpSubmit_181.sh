#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1111/run004514/event004514.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004510.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1111/run004516/event004516.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004515.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1112/run004517/event004517.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004515.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1112/run004518/event004518.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004515.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1112/run004519/event004519.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004515.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1113/run004521/event004521.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004520.dat &
wait
