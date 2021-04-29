#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0825/run007819/event007819.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007817.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0825/run007820/event007820.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007817.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0825/run007821/event007821.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007817.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0825/run007823/event007823.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007822.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0826/run007824/event007824.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007822.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0826/run007825/event007825.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007822.dat &
wait
