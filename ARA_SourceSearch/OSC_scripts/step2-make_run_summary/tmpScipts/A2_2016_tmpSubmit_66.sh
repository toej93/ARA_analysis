#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0513/run007251/event007251.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007250.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0513/run007252/event007252.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007250.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0513/run007253/event007253.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007250.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0513/run007254/event007254.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007250.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0514/run007256/event007256.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007255.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0514/run007257/event007257.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007255.dat &
wait
