#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0305/run005153/event005153.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005151.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0306/run005154/event005154.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005151.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0306/run005155/event005155.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005151.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0306/run005157/event005157.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005156.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0306/run005158/event005158.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005156.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0307/run005159/event005159.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005156.dat &
wait
