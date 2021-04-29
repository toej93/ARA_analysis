#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1119/run004553/event004553.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004545.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1120/run004554/event004554.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004545.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1120/run004555/event004555.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004545.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1120/run004557/event004557.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004556.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1120/run004558/event004558.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004556.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1121/run004559/event004559.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004556.dat &
wait
