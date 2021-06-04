#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0311/run005182/event005182.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005181.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0311/run005183/event005183.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005181.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0312/run005184/event005184.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005181.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0312/run005185/event005185.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005181.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0312/run005187/event005187.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005186.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0312/run005188/event005188.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005186.dat &
wait
