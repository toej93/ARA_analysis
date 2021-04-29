#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1121/run004560/event004560.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004556.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1121/run004562/event004562.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004561.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1121/run004563/event004563.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004561.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1122/run004564/event004564.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004561.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1122/run004565/event004565.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004561.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1122/run004567/event004567.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004566.dat &
wait
