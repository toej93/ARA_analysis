#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0115/run004847/event004847.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004846.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0115/run004848/event004848.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004846.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0116/run004849/event004849.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004846.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0116/run004850/event004850.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004846.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0116/run004851/event004851.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004846.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0116/run004853/event004853.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004846.dat &
wait
