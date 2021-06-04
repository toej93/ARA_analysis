#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0223/run005099/event005099.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005096.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0223/run005100/event005100.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005096.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0223/run005102/event005102.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005101.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0223/run005103/event005103.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005101.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0224/run005104/event005104.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005101.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0224/run005105/event005105.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005101.dat &
wait
