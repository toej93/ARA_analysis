#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0317/run005279/event005279.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005206.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0317/run005280/event005280.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005206.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0318/run005281/event005281.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005206.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0318/run005282/event005282.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005206.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0318/run005284/event005284.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005283.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0318/run005285/event005285.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005283.dat &
wait
