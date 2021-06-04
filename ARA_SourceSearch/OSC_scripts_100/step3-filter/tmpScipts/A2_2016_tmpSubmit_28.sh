#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0214/run006872/event006872.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006869.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0214/run006873/event006873.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006869.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0214/run006875/event006875.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006874.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0214/run006876/event006876.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006874.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0215/run006877/event006877.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006874.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0215/run006878/event006878.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006874.dat &
wait
