#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1521/event1521.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001517/pedestalValues.run001517.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1523/event1523.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001522/pedestalValues.run001522.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1524/event1524.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001522/pedestalValues.run001522.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1525/event1525.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001522/pedestalValues.run001522.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1526/event1526.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001522/pedestalValues.run001522.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1528/event1528.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001527/pedestalValues.run001527.dat &
wait
