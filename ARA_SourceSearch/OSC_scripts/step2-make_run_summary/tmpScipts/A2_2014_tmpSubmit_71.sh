#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0415/run003424/event003424.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003421.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0415/run003425/event003425.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003421.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0416/run003427/event003427.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003426.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0416/run003428/event003428.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003426.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0416/run003429/event003429.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003426.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0416/run003430/event003430.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003426.dat &
wait
