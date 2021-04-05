#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0304/run003187/event003187.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003137.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0304/run003188/event003188.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003137.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0304/run003189/event003189.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003137.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0304/run003192/event003192.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003190.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0305/run003191/event003191.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003190.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0305/run003193/event003193.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003190.dat &
wait
