#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0604/run003705/event003705.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003698.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0604/run003706/event003706.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003698.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0604/run003707/event003707.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003698.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0604/run003708/event003708.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003698.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0605/run003710/event003710.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003709.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0605/run003711/event003711.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003709.dat &
wait
