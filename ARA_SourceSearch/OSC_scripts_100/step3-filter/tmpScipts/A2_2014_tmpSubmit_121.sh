#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0729/run003981/event003981.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003978.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0729/run003982/event003982.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003978.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0730/run003984/event003984.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003983.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0730/run003985/event003985.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003983.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0730/run003986/event003986.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003983.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0730/run003987/event003987.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003983.dat &
wait
