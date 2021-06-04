#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0624/run005774/event005774.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005773.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0624/run005775/event005775.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005773.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0624/run005776/event005776.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005773.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0624/run005777/event005777.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005773.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0625/run005779/event005779.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005778.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0625/run005780/event005780.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005778.dat &
wait
date 
