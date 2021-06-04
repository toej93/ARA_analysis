#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0309/run003213/event003213.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003210.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0309/run003214/event003214.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003210.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0309/run003216/event003216.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003215.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0309/run003217/event003217.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003215.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0310/run003218/event003218.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003215.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0310/run003219/event003219.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003215.dat &
wait
