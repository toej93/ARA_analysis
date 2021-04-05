#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0702/run003846/event003846.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003843.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0702/run003847/event003847.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003843.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0703/run003849/event003849.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003848.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0703/run003850/event003850.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003848.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0703/run003851/event003851.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003848.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0703/run003852/event003852.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003848.dat &
wait
