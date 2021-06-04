#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0801/run003999/event003999.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003988.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0801/run004001/event004001.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004000.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0801/run004002/event004002.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004000.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0801/run004003/event004003.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004000.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0802/run004006/event004006.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004005.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0802/run004007/event004007.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004005.dat &
wait
date 
