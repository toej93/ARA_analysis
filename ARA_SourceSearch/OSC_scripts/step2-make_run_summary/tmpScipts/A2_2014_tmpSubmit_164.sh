#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0911/run004106/event004106.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004103.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0911/run004136/event004136.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004133.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0912/run004127/event004127.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004123.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0912/run004137/event004137.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004133.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0913/run004135/event004135.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004133.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0914/run004157/event004157.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004155.dat &
wait
