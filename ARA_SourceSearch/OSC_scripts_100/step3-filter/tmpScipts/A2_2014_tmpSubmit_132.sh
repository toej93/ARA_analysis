#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0814/run004069/event004069.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004064.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0814/run004071/event004071.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004070.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0814/run004072/event004072.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004070.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0814/run004073/event004073.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004070.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0815/run004074/event004074.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004070.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0815/run004076/event004076.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004075.dat &
wait
