#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0928/run004198/event004198.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004195.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0928/run004209/event004209.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004205.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0929/run004203/event004203.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004200.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0929/run004208/event004208.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004205.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0930/run004207/event004207.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004205.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0930/run004219/event004219.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004215.dat &
wait
