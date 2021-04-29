#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2408/event2408.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002395/pedestalValues.run002395.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2409/event2409.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002395/pedestalValues.run002395.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2411/event2411.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002410/pedestalValues.run002410.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2412/event2412.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002410/pedestalValues.run002410.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2413/event2413.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002410/pedestalValues.run002410.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run2414/event2414.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002410/pedestalValues.run002410.dat &
wait
