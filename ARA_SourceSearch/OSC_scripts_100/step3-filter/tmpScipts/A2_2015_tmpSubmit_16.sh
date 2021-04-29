#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0121/run004881/event004881.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004870.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0121/run004882/event004882.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004870.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0121/run004883/event004883.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004870.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0121/run004884/event004884.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004870.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0121/run004885/event004885.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004870.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0121/run004886/event004886.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004870.dat &
wait
