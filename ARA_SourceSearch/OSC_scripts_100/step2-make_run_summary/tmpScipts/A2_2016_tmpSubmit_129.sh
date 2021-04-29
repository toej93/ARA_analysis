#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0826/run007826/event007826.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007822.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0826/run007828/event007828.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007827.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0827/run007829/event007829.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007827.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0827/run007830/event007830.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007827.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0827/run007831/event007831.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007827.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0827/run007833/event007833.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007832.dat &
wait
