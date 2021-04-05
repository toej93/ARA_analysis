#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1859/event1859.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001857/pedestalValues.run001857.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1860/event1860.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001857/pedestalValues.run001857.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1861/event1861.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001857/pedestalValues.run001857.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1863/event1863.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001857/pedestalValues.run001857.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1864/event1864.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001857/pedestalValues.run001857.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1865/event1865.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001857/pedestalValues.run001857.dat &
wait
