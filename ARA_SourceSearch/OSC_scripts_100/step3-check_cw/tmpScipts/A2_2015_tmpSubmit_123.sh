#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0530/run005652/event005652.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005648.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0531/run005654/event005654.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005653.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0531/run005655/event005655.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005653.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0531/run005656/event005656.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005653.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0531/run005657/event005657.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005653.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0601/run005659/event005659.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005658.dat &
wait
