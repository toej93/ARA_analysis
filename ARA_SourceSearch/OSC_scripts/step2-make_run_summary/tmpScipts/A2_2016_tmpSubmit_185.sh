#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1108/run008208/event008208.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008205.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1108/run008209/event008209.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008205.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1109/run008211/event008211.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008210.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1109/run008213/event008213.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008210.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1109/run008214/event008214.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008210.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1110/run008215/event008215.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008210.dat &
wait
