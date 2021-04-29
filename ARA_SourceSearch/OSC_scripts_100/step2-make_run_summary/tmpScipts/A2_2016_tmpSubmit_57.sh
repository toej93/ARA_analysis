#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0429/run007182/event007182.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007180.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0429/run007183/event007183.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007180.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0430/run007184/event007184.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007180.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0430/run007186/event007186.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007185.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0430/run007187/event007187.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007185.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0430/run007188/event007188.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007185.dat &
wait
