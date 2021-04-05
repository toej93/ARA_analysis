#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1213/run006555/event006555.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006553.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1213/run006556/event006556.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006553.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1213/run006558/event006558.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006553.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1213/run006559/event006559.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006553.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1214/run006560/event006560.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006553.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1214/run006561/event006561.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006553.dat &
wait
