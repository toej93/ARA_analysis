#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/1004/run008026/event008026.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008024.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/1004/run008027/event008027.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008024.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/1004/run008028/event008028.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008024.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/1004/run008030/event008030.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008029.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/1005/run008031/event008031.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008029.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/1005/run008032/event008032.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008029.dat &
wait
