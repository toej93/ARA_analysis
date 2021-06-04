#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0217/run003065/event003065.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003062.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0218/run003068/event003068.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003062.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0218/run003069/event003069.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003062.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0218/run003070/event003070.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003062.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0219/run003071/event003071.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003062.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0219/run003073/event003073.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003072.dat &
wait
