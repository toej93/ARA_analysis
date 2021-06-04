#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0724/run003959/event003959.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003958.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0725/run003960/event003960.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003958.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0725/run003961/event003961.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003958.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0725/run003962/event003962.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003958.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0725/run003964/event003964.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003963.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0726/run003965/event003965.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003963.dat &
wait
