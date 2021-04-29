#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0606/run005683/event005683.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005678.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0606/run005684/event005684.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005678.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0606/run005685/event005685.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005678.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0606/run005686/event005686.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005678.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0607/run005687/event005687.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005678.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0607/run005689/event005689.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005688.dat &
wait
