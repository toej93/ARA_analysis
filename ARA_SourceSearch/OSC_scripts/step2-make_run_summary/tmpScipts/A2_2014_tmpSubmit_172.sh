#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1004/run004256/event004256.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004235.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1004/run004274/event004274.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004270.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1005/run004297/event004297.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004295.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1005/run004309/event004309.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004305.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1006/run004231/event004231.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004220.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1006/run004244/event004244.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004235.dat &
wait
