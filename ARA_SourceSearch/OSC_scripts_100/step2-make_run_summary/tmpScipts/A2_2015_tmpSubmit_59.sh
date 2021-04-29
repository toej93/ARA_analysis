#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0401/run005354/event005354.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005353.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0401/run005355/event005355.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005353.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0402/run005356/event005356.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005353.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0402/run005357/event005357.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005353.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0402/run005359/event005359.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005358.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0403/run005360/event005360.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005358.dat &
wait
