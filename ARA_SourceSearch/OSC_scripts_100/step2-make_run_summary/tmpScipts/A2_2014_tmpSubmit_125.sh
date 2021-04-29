#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0804/run004016/event004016.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004015.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0804/run004017/event004017.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004015.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0805/run004018/event004018.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004015.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0805/run004019/event004019.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004015.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0805/run004022/event004022.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004015.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0805/run004024/event004024.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004015.dat &
wait
