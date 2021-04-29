#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1001/run004312/event004312.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004310.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1002/run004313/event004313.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004310.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1002/run004314/event004314.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004310.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1002/run004316/event004316.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004315.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1002/run004317/event004317.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004315.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/1003/run004318/event004318.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004315.dat &
wait
