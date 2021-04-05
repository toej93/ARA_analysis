#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2044/event2044.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002041/pedestalValues.run002041.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2045/event2045.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002041/pedestalValues.run002041.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2047/event2047.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002046/pedestalValues.run002046.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2048/event2048.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002046/pedestalValues.run002046.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2049/event2049.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002046/pedestalValues.run002046.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2050/event2050.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002046/pedestalValues.run002046.dat &
wait
