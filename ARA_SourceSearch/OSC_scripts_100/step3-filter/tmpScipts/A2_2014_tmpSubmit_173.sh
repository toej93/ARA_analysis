#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1030/run004454/event004454.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004450.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1030/run004456/event004456.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004455.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1031/run004457/event004457.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004455.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1031/run004458/event004458.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004455.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1031/run004459/event004459.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004455.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1031/run004461/event004461.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004460.dat &
wait
