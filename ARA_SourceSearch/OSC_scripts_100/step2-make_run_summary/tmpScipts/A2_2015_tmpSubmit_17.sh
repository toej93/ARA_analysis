#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0128/run004972/event004972.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004971.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0128/run004973/event004973.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004971.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0129/run004974/event004974.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004971.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0129/run004975/event004975.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004971.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0129/run004977/event004977.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004976.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0129/run004978/event004978.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004976.dat &
wait
