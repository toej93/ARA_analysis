#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0526/run005630/event005630.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005628.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0526/run005631/event005631.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005628.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0526/run005632/event005632.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005628.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0527/run005634/event005634.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005633.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0527/run005635/event005635.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005633.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0527/run005636/event005636.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005633.dat &
wait
