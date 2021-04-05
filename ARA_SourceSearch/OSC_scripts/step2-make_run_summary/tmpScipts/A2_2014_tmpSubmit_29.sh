#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0302/run003124/event003124.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003122.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0302/run003125/event003125.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003122.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0302/run003126/event003126.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003122.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0302/run003128/event003128.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003127.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0303/run003129/event003129.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003127.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0303/run003130/event003130.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003127.dat &
wait
