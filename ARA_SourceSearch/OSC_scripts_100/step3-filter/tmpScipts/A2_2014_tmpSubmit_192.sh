#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1202/run004614/event004614.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004596.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1202/run004615/event004615.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004596.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1202/run004616/event004616.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004596.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1203/run004617/event004617.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004596.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1203/run004619/event004619.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004618.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1203/run004620/event004620.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004618.dat &
wait
