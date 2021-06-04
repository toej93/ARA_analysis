#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1003/run006278/event006278.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006274.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1004/run006280/event006280.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006279.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1004/run006281/event006281.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006279.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1004/run006282/event006282.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006279.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1004/run006283/event006283.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006279.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1005/run006285/event006285.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006284.dat &
wait
date 
