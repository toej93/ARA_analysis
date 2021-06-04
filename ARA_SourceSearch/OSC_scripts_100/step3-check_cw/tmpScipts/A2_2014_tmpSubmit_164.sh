#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1016/run004387/event004387.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004385.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1017/run004388/event004388.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004385.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1017/run004389/event004389.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004385.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1017/run004391/event004391.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004390.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1017/run004392/event004392.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004390.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1018/run004393/event004393.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004390.dat &
wait
date 
