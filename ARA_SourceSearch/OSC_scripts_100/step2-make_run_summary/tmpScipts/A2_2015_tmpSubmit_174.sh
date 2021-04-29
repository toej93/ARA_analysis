#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0923/run006226/event006226.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006224.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0923/run006227/event006227.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006224.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0923/run006228/event006228.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006224.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0923/run006230/event006230.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006229.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0924/run006231/event006231.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006229.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0924/run006232/event006232.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006229.dat &
wait
