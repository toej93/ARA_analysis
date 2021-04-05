#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1109/run004499/event004499.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004495.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1109/run004501/event004501.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004500.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1109/run004502/event004502.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004500.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1109/run004503/event004503.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004500.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1110/run004504/event004504.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004500.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1110/run004506/event004506.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004505.dat &
wait
