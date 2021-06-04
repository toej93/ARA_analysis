#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0211/run005039/event005039.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005036.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0211/run005040/event005040.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005036.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0211/run005042/event005042.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005041.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0211/run005043/event005043.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005041.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0212/run005044/event005044.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005041.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0212/run005045/event005045.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005041.dat &
wait
