#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0203/run006817/event006817.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006816.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0203/run006818/event006818.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006816.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0203/run006819/event006819.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006816.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0204/run006820/event006820.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006816.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0204/run006822/event006822.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006821.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0204/run006823/event006823.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006821.dat &
wait
