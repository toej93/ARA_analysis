#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0514/run005571/event005571.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005568.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0514/run005572/event005572.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005568.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0514/run005574/event005574.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005573.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0515/run005575/event005575.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005573.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0515/run005576/event005576.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005573.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0515/run005577/event005577.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005573.dat &
wait
date 
