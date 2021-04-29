#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1596/event1596.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001589/pedestalValues.run001589.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1597/event1597.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001589/pedestalValues.run001589.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1598/event1598.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001589/pedestalValues.run001589.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1600/event1600.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001599/pedestalValues.run001599.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1601/event1601.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001599/pedestalValues.run001599.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run1602/event1602.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_001599/pedestalValues.run001599.dat &
wait
