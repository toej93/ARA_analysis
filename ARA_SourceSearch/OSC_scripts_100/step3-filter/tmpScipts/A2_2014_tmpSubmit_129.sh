#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0809/run004047/event004047.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004044.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0810/run004048/event004048.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004044.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0810/run004050/event004050.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004049.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0810/run004051/event004051.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004049.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0810/run004052/event004052.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004049.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0811/run004053/event004053.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004049.dat &
wait
