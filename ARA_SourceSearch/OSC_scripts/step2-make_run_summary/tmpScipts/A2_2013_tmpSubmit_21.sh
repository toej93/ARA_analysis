#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1603/event1603.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001599/pedestalValues.run001599.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1605/event1605.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001599/pedestalValues.run001599.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1606/event1606.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001599/pedestalValues.run001599.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1607/event1607.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001599/pedestalValues.run001599.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1608/event1608.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001599/pedestalValues.run001599.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1609/event1609.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001599/pedestalValues.run001599.dat &
wait
