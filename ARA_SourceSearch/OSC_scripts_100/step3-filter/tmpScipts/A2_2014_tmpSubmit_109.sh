#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0711/run003891/event003891.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003888.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0711/run003892/event003892.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003888.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0711/run003894/event003894.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003893.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0712/run003895/event003895.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003893.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0712/run003896/event003896.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003893.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0712/run003897/event003897.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003893.dat &
wait
