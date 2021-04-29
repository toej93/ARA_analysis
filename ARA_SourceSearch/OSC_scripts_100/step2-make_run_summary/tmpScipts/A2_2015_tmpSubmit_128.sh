#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0713/run005871/event005871.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005868.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0714/run005872/event005872.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005868.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0714/run005874/event005874.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005873.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0714/run005875/event005875.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005873.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0714/run005876/event005876.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005873.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0715/run005877/event005877.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005873.dat &
wait
