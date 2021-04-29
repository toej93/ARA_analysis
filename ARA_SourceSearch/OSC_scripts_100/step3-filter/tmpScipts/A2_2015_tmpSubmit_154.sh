#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0716/run005885/event005885.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005883.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0716/run005886/event005886.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005883.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0717/run005887/event005887.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005883.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0717/run005889/event005889.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005888.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0717/run005890/event005890.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005888.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0717/run005891/event005891.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005888.dat &
wait
