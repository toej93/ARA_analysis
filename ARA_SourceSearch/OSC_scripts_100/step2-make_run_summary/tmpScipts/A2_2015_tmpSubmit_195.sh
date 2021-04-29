#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1024/run006383/event006383.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006379.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1024/run006385/event006385.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006384.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1025/run006386/event006386.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006384.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1025/run006387/event006387.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006384.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1025/run006388/event006388.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006384.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1025/run006390/event006390.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006389.dat &
wait
