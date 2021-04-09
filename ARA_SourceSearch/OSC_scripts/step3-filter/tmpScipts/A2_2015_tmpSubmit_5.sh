#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0108/run004802/event004802.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004801.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0108/run004803/event004803.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004801.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0109/run004804/event004804.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004801.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0109/run004805/event004805.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004801.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0109/run004807/event004807.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004806.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0109/run004808/event004808.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004806.dat &
wait
