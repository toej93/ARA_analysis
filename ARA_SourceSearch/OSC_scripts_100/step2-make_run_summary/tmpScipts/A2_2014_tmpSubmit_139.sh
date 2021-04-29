#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0825/run004122/event004122.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004118.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0825/run004124/event004124.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004123.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0825/run004125/event004125.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004123.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0825/run004126/event004126.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004123.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0826/run004127/event004127.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004123.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0826/run004129/event004129.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004128.dat &
wait
