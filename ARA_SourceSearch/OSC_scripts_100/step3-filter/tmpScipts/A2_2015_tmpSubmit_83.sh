#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0507/run005534/event005534.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005533.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0507/run005535/event005535.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005533.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0507/run005536/event005536.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005533.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0508/run005537/event005537.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005533.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0508/run005539/event005539.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005538.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0508/run005540/event005540.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005538.dat &
wait
