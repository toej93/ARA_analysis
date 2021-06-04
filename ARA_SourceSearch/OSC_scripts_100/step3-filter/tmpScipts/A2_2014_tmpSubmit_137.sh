#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0821/run004107/event004107.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004103.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0822/run004109/event004109.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004108.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0822/run004110/event004110.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004108.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0822/run004111/event004111.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004108.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0822/run004112/event004112.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004108.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0823/run004114/event004114.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004113.dat &
wait
