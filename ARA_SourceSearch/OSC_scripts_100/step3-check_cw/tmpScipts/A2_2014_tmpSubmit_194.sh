#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1030/run004332/event004332.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004330.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1030/run004333/event004333.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004330.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1030/run004334/event004334.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004330.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1030/run004449/event004449.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004445.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1030/run004451/event004451.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004450.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1030/run004452/event004452.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004450.dat &
wait
