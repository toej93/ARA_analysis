#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0502/run003515/event003515.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003511.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0503/run003517/event003517.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003516.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0503/run003518/event003518.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003516.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0503/run003519/event003519.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003516.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0503/run003520/event003520.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003516.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0504/run003522/event003522.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003521.dat &
wait
