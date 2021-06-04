#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0409/run005391/event005391.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005388.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0409/run005392/event005392.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005388.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0409/run005394/event005394.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005393.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0409/run005395/event005395.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005393.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0410/run005396/event005396.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005393.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0410/run005397/event005397.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005393.dat &
wait
