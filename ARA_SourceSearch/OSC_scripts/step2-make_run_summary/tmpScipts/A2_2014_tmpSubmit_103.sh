#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0531/run003677/event003677.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003676.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0531/run003678/event003678.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003676.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0531/run003679/event003679.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003676.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0531/run003680/event003680.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003676.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0601/run003682/event003682.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003681.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0601/run003683/event003683.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003681.dat &
wait
