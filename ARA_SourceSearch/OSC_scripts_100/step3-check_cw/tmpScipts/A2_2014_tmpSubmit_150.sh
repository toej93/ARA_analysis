#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0925/run004282/event004282.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004280.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0925/run004283/event004283.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004280.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0926/run004284/event004284.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004280.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0926/run004286/event004286.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004285.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0926/run004287/event004287.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004285.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0926/run004288/event004288.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004285.dat &
wait
date 
