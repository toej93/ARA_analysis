#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1924/event1924.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001921/pedestalValues.run001921.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1925/event1925.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001921/pedestalValues.run001921.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1927/event1927.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001921/pedestalValues.run001921.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1928/event1928.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001921/pedestalValues.run001921.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1929/event1929.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001921/pedestalValues.run001921.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1930/event1930.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001921/pedestalValues.run001921.dat &
wait
