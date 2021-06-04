#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0726/run003966/event003966.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003963.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0726/run003967/event003967.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003963.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0727/run003969/event003969.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003968.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0727/run003970/event003970.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003968.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0727/run003971/event003971.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003968.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0727/run003972/event003972.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003968.dat &
wait
