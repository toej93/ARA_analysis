#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2491/event2491.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002490/pedestalValues.run002490.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2492/event2492.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002490/pedestalValues.run002490.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2502/event2502.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002500/pedestalValues.run002500.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2506/event2506.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002500/pedestalValues.run002500.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2507/event2507.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002500/pedestalValues.run002500.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2511/event2511.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002510/pedestalValues.run002510.dat &
wait
