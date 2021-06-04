#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1004/run004327/event004327.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004325.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1005/run004328/event004328.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004325.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1005/run004329/event004329.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004325.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1005/run004331/event004331.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004330.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1005/run004332/event004332.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004330.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1006/run004333/event004333.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004330.dat &
wait
