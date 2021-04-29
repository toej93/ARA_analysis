#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0121/run004887/event004887.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004870.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0121/run004888/event004888.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004870.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0121/run004889/event004889.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004870.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0121/run004890/event004890.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004870.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0121/run004891/event004891.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004870.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0121/run004892/event004892.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004870.dat &
wait
