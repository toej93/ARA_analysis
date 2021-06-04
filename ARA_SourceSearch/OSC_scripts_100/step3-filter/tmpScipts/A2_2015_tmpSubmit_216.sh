#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1213/run006559/event006559.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006553.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1214/run006560/event006560.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006553.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1214/run006561/event006561.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006553.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1214/run006562/event006562.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006553.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1214/run006564/event006564.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006563.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1215/run006565/event006565.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006563.dat &
wait
