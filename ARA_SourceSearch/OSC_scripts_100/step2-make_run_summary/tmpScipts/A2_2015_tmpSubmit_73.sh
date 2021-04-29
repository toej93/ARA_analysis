#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0422/run005459/event005459.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005458.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0422/run005460/event005460.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005458.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0422/run005461/event005461.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005458.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0423/run005462/event005462.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005458.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0423/run005464/event005464.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005463.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0423/run005465/event005465.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005463.dat &
wait
