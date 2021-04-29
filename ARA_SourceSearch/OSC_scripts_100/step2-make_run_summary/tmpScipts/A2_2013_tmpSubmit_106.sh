#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2326/event2326.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002310/pedestalValues.run002310.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2327/event2327.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002310/pedestalValues.run002310.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2328/event2328.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002310/pedestalValues.run002310.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2329/event2329.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002310/pedestalValues.run002310.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2331/event2331.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002310/pedestalValues.run002310.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2332/event2332.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002310/pedestalValues.run002310.dat &
wait
