#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2304/event2304.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002286/pedestalValues.run002286.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2306/event2306.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002286/pedestalValues.run002286.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2307/event2307.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002286/pedestalValues.run002286.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2308/event2308.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002286/pedestalValues.run002286.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2309/event2309.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002286/pedestalValues.run002286.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2311/event2311.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002310/pedestalValues.run002310.dat &
wait
