#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0309/run006992/event006992.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006991.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0309/run006993/event006993.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006991.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0309/run006994/event006994.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006991.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0309/run006995/event006995.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006991.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0310/run006997/event006997.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006996.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0310/run006998/event006998.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006996.dat &
wait
