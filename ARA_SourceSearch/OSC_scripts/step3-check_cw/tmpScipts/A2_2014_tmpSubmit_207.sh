#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1116/run004537/event004537.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004535.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1116/run004538/event004538.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004535.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1117/run004539/event004539.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004535.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1117/run004541/event004541.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004540.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1117/run004542/event004542.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004540.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1117/run004543/event004543.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004540.dat &
wait
