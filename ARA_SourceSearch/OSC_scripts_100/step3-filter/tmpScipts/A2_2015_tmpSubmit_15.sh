#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0120/run004875/event004875.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004870.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0120/run004876/event004876.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004870.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0120/run004877/event004877.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004870.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0120/run004878/event004878.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004870.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0121/run004879/event004879.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004870.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0121/run004880/event004880.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004870.dat &
wait
