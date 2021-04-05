#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0731/run005960/event005960.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005958.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0731/run005961/event005961.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005958.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0801/run005962/event005962.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005958.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0801/run005964/event005964.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005963.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0801/run005965/event005965.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005963.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0801/run005966/event005966.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005963.dat &
wait
