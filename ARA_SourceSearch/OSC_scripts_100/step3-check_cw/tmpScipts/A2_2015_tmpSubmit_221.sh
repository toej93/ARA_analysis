#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1221/run006598/event006598.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006597.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1221/run006599/event006599.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006597.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1222/run006600/event006600.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006597.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1222/run006601/event006601.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006597.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1222/run006603/event006603.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006602.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1222/run006604/event006604.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006602.dat &
wait
date 
