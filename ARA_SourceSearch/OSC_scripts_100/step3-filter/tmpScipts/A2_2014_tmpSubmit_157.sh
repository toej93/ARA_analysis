#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1006/run004334/event004334.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004330.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1006/run004336/event004336.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004335.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1006/run004337/event004337.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004335.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1007/run004338/event004338.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004335.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1007/run004339/event004339.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004335.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1007/run004341/event004341.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004340.dat &
wait
