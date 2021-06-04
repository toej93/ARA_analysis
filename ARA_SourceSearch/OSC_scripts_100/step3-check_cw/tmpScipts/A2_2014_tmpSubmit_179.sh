#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1108/run004499/event004499.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004495.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1108/run004501/event004501.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004500.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1109/run004502/event004502.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004500.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1109/run004503/event004503.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004500.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1109/run004504/event004504.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004500.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1109/run004506/event004506.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004505.dat &
wait
date 
