#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0125/run002949/event002949.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002946.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0125/run002950/event002950.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002946.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0126/run002952/event002952.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002951.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0126/run002954/event002954.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002951.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0126/run002955/event002955.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002951.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0127/run002957/event002957.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002951.dat &
wait
