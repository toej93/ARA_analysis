#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1025/run008140/event008140.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008137.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1026/run008141/event008141.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008137.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1026/run008143/event008143.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008142.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1026/run008144/event008144.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008142.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1026/run008145/event008145.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008142.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1027/run008146/event008146.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008142.dat &
wait
