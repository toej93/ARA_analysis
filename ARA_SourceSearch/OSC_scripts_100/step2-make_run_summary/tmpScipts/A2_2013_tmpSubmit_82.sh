#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2120/event2120.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002103/pedestalValues.run002103.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2122/event2122.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002103/pedestalValues.run002103.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2123/event2123.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002103/pedestalValues.run002103.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2124/event2124.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002103/pedestalValues.run002103.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2125/event2125.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002103/pedestalValues.run002103.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2127/event2127.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002103/pedestalValues.run002103.dat &
wait
