#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0130/run004979/event004979.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004976.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0130/run004980/event004980.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004976.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0130/run004982/event004982.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004981.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0130/run004983/event004983.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004981.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0130/run004984/event004984.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004981.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0131/run004985/event004985.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004981.dat &
wait
