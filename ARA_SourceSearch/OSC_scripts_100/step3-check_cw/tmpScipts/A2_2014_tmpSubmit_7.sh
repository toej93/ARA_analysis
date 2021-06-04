#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0113/run002880/event002880.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002877.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0113/run002881/event002881.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002877.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0113/run002883/event002883.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002882.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0122/run002932/event002932.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002917.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0122/run002933/event002933.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002917.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0122/run002934/event002934.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002917.dat &
wait
date 
