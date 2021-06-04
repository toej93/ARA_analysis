#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0217/run006887/event006887.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006886.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0217/run006888/event006888.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006886.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0217/run006889/event006889.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006886.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0217/run006890/event006890.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006886.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0218/run006892/event006892.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006891.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0218/run006893/event006893.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006891.dat &
wait
