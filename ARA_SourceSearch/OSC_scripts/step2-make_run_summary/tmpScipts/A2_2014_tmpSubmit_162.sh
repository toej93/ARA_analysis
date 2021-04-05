#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0905/run004122/event004122.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004118.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0906/run004107/event004107.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004103.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0906/run004120/event004120.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004118.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0907/run004115/event004115.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004113.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0907/run004124/event004124.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004123.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0908/run004119/event004119.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004118.dat &
wait
