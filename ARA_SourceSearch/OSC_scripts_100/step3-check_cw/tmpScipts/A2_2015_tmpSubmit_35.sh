#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0224/run005107/event005107.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005106.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0224/run005108/event005108.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005106.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0225/run005109/event005109.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005106.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0225/run005110/event005110.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005106.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0225/run005112/event005112.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005111.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0225/run005113/event005113.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005111.dat &
wait
date 
