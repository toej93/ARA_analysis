#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0927/run004289/event004289.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004285.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0927/run004291/event004291.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004290.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0927/run004292/event004292.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004290.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0927/run004293/event004293.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004290.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0928/run004294/event004294.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004290.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0928/run004296/event004296.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004295.dat &
wait
date 
