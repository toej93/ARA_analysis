#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1626/event1626.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001615/pedestalValues.run001615.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1627/event1627.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001615/pedestalValues.run001615.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1628/event1628.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001615/pedestalValues.run001615.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1629/event1629.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001615/pedestalValues.run001615.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1631/event1631.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001615/pedestalValues.run001615.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1632/event1632.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001615/pedestalValues.run001615.dat &
wait
