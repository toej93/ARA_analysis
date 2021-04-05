#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1204/run004621/event004621.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004618.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1204/run004622/event004622.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004618.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1204/run004624/event004624.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004623.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1205/run004625/event004625.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004623.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1205/run004626/event004626.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004623.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1205/run004627/event004627.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004623.dat &
wait
