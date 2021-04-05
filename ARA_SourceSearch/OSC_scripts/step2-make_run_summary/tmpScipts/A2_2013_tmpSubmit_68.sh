#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1999/event1999.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001996/pedestalValues.run001996.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2000/event2000.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001996/pedestalValues.run001996.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2002/event2002.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001996/pedestalValues.run001996.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2003/event2003.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001996/pedestalValues.run001996.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2004/event2004.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001996/pedestalValues.run001996.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2005/event2005.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001996/pedestalValues.run001996.dat &
wait
