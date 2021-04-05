#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1205/run006517/event006517.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006509.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1206/run006519/event006519.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006518.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1206/run006520/event006520.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006518.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1206/run006521/event006521.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006518.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1206/run006522/event006522.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006518.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1207/run006524/event006524.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006523.dat &
wait
