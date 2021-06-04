#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0912/run004217/event004217.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004215.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0912/run004218/event004218.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004215.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0913/run004219/event004219.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004215.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0913/run004221/event004221.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004220.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0913/run004222/event004222.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004220.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0915/run004231/event004231.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004220.dat &
wait
