#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1023/run006376/event006376.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006374.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1023/run006377/event006377.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006374.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1023/run006378/event006378.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006374.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1023/run006380/event006380.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006379.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1024/run006381/event006381.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006379.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1024/run006382/event006382.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006379.dat &
wait
date 
