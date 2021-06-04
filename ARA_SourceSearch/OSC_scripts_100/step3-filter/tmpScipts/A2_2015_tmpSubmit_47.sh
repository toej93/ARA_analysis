#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0314/run005197/event005197.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005196.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0314/run005198/event005198.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005196.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0315/run005199/event005199.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005196.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0315/run005200/event005200.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005196.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0315/run005202/event005202.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005201.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0315/run005203/event005203.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005201.dat &
wait
