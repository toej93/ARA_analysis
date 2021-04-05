#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0616/run003766/event003766.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003765.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0616/run003767/event003767.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003765.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0616/run003768/event003768.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003765.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0617/run003769/event003769.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003765.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0617/run003770/event003770.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003765.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0617/run003772/event003772.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003765.dat &
wait
