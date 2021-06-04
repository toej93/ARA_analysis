#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0907/run006148/event006148.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006139.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0907/run006150/event006150.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006149.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0908/run006151/event006151.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006149.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0908/run006152/event006152.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006149.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0908/run006153/event006153.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006149.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0908/run006155/event006155.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006154.dat &
wait
date 
