#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0619/run005751/event005751.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005748.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0619/run005752/event005752.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005748.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0620/run005754/event005754.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005753.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0620/run005755/event005755.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005753.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0620/run005756/event005756.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005753.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0620/run005757/event005757.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005753.dat &
wait
