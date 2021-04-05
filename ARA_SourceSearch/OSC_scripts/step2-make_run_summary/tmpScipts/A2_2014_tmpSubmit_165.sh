#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0914/run004158/event004158.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004155.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0915/run004159/event004159.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004155.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0915/run004166/event004166.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004160.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0915/run004206/event004206.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004205.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0916/run004151/event004151.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004138.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0916/run004167/event004167.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004160.dat &
wait
