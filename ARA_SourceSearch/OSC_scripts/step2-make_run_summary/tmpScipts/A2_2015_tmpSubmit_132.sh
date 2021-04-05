#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0613/run005720/event005720.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005718.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0613/run005721/event005721.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005718.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0614/run005722/event005722.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005718.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0614/run005724/event005724.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005723.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0614/run005725/event005725.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005723.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0614/run005726/event005726.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005723.dat &
wait
