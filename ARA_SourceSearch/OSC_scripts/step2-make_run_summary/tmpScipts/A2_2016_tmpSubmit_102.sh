#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0707/run007550/event007550.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007546.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0707/run007552/event007552.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007551.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0707/run007553/event007553.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007551.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0708/run007554/event007554.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007551.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0708/run007555/event007555.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007551.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0708/run007557/event007557.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007556.dat &
wait
