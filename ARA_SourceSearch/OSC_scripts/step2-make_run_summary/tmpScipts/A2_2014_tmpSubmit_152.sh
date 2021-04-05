#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0811/run004048/event004048.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004044.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0811/run004050/event004050.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004049.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0812/run004045/event004045.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004044.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0812/run004051/event004051.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004049.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0812/run004052/event004052.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004049.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0812/run004053/event004053.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004049.dat &
wait
