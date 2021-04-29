#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0222/run006916/event006916.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006914.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0223/run006917/event006917.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006914.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0223/run006918/event006918.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006914.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0223/run006920/event006920.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006919.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0223/run006921/event006921.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006919.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0224/run006922/event006922.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006919.dat &
wait
