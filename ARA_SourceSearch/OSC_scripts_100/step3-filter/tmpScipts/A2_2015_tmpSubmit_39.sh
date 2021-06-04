#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0302/run005137/event005137.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005136.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0302/run005138/event005138.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005136.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0303/run005139/event005139.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005136.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0303/run005140/event005140.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005136.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0303/run005142/event005142.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005141.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0303/run005143/event005143.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005141.dat &
wait
