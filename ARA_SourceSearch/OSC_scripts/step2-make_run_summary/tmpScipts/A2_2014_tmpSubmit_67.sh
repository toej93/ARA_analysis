#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0409/run003394/event003394.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003391.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0409/run003395/event003395.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003391.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0409/run003397/event003397.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003396.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0409/run003398/event003398.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003396.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0410/run003399/event003399.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003396.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0410/run003400/event003400.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003396.dat &
wait
