#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0223/run005100/event005100.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005096.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0223/run005102/event005102.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005101.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0223/run005103/event005103.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005101.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0224/run005104/event005104.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005101.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0224/run005105/event005105.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005101.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0224/run005107/event005107.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005106.dat &
wait
