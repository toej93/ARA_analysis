#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0621/run003794/event003794.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003792.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0621/run003795/event003795.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003792.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0622/run003796/event003796.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003792.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0622/run003798/event003798.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003797.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0622/run003799/event003799.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003797.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0622/run003800/event003800.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003797.dat &
wait
