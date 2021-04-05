#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0505/run007210/event007210.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007209.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0505/run007211/event007211.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007209.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0505/run007212/event007212.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007209.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0506/run007213/event007213.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007209.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0506/run007215/event007215.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007214.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0506/run007216/event007216.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007214.dat &
wait
