#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0219/run006900/event006900.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006896.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0220/run006902/event006902.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006901.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0220/run006903/event006903.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006901.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0220/run006904/event006904.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006901.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0220/run006905/event006905.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006901.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0220/run006907/event006907.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006906.dat &
wait
