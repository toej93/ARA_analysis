#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0708/run007558/event007558.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007556.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0709/run007559/event007559.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007556.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0709/run007560/event007560.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007556.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0709/run007562/event007562.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007561.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0709/run007563/event007563.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007561.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0709/run007564/event007564.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007561.dat &
wait
