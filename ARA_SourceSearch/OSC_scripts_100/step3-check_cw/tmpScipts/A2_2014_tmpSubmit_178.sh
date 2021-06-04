#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1107/run004492/event004492.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004490.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1107/run004493/event004493.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004490.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1107/run004494/event004494.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004490.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1107/run004496/event004496.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004495.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1108/run004497/event004497.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004495.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1108/run004498/event004498.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004495.dat &
wait
date 
