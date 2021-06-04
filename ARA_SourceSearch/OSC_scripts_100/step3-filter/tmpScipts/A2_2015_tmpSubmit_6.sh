#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0112/run004819/event004819.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004816.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0112/run004827/event004827.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004816.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0112/run004829/event004829.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004816.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0112/run004830/event004830.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004816.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0112/run004831/event004831.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004816.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0112/run004832/event004832.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004816.dat &
wait
