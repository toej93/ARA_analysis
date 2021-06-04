#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0803/run005976/event005976.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005973.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0804/run005977/event005977.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005973.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0804/run005979/event005979.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005978.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0804/run005980/event005980.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005978.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0805/run005981/event005981.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005978.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0805/run005982/event005982.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005978.dat &
wait
date 
