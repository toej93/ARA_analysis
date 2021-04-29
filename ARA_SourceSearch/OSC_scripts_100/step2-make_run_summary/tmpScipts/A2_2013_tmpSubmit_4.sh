#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1476/event1476.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001472/pedestalValues.run001472.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1478/event1478.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001477/pedestalValues.run001477.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1479/event1479.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001477/pedestalValues.run001477.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1480/event1480.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001477/pedestalValues.run001477.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1481/event1481.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001477/pedestalValues.run001477.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1483/event1483.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001482/pedestalValues.run001482.dat &
wait
