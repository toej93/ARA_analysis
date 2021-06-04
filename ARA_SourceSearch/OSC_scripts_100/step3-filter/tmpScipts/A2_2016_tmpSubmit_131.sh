#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0829/run007841/event007841.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007837.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0829/run007845/event007845.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007842.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0830/run007846/event007846.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007842.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0830/run007847/event007847.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007842.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0830/run007848/event007848.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007842.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0830/run007849/event007849.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007842.dat &
wait
