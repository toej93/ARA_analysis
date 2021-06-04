#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0626/run003816/event003816.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003812.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0626/run003818/event003818.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003817.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0626/run003819/event003819.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003817.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0626/run003820/event003820.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003817.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0627/run003821/event003821.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003817.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0627/run003823/event003823.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003822.dat &
wait
date 
