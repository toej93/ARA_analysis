#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0517/run005586/event005586.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005583.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0517/run005587/event005587.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005583.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0517/run005589/event005589.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005588.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0518/run005590/event005590.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005588.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0518/run005591/event005591.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005588.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0518/run005592/event005592.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005588.dat &
wait
date 
