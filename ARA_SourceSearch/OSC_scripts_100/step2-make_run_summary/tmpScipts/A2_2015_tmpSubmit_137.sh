#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0727/run005939/event005939.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005938.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0727/run005940/event005940.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005938.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0728/run005941/event005941.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005938.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0728/run005942/event005942.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005938.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0728/run005944/event005944.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005943.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0728/run005945/event005945.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005943.dat &
wait
