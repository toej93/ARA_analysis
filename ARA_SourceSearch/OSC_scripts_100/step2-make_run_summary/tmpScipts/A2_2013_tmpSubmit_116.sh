#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2401/event2401.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002395/pedestalValues.run002395.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2402/event2402.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002395/pedestalValues.run002395.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2403/event2403.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002395/pedestalValues.run002395.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2404/event2404.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002395/pedestalValues.run002395.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2406/event2406.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002395/pedestalValues.run002395.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2407/event2407.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002395/pedestalValues.run002395.dat &
wait
