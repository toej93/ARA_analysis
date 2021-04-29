#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0613/run007434/event007434.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007430.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0613/run007435/event007435.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007430.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0613/run007436/event007436.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007430.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0613/run007438/event007438.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007437.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0614/run007439/event007439.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007437.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0614/run007440/event007440.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007437.dat &
wait
