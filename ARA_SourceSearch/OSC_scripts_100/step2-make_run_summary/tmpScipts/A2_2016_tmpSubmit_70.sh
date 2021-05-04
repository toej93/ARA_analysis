#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0519/run007281/event007281.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007277.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0519/run007283/event007283.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007282.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0519/run007284/event007284.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007282.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0520/run007285/event007285.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007282.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0520/run007286/event007286.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007282.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0520/run007292/event007292.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007282.dat &
wait