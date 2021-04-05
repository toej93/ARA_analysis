#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0722/run005915/event005915.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005913.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0722/run005916/event005916.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005913.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0723/run005917/event005917.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005913.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0723/run005919/event005919.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005918.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0723/run005920/event005920.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005918.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0723/run005921/event005921.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005918.dat &
wait
