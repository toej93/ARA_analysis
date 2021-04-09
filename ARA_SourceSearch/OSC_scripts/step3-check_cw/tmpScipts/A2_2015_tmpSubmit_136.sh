#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0619/run005750/event005750.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005748.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0619/run005751/event005751.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005748.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0619/run005752/event005752.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005748.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0620/run005754/event005754.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005753.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0620/run005755/event005755.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005753.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0620/run005756/event005756.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005753.dat &
wait
