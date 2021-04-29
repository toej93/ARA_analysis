#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1654/event1654.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001643/pedestalValues.run001643.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1655/event1655.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001643/pedestalValues.run001643.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1657/event1657.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001656/pedestalValues.run001656.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1658/event1658.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001656/pedestalValues.run001656.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1659/event1659.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001656/pedestalValues.run001656.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1660/event1660.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001656/pedestalValues.run001656.dat &
wait
