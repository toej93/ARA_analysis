#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0615/run007448/event007448.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007447.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0616/run007449/event007449.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007447.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0616/run007450/event007450.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007447.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0616/run007451/event007451.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007447.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0616/run007453/event007453.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007452.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0617/run007454/event007454.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007452.dat &
wait
