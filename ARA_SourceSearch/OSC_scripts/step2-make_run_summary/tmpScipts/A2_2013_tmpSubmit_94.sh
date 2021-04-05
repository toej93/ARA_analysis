#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2230/event2230.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002196/pedestalValues.run002196.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2231/event2231.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002196/pedestalValues.run002196.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2232/event2232.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002196/pedestalValues.run002196.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2234/event2234.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002196/pedestalValues.run002196.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2235/event2235.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002196/pedestalValues.run002196.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2236/event2236.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002196/pedestalValues.run002196.dat &
wait
