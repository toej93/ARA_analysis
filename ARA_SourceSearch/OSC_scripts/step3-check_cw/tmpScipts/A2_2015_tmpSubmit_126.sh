#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0604/run005675/event005675.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005673.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0604/run005676/event005676.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005673.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0604/run005677/event005677.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005673.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0605/run005679/event005679.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005678.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0605/run005680/event005680.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005678.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0605/run005681/event005681.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005678.dat &
wait
