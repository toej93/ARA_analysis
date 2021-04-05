#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0622/run003794/event003794.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003792.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0622/run003796/event003796.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003792.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0622/run003798/event003798.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003797.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0622/run003799/event003799.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003797.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0623/run003800/event003800.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003797.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0623/run003801/event003801.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003797.dat &
wait
