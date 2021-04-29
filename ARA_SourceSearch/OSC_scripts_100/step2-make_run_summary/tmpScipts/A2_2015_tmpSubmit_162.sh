#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0904/run006131/event006131.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006129.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0904/run006132/event006132.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006129.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0904/run006133/event006133.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006129.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0904/run006135/event006135.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006134.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0905/run006136/event006136.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006134.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0905/run006137/event006137.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006134.dat &
wait
