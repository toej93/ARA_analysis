#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0218/run005078/event005078.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005076.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0219/run005079/event005079.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005076.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0219/run005080/event005080.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005076.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0219/run005082/event005082.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005081.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0219/run005083/event005083.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005081.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0220/run005084/event005084.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005081.dat &
wait
