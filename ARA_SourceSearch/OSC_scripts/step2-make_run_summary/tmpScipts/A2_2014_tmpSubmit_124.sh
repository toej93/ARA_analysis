#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0705/run003861/event003861.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003858.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0705/run003862/event003862.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003858.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0706/run003864/event003864.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003863.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0706/run003865/event003865.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003863.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0706/run003866/event003866.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003863.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0706/run003867/event003867.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003863.dat &
wait
