#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0531/run005654/event005654.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005653.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0531/run005655/event005655.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005653.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0531/run005656/event005656.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005653.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0531/run005657/event005657.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005653.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0601/run005659/event005659.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005658.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0601/run005660/event005660.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005658.dat &
wait
