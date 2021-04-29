#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0110/run004810/event004810.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004806.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0110/run004812/event004812.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004811.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0110/run004813/event004813.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004811.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0111/run004814/event004814.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004811.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0111/run004815/event004815.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004811.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0111/run004817/event004817.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004816.dat &
wait
