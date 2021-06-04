#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0221/run005092/event005092.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005091.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0221/run005093/event005093.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005091.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0222/run005094/event005094.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005091.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0222/run005095/event005095.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005091.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0222/run005097/event005097.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005096.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0222/run005098/event005098.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005096.dat &
wait
date 
