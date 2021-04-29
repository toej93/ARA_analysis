#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0111/run004817/event004817.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004816.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0112/run004819/event004819.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004816.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0112/run004820/event004820.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004816.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0112/run004821/event004821.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004816.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0112/run004822/event004822.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004816.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0112/run004823/event004823.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004816.dat &
wait
