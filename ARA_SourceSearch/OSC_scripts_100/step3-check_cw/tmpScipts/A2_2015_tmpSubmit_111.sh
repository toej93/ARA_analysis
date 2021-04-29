#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0512/run005562/event005562.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005558.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0512/run005564/event005564.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005563.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0513/run005565/event005565.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005563.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0513/run005566/event005566.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005563.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0513/run005567/event005567.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005563.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0513/run005569/event005569.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005568.dat &
wait
