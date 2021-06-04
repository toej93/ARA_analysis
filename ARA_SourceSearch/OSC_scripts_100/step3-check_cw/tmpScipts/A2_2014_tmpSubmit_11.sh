#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0130/run002972/event002972.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002971.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0130/run002973/event002973.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002971.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0130/run002974/event002974.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002971.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0130/run002975/event002975.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002971.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0131/run002977/event002977.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002976.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0131/run002978/event002978.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002976.dat &
wait
date 
