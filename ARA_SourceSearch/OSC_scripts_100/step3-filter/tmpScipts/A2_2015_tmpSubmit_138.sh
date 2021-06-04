#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0729/run005946/event005946.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005943.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0729/run005947/event005947.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005943.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0729/run005949/event005949.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005948.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0729/run005950/event005950.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005948.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0729/run005951/event005951.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005948.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0730/run005952/event005952.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005948.dat &
wait
