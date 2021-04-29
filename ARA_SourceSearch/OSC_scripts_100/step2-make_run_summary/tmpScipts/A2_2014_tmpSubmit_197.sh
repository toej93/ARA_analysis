#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1210/run004655/event004655.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004654.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1210/run004656/event004656.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004654.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1210/run004657/event004657.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004654.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1211/run004658/event004658.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004654.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1211/run004660/event004660.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004659.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1230/run002813/event002813.root  &
wait
