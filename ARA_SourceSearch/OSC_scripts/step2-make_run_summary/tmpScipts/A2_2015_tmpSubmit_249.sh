#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1227/run006624/event006624.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006621.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1227/run006625/event006625.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006621.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1227/run006627/event006627.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006626.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1227/run006628/event006628.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006626.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1228/run006629/event006629.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006626.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1228/run006630/event006630.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006626.dat &
wait
