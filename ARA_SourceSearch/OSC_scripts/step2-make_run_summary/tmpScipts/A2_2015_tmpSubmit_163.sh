#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0730/run005952/event005952.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005948.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0730/run005954/event005954.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005953.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0730/run005955/event005955.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005953.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0730/run005956/event005956.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005953.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0731/run005957/event005957.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005953.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0731/run005959/event005959.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005958.dat &
wait
