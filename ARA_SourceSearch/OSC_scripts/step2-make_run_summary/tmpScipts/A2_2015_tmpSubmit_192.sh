#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0913/run006180/event006180.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006179.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0914/run006181/event006181.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006179.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0914/run006182/event006182.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006179.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0914/run006183/event006183.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006179.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0914/run006185/event006185.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006184.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0915/run006186/event006186.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006184.dat &
wait
