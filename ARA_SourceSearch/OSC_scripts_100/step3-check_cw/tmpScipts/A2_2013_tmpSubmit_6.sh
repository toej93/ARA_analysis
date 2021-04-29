#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1491/event1491.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001487/pedestalValues.run001487.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1493/event1493.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001492/pedestalValues.run001492.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1494/event1494.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001492/pedestalValues.run001492.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1495/event1495.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001492/pedestalValues.run001492.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1496/event1496.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001492/pedestalValues.run001492.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1498/event1498.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001497/pedestalValues.run001497.dat &
wait
