#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1029/run006406/event006406.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006404.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1029/run006407/event006407.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006404.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1029/run006408/event006408.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006404.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1029/run006410/event006410.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006409.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1030/run006411/event006411.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006409.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1030/run006412/event006412.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006409.dat &
wait
