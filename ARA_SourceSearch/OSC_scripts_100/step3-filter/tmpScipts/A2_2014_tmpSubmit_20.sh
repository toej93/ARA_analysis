#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0220/run003080/event003080.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003072.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0221/run003083/event003083.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003082.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0221/run003084/event003084.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003082.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0221/run003085/event003085.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003082.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0222/run003086/event003086.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003082.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0222/run003088/event003088.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003087.dat &
wait
