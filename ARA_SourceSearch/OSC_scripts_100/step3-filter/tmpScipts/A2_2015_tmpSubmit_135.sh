#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0724/run005924/event005924.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005923.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0724/run005925/event005925.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005923.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0724/run005926/event005926.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005923.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0725/run005927/event005927.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005923.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0725/run005929/event005929.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005928.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0725/run005930/event005930.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005928.dat &
wait
