#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0210/run003025/event003025.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003021.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0210/run003027/event003027.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003026.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0211/run002858/event002858.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002857.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0211/run002859/event002859.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002857.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0211/run002860/event002860.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002857.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0211/run002861/event002861.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002857.dat &
wait
