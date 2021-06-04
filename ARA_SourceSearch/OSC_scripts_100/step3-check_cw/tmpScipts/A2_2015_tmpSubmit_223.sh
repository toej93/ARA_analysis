#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1224/run006613/event006613.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006611.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1225/run006614/event006614.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006611.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1225/run006615/event006615.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006611.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1225/run006617/event006617.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006616.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1225/run006618/event006618.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006616.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1226/run006619/event006619.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006616.dat &
wait
date 
