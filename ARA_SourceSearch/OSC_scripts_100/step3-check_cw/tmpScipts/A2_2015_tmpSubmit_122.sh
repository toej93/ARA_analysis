#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0529/run005645/event005645.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005643.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0529/run005646/event005646.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005643.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0529/run005647/event005647.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005643.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0530/run005649/event005649.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005648.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0530/run005650/event005650.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005648.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0530/run005651/event005651.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005648.dat &
wait
