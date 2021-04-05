#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0618/run007463/event007463.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007462.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0619/run007464/event007464.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007462.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0619/run007465/event007465.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007462.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0619/run007466/event007466.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007462.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0619/run007468/event007468.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007467.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0620/run007469/event007469.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007467.dat &
wait
