#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1212/run006551/event006551.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006548.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1212/run006552/event006552.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006548.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1212/run006554/event006554.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006553.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1213/run006555/event006555.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006553.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1213/run006556/event006556.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006553.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1213/run006558/event006558.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006553.dat &
wait
date 
