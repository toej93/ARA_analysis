#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0529/run005646/event005646.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005643.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0529/run005647/event005647.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005643.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0530/run005649/event005649.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005648.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0530/run005650/event005650.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005648.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0530/run005651/event005651.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005648.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0530/run005652/event005652.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005648.dat &
wait
