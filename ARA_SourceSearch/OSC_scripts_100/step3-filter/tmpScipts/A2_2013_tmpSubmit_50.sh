#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1851/event1851.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001837/pedestalValues.run001837.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1853/event1853.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001852/pedestalValues.run001852.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1854/event1854.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001852/pedestalValues.run001852.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1855/event1855.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001852/pedestalValues.run001852.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1856/event1856.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001852/pedestalValues.run001852.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1858/event1858.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001857/pedestalValues.run001857.dat &
wait
