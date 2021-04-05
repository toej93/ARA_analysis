#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0423/run007154/event007154.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007147.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0424/run007155/event007155.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007147.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0424/run007156/event007156.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007147.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0424/run007157/event007157.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007147.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0424/run007159/event007159.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007158.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0425/run007160/event007160.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007158.dat &
wait
