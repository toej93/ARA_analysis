#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0924/run006232/event006232.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006229.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0924/run006233/event006233.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006229.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0924/run006235/event006235.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006234.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0925/run006236/event006236.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006234.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0925/run006237/event006237.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006234.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0925/run006238/event006238.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006234.dat &
wait
