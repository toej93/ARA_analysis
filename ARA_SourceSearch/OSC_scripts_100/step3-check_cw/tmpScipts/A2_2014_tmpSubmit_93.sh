#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0617/run003772/event003772.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003765.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0617/run003773/event003773.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003765.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0617/run003774/event003774.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003765.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0618/run003775/event003775.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003765.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0618/run003776/event003776.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003765.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0618/run003778/event003778.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003777.dat &
wait
date 
