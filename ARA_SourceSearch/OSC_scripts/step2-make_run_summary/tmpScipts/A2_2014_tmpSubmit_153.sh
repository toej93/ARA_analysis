#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0813/run004055/event004055.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004054.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0813/run004056/event004056.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004054.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0813/run004057/event004057.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004054.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0814/run004058/event004058.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004054.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0814/run004060/event004060.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004059.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0814/run004066/event004066.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004064.dat &
wait
