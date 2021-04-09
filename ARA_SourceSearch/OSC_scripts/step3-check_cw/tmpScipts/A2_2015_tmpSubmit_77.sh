#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0323/run005307/event005307.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005303.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0323/run005309/event005309.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005308.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0323/run005310/event005310.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005308.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0324/run005311/event005311.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005308.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0324/run005312/event005312.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005308.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0324/run005314/event005314.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005313.dat &
wait
