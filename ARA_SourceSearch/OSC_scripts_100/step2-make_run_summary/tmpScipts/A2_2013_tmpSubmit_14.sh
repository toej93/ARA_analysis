#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1551/event1551.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001527/pedestalValues.run001527.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1552/event1552.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001527/pedestalValues.run001527.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1553/event1553.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001527/pedestalValues.run001527.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1555/event1555.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001527/pedestalValues.run001527.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1556/event1556.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001527/pedestalValues.run001527.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1557/event1557.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001527/pedestalValues.run001527.dat &
wait
