#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0413/run005414/event005414.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005413.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0413/run005415/event005415.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005413.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0413/run005416/event005416.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005413.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0414/run005417/event005417.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005413.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0414/run005419/event005419.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005418.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0414/run005420/event005420.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005418.dat &
wait
date 
