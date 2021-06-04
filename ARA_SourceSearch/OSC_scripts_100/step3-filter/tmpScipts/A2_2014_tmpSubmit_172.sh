#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1029/run004447/event004447.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004445.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1029/run004448/event004448.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004445.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1029/run004449/event004449.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004445.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1029/run004451/event004451.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004450.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1030/run004452/event004452.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004450.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1030/run004453/event004453.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004450.dat &
wait
