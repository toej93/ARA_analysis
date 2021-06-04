#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0118/run006732/event006732.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006731.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0118/run006733/event006733.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006731.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0118/run006734/event006734.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006731.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0119/run006735/event006735.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006731.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0119/run006737/event006737.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006736.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0119/run006738/event006738.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006736.dat &
wait
