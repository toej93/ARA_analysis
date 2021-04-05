#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0801/run004001/event004001.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004000.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0802/run004002/event004002.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004000.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0802/run004003/event004003.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004000.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0802/run004004/event004004.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004000.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0802/run004006/event004006.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004005.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0803/run004007/event004007.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004005.dat &
wait
