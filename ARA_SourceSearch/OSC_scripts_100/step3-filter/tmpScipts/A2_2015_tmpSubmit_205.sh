#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1108/run006458/event006458.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006454.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1108/run006460/event006460.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006459.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1108/run006461/event006461.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006459.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1108/run006462/event006462.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006459.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1109/run006463/event006463.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006459.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1109/run006465/event006465.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006464.dat &
wait
