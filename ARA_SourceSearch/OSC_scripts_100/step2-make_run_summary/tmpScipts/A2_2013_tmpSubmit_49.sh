#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1845/event1845.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001837/pedestalValues.run001837.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1846/event1846.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001837/pedestalValues.run001837.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1847/event1847.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001837/pedestalValues.run001837.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1848/event1848.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001837/pedestalValues.run001837.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1849/event1849.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001837/pedestalValues.run001837.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1850/event1850.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001837/pedestalValues.run001837.dat &
wait
