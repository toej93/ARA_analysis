#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0518/run003615/event003615.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003611.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0518/run003617/event003617.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003616.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0518/run003618/event003618.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003616.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0519/run003619/event003619.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003616.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0519/run003620/event003620.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003616.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0519/run003622/event003622.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003621.dat &
wait
date 
