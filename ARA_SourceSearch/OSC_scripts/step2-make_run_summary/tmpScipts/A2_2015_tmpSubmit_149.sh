#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0709/run005847/event005847.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005843.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0709/run005849/event005849.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005848.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0709/run005850/event005850.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005848.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0709/run005851/event005851.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005848.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0710/run005852/event005852.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005848.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0710/run005854/event005854.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005853.dat &
wait
