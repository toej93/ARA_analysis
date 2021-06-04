#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0709/run003884/event003884.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003883.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0710/run003885/event003885.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003883.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0710/run003886/event003886.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003883.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0710/run003887/event003887.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003883.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0710/run003889/event003889.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003888.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0711/run003890/event003890.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003888.dat &
wait
date 
