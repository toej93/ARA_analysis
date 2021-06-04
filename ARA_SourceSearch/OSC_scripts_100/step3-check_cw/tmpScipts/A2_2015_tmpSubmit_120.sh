#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0701/run005811/event005811.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005808.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0702/run005812/event005812.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005808.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0702/run005814/event005814.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005813.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0702/run005815/event005815.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005813.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0702/run005816/event005816.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005813.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0703/run005817/event005817.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005813.dat &
wait
date 
