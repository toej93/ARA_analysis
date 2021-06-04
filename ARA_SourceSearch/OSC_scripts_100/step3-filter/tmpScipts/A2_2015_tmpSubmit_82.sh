#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0505/run005526/event005526.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005523.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0506/run005527/event005527.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005523.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0506/run005529/event005529.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005528.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0506/run005530/event005530.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005528.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0506/run005531/event005531.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005528.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0507/run005532/event005532.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005528.dat &
wait
