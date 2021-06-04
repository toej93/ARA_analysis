#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0106/run004789/event004789.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004786.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0106/run004790/event004790.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004786.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0106/run004792/event004792.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004791.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0106/run004793/event004793.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004791.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0107/run004794/event004794.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004791.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0108/run004802/event004802.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004801.dat &
wait
