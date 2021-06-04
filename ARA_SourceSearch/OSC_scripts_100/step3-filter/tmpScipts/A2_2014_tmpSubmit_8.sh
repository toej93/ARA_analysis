#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0122/run002935/event002935.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002917.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0123/run002937/event002937.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002936.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0124/run002943/event002943.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002941.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0124/run002944/event002944.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002941.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0124/run002945/event002945.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002941.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0125/run002948/event002948.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002946.dat &
wait
