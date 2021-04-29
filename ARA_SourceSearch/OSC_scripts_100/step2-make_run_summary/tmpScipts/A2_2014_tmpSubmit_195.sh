#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1206/run004636/event004636.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004633.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1207/run004637/event004637.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004633.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1207/run004639/event004639.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004638.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1207/run004640/event004640.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004638.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1207/run004641/event004641.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004638.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1208/run004642/event004642.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004638.dat &
wait
