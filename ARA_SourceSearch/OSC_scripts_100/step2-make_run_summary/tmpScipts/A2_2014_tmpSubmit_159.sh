#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1009/run004349/event004349.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004345.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1009/run004351/event004351.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004350.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1009/run004352/event004352.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004350.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1010/run004353/event004353.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004350.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1010/run004354/event004354.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004350.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1010/run004356/event004356.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004355.dat &
wait
