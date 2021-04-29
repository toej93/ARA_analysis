#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0405/run005376/event005376.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005373.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0406/run005377/event005377.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005373.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0406/run005379/event005379.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005378.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0406/run005380/event005380.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005378.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0406/run005381/event005381.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005378.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0407/run005382/event005382.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005378.dat &
wait
