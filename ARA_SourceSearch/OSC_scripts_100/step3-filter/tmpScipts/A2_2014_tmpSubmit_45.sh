#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0330/run003347/event003347.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003346.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0330/run003348/event003348.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003346.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0331/run003349/event003349.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003346.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0331/run003350/event003350.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003346.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0331/run003352/event003352.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003351.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0331/run003353/event003353.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003351.dat &
wait
