#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1566/event1566.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001564/pedestalValues.run001564.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1567/event1567.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001564/pedestalValues.run001564.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1568/event1568.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001564/pedestalValues.run001564.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1570/event1570.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001564/pedestalValues.run001564.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1571/event1571.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001564/pedestalValues.run001564.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1572/event1572.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001564/pedestalValues.run001564.dat &
wait
