#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0422/run007145/event007145.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007142.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0423/run007146/event007146.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007142.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0423/run007148/event007148.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007147.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0423/run007149/event007149.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007147.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0423/run007153/event007153.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007147.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0423/run007154/event007154.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007147.dat &
wait
