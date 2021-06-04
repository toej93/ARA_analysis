#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0902/run006123/event006123.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006119.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0902/run006125/event006125.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006124.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0903/run006126/event006126.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006124.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0903/run006127/event006127.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006124.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0903/run006128/event006128.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006124.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0903/run006130/event006130.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006129.dat &
wait
