#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1110/run008216/event008216.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008210.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1110/run008217/event008217.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008210.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1110/run008219/event008219.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008218.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1111/run008220/event008220.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008218.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1111/run008221/event008221.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008218.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1111/run008222/event008222.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008218.dat &
wait
