#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0124/run006762/event006762.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006761.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0124/run006763/event006763.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006761.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0124/run006764/event006764.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006761.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0125/run006765/event006765.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006761.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0125/run006767/event006767.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006766.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0125/run006768/event006768.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006766.dat &
wait
