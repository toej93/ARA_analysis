#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0205/run003002/event003002.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003001.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0205/run003003/event003003.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003001.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0205/run003004/event003004.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003001.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0206/run003009/event003009.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003001.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0206/run003010/event003010.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003001.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0207/run003012/event003012.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003001.dat &
wait
date 
