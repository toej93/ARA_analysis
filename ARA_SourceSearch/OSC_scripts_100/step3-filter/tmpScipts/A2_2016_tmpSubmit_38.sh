#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0228/run006947/event006947.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006946.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0229/run006948/event006948.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006946.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0229/run006949/event006949.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006946.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0229/run006950/event006950.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006946.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0229/run006952/event006952.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006951.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0301/run006953/event006953.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006951.dat &
wait
