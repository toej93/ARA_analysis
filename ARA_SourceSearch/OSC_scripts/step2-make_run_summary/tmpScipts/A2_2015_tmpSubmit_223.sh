#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1030/run006412/event006412.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006409.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1030/run006413/event006413.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006409.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1030/run006415/event006415.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006414.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1031/run006416/event006416.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006414.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1031/run006417/event006417.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006414.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1031/run006418/event006418.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006414.dat &
wait
