#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0629/run005802/event005802.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005798.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0630/run005804/event005804.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005803.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0630/run005805/event005805.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005803.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0630/run005806/event005806.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005803.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0630/run005807/event005807.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005803.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0701/run005809/event005809.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005808.dat &
wait
