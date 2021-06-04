#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1011/run006316/event006316.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006314.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1011/run006317/event006317.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006314.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1011/run006318/event006318.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006314.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1012/run006320/event006320.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006319.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1012/run006321/event006321.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006319.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1012/run006322/event006322.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006319.dat &
wait
date 
