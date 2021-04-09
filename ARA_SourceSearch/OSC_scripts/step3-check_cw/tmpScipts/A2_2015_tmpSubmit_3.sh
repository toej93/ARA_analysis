#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0105/run004787/event004787.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004786.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0105/run004788/event004788.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004786.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0106/run004789/event004789.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004786.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0106/run004790/event004790.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004786.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0106/run004792/event004792.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004791.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0106/run004793/event004793.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004791.dat &
wait
