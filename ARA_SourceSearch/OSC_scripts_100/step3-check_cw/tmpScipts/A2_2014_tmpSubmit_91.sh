#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0614/run003757/event003757.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003749.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0614/run003758/event003758.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003749.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0614/run003759/event003759.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003749.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0614/run003761/event003761.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003760.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0615/run003762/event003762.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003760.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0615/run003763/event003763.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003760.dat &
wait
date 
