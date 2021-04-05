#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0305/run003194/event003194.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003190.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0306/run003196/event003196.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003195.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0306/run003197/event003197.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003195.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0306/run003198/event003198.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003195.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0306/run003199/event003199.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003195.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0307/run003201/event003201.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003200.dat &
wait
