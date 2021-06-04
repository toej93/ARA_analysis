#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1202/run006504/event006504.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006479.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1203/run006505/event006505.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006479.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1203/run006506/event006506.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006479.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1203/run006507/event006507.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006479.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1203/run006508/event006508.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006479.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1204/run006510/event006510.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006509.dat &
wait
