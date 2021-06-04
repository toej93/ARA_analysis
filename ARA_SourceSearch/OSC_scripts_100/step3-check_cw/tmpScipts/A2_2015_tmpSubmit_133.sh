#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0721/run005909/event005909.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005908.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0721/run005910/event005910.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005908.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0721/run005911/event005911.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005908.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0722/run005912/event005912.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005908.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0722/run005914/event005914.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005913.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0722/run005915/event005915.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005913.dat &
wait
date 
