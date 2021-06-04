#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0307/run005159/event005159.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005156.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0307/run005160/event005160.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005156.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0307/run005162/event005162.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005161.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0307/run005163/event005163.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005161.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0308/run005164/event005164.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005161.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0308/run005165/event005165.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005161.dat &
wait
date 
