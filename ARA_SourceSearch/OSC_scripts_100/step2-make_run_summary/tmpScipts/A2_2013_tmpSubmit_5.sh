#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=07:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1484/event1484.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001482/pedestalValues.run001482.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1485/event1485.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001482/pedestalValues.run001482.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1486/event1486.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001482/pedestalValues.run001482.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1488/event1488.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001487/pedestalValues.run001487.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1489/event1489.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001487/pedestalValues.run001487.dat &
./v2_analysis_run_summary ${ISSIM} ${STATION} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2013/run1490/event1490.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001487/pedestalValues.run001487.dat &
wait
