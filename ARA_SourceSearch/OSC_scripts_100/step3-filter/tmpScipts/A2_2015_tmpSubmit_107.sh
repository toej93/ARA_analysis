#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0612/run005714/event005714.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005713.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0612/run005715/event005715.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005713.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0612/run005716/event005716.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005713.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0613/run005717/event005717.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005713.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0613/run005719/event005719.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005718.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0613/run005720/event005720.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005718.dat &
wait
