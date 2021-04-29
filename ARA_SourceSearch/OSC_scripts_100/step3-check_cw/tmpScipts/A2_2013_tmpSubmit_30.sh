#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1677/event1677.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001676/pedestalValues.run001676.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1678/event1678.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001676/pedestalValues.run001676.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1679/event1679.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001676/pedestalValues.run001676.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1680/event1680.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001676/pedestalValues.run001676.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1682/event1682.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001681/pedestalValues.run001681.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1683/event1683.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001681/pedestalValues.run001681.dat &
wait
