#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0418/run007129/event007129.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007122.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0418/run007130/event007130.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007122.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0419/run007131/event007131.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007122.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0420/run007133/event007133.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007132.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0420/run007134/event007134.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007132.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0420/run007135/event007135.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007132.dat &
wait
