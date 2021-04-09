#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0215/run005063/event005063.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005061.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0216/run005064/event005064.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005061.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0216/run005065/event005065.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005061.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0216/run005067/event005067.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005066.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0216/run005068/event005068.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005066.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0217/run005069/event005069.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005066.dat &
wait
