#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0926/run006241/event006241.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006239.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0926/run006242/event006242.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006239.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0926/run006243/event006243.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006239.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0926/run006245/event006245.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006244.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0927/run006246/event006246.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006244.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0927/run006247/event006247.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006244.dat &
wait
