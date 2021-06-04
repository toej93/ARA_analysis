#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0507/run003538/event003538.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003536.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0507/run003539/event003539.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003536.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0507/run003540/event003540.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003536.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0508/run003542/event003542.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003541.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0508/run003543/event003543.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003541.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0508/run003544/event003544.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003541.dat &
wait
date 
