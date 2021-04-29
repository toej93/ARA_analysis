#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0308/run005167/event005167.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005166.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0309/run005168/event005168.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005166.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0309/run005169/event005169.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005166.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0309/run005170/event005170.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005166.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0309/run005172/event005172.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005171.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0310/run005173/event005173.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005171.dat &
wait
