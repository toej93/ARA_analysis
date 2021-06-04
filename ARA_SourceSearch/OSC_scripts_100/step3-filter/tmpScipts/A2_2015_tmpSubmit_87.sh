#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0512/run005564/event005564.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005563.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0513/run005565/event005565.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005563.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0513/run005566/event005566.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005563.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0513/run005567/event005567.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005563.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0513/run005569/event005569.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005568.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0514/run005570/event005570.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005568.dat &
wait
