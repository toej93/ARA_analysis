#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2468/event2468.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002455/pedestalValues.run002455.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2469/event2469.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002455/pedestalValues.run002455.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2471/event2471.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002455/pedestalValues.run002455.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2472/event2472.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002455/pedestalValues.run002455.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2487/event2487.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002455/pedestalValues.run002455.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2488/event2488.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002455/pedestalValues.run002455.dat &
wait
