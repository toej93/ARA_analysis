#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0221/run006909/event006909.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006906.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0221/run006910/event006910.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006906.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0221/run006911/event006911.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006906.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0222/run006912/event006912.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006906.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0222/run006913/event006913.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006906.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2016/0222/run006915/event006915.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006914.dat &
wait
