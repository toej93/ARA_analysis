#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0826/run004130/event004130.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004128.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0826/run004131/event004131.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004128.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0827/run004132/event004132.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004128.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0827/run004134/event004134.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004133.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0827/run004135/event004135.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004133.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0827/run004136/event004136.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004133.dat &
wait
