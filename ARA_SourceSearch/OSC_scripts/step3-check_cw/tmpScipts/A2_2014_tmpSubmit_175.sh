#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1009/run004348/event004348.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004345.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1009/run004349/event004349.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004345.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1009/run004351/event004351.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004350.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1010/run004352/event004352.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004350.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1010/run004353/event004353.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004350.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1012/run004361/event004361.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004360.dat &
wait
