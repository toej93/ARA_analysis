#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1123/run004568/event004568.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004566.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1123/run004569/event004569.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004566.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1123/run004570/event004570.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004566.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1124/run004572/event004572.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004571.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1124/run004573/event004573.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004571.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1124/run004574/event004574.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004571.dat &
wait
