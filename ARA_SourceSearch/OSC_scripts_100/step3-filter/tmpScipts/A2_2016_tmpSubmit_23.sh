#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0206/run006832/event006832.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006831.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0206/run006833/event006833.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006831.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0206/run006834/event006834.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006831.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0207/run006839/event006839.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006831.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0207/run006840/event006840.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006831.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0207/run006841/event006841.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006831.dat &
wait
