#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0420/run003452/event003452.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003451.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0420/run003453/event003453.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003451.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0421/run003454/event003454.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003451.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0421/run003455/event003455.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003451.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0421/run003457/event003457.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003456.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0421/run003458/event003458.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003456.dat &
wait
