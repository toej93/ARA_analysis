#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0928/run004297/event004297.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004295.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0928/run004298/event004298.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004295.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0929/run004299/event004299.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004295.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0929/run004301/event004301.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004300.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0929/run004302/event004302.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004300.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0930/run004303/event004303.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004300.dat &
wait
date 
