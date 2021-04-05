#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0107/run004794/event004794.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004791.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0107/run004795/event004795.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004791.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0107/run004797/event004797.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004796.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0107/run004798/event004798.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004796.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0108/run004799/event004799.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004796.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0108/run004800/event004800.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004796.dat &
wait
