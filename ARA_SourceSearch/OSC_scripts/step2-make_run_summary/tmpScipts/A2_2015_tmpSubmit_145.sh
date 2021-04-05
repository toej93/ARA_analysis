#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0703/run005817/event005817.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005813.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0703/run005819/event005819.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005818.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0703/run005820/event005820.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005818.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0703/run005821/event005821.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005818.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0703/run005822/event005822.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005818.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0704/run005824/event005824.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005823.dat &
wait
