#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0306/run006977/event006977.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006976.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0306/run006978/event006978.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006976.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0306/run006979/event006979.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006976.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0306/run006980/event006980.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006976.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0307/run006982/event006982.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006981.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0307/run006983/event006983.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006981.dat &
wait
