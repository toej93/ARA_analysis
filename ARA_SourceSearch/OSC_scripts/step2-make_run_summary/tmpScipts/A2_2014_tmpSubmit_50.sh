#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0320/run003269/event003269.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003265.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0320/run003271/event003271.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003270.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0321/run003272/event003272.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003270.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0321/run003273/event003273.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003270.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0321/run003274/event003274.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003270.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0321/run003276/event003276.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003275.dat &
wait
