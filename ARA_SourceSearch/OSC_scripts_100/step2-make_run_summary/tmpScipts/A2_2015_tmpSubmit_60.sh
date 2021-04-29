#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0403/run005361/event005361.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005358.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0403/run005362/event005362.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005358.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0403/run005364/event005364.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005363.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0403/run005365/event005365.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005363.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0403/run005366/event005366.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005363.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0404/run005367/event005367.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005363.dat &
wait
