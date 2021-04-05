#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0301/run006953/event006953.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006951.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0301/run006954/event006954.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006951.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0301/run006955/event006955.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006951.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0301/run006957/event006957.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006956.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0302/run006958/event006958.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006956.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0302/run006959/event006959.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006956.dat &
wait
