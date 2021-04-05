#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=01:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0809/run006005/event006005.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006003.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0810/run006006/event006006.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006003.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0810/run006007/event006007.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006003.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0810/run006009/event006009.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006008.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0810/run006010/event006010.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006008.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0811/run006011/event006011.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006008.dat &
wait
