#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1499/event1499.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001497/pedestalValues.run001497.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1500/event1500.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001497/pedestalValues.run001497.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1501/event1501.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001497/pedestalValues.run001497.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1503/event1503.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001502/pedestalValues.run001502.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1504/event1504.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001502/pedestalValues.run001502.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1505/event1505.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001502/pedestalValues.run001502.dat &
wait
