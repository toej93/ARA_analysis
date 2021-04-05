#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0210/run006856/event006856.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006854.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0211/run006857/event006857.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006854.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0211/run006858/event006858.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006854.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0211/run006860/event006860.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006859.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0211/run006861/event006861.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006859.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0212/run006862/event006862.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006859.dat &
wait
