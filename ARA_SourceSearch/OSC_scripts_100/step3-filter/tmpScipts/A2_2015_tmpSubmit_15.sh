#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0125/run004957/event004957.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004956.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0125/run004958/event004958.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004956.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0125/run004959/event004959.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004956.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0126/run004960/event004960.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004956.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0126/run004962/event004962.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004961.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0126/run004963/event004963.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004961.dat &
wait
