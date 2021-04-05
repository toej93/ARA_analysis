#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2128/event2128.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002103/pedestalValues.run002103.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2129/event2129.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002103/pedestalValues.run002103.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2130/event2130.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002103/pedestalValues.run002103.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2132/event2132.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002131/pedestalValues.run002131.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2133/event2133.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002131/pedestalValues.run002131.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2134/event2134.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002131/pedestalValues.run002131.dat &
wait
