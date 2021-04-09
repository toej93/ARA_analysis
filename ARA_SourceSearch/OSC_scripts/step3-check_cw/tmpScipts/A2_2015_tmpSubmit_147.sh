#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0705/run005832/event005832.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005828.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0706/run005834/event005834.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005833.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0706/run005835/event005835.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005833.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0706/run005836/event005836.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005833.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0707/run005837/event005837.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005833.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0707/run005839/event005839.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005838.dat &
wait
