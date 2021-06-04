#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0730/run005954/event005954.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005953.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0730/run005955/event005955.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005953.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0730/run005956/event005956.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005953.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0731/run005957/event005957.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005953.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0731/run005959/event005959.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005958.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0731/run005960/event005960.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005958.dat &
wait
