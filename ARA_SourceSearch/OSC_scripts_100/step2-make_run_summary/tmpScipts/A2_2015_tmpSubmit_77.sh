#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0428/run005489/event005489.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005488.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0428/run005490/event005490.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005488.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0429/run005491/event005491.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005488.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0429/run005492/event005492.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005488.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0429/run005494/event005494.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005493.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0429/run005495/event005495.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005493.dat &
wait
