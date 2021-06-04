#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0505/run003530/event003530.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003526.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0506/run003532/event003532.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003531.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0506/run003533/event003533.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003531.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0506/run003534/event003534.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003531.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0506/run003535/event003535.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003531.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0507/run003537/event003537.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003536.dat &
wait
