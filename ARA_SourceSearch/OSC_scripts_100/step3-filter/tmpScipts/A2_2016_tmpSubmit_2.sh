#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0104/run006665/event006665.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006664.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0104/run006666/event006666.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006664.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0104/run006667/event006667.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006664.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0105/run006668/event006668.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006664.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0105/run006669/event006669.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006664.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0105/run006670/event006670.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006664.dat &
wait
