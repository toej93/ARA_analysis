#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0204/run006824/event006824.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006821.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0205/run006825/event006825.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006821.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0205/run006827/event006827.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006826.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0205/run006828/event006828.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006826.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0205/run006829/event006829.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006826.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0206/run006830/event006830.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006826.dat &
wait
