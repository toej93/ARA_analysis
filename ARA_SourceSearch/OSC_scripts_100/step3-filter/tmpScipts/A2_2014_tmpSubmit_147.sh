#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0910/run004208/event004208.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004205.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0911/run004209/event004209.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004205.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0911/run004211/event004211.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004210.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0911/run004213/event004213.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004210.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0912/run004214/event004214.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004210.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0912/run004216/event004216.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004215.dat &
wait
