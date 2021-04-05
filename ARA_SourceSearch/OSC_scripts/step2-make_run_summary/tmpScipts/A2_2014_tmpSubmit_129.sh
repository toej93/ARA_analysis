#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0711/run003826/event003826.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003822.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0711/run003828/event003828.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003827.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0711/run003829/event003829.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003827.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0711/run003830/event003830.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003827.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0711/run003831/event003831.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003827.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0711/run003833/event003833.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003832.dat &
wait
