#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0628/run005795/event005795.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005793.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0628/run005796/event005796.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005793.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0628/run005797/event005797.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005793.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0629/run005799/event005799.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005798.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0629/run005800/event005800.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005798.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0629/run005801/event005801.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005798.dat &
wait
