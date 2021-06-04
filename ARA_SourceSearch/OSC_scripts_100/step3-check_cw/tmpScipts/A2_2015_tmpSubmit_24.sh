#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0208/run005024/event005024.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005021.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0208/run005025/event005025.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005021.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0208/run005027/event005027.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005026.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0208/run005028/event005028.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005026.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0209/run005029/event005029.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005026.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0209/run005030/event005030.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005026.dat &
wait
date 
