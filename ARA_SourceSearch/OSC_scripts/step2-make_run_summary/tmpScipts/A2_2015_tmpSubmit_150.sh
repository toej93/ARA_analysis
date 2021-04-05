#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0710/run005855/event005855.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005853.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0710/run005856/event005856.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005853.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0711/run005857/event005857.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005853.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0711/run005859/event005859.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005858.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0711/run005860/event005860.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005858.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0711/run005861/event005861.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005858.dat &
wait
