#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1109/run006473/event006473.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006469.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1109/run006478/event006478.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006474.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1109/run006480/event006480.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006479.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1109/run006481/event006481.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006479.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1125/run000003/event000003.root  &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/1127/run000011/event000011.root  &
wait
