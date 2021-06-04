#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0220/run006902/event006902.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006901.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0220/run006903/event006903.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006901.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0220/run006904/event006904.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006901.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0220/run006905/event006905.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006901.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0220/run006907/event006907.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006906.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0221/run006908/event006908.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006906.dat &
wait
