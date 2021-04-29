#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0425/run007162/event007162.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007158.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0425/run007164/event007164.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007163.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0426/run007006/event007006.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007001.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0426/run007165/event007165.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007163.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0426/run007166/event007166.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007163.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0426/run007167/event007167.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007163.dat &
wait
