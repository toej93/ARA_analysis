#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0815/run004077/event004077.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004075.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0815/run004078/event004078.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004075.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0816/run004079/event004079.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004075.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0816/run004081/event004081.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004080.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0816/run004083/event004083.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004080.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0817/run004084/event004084.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004080.dat &
wait
