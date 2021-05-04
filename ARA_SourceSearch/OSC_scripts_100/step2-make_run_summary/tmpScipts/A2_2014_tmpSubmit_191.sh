#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1127/run004593/event004593.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004591.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1128/run004594/event004594.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004591.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1128/run004595/event004595.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004591.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1128/run004597/event004597.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004596.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1201/run004610/event004610.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004596.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1202/run004613/event004613.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004596.dat &
wait