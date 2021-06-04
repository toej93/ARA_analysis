#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0224/run003097/event003097.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003092.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0224/run003098/event003098.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003092.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0224/run003099/event003099.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003092.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0224/run003100/event003100.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003092.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0225/run003101/event003101.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003092.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0225/run003103/event003103.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003102.dat &
wait
date 
