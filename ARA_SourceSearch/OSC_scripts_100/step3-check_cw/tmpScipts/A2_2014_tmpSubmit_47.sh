#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0402/run003362/event003362.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003361.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0402/run003363/event003363.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003361.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0403/run003364/event003364.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003361.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0403/run003365/event003365.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003361.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0403/run003367/event003367.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003366.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0403/run003368/event003368.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003366.dat &
wait
date 
