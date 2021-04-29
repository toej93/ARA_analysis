#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0725/run005931/event005931.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005928.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0726/run005932/event005932.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005928.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0726/run005934/event005934.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005933.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0726/run005935/event005935.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005933.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0726/run005936/event005936.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005933.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0727/run005937/event005937.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005933.dat &
wait
