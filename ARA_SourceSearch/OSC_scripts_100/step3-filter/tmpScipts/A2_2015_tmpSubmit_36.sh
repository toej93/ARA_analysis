#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0226/run005114/event005114.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005111.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0226/run005115/event005115.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005111.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0226/run005117/event005117.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005116.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0226/run005118/event005118.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005116.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0227/run005119/event005119.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005116.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0227/run005120/event005120.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005116.dat &
wait
