#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0413/run007103/event007103.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007001.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0413/run007104/event007104.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007001.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0413/run007106/event007106.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007105.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0414/run007107/event007107.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007105.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0414/run007108/event007108.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007105.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0414/run007109/event007109.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007105.dat &
wait
