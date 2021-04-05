#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0227/run005123/event005123.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005121.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0228/run005124/event005124.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005121.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0228/run005125/event005125.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005121.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0228/run005127/event005127.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005126.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0228/run005128/event005128.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005126.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0301/run005129/event005129.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005126.dat &
wait
