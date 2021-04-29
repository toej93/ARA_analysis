#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2090/event2090.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002046/pedestalValues.run002046.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2091/event2091.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002046/pedestalValues.run002046.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2092/event2092.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002046/pedestalValues.run002046.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2094/event2094.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002093/pedestalValues.run002093.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2095/event2095.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002093/pedestalValues.run002093.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2096/event2096.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002093/pedestalValues.run002093.dat &
wait
