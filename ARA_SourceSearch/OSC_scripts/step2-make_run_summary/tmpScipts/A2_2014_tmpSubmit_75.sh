#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0421/run003454/event003454.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003451.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0421/run003455/event003455.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003451.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0422/run003457/event003457.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003456.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0422/run003458/event003458.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003456.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0422/run003459/event003459.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003456.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0422/run003460/event003460.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003456.dat &
wait
