#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0628/run005796/event005796.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005793.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0628/run005797/event005797.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005793.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0629/run005799/event005799.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005798.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0629/run005800/event005800.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005798.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0629/run005801/event005801.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005798.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0629/run005802/event005802.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005798.dat &
wait
date 
