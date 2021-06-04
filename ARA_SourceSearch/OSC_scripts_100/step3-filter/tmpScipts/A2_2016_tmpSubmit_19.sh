#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0130/run006791/event006791.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006787.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0130/run006793/event006793.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006792.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0131/run006794/event006794.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006792.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0131/run006795/event006795.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006792.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0131/run006796/event006796.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006792.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0131/run006798/event006798.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006797.dat &
wait
