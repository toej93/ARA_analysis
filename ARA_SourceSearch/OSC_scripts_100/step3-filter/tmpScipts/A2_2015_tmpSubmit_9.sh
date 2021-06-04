#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0115/run004848/event004848.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004846.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0116/run004849/event004849.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004846.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0116/run004855/event004855.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004846.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0116/run004856/event004856.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004846.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0116/run004857/event004857.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004846.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0116/run004858/event004858.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004846.dat &
wait
