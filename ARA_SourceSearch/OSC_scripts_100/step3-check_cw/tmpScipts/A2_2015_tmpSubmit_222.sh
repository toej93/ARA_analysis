#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1223/run006606/event006606.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006602.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1223/run006607/event006607.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006602.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1223/run006608/event006608.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006602.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1224/run006609/event006609.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006602.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1224/run006610/event006610.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006602.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1224/run006612/event006612.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006611.dat &
wait
date 
