#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0123/run004949/event004949.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004946.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0124/run004950/event004950.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004946.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0124/run004952/event004952.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004951.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0124/run004953/event004953.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004951.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0124/run004954/event004954.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004951.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0125/run004955/event004955.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004951.dat &
wait
