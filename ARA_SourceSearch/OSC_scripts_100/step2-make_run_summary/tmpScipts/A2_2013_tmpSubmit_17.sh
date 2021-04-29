#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1573/event1573.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001564/pedestalValues.run001564.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1575/event1575.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001564/pedestalValues.run001564.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1576/event1576.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001564/pedestalValues.run001564.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1577/event1577.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001564/pedestalValues.run001564.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1578/event1578.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001564/pedestalValues.run001564.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1580/event1580.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001564/pedestalValues.run001564.dat &
wait
