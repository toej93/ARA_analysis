#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1104/run004478/event004478.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004475.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1105/run004354/event004354.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004350.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1105/run004479/event004479.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004475.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1105/run004481/event004481.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004480.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1105/run004482/event004482.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004480.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1105/run004483/event004483.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004480.dat &
wait
