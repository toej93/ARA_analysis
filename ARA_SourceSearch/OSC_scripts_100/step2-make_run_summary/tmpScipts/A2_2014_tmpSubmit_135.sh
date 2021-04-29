#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0818/run004092/event004092.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004088.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0819/run004094/event004094.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004093.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0819/run004095/event004095.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004093.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0819/run004096/event004096.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004093.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0819/run004097/event004097.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004093.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0820/run004099/event004099.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004098.dat &
wait
