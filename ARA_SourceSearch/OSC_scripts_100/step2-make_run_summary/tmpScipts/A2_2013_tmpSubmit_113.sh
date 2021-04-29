#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2378/event2378.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002375/pedestalValues.run002375.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2379/event2379.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002375/pedestalValues.run002375.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2381/event2381.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002380/pedestalValues.run002380.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2382/event2382.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002380/pedestalValues.run002380.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2383/event2383.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002380/pedestalValues.run002380.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2384/event2384.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002380/pedestalValues.run002380.dat &
wait
