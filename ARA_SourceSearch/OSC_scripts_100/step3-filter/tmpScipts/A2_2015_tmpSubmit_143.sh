#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0805/run005984/event005984.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005983.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0805/run005985/event005985.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005983.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0806/run005986/event005986.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005983.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0806/run005987/event005987.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005983.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0806/run005989/event005989.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005988.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0806/run005990/event005990.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005988.dat &
wait
