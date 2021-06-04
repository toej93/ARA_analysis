#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0904/run007875/event007875.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007873.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0905/run007876/event007876.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007873.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0905/run007877/event007877.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007873.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0905/run007879/event007879.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007878.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0905/run007880/event007880.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007878.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0906/run007881/event007881.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007878.dat &
wait
