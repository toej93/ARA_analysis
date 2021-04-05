#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0704/run003854/event003854.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003853.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0704/run003855/event003855.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003853.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0704/run003856/event003856.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003853.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0704/run003857/event003857.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003853.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0705/run003859/event003859.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003858.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0705/run003860/event003860.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003858.dat &
wait
