#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0201/run006799/event006799.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006797.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0201/run006800/event006800.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006797.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0202/run006812/event006812.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006797.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0202/run006813/event006813.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006797.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0202/run006814/event006814.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006797.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0203/run006815/event006815.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006797.dat &
wait
