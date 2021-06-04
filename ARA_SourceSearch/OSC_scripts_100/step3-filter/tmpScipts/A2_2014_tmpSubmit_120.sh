#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0728/run003974/event003974.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003973.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0728/run003975/event003975.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003973.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0728/run003976/event003976.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003973.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0728/run003977/event003977.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003973.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0729/run003979/event003979.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003978.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0729/run003980/event003980.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003978.dat &
wait
