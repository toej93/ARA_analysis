#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0317/run005272/event005272.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005206.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0317/run005273/event005273.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005206.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0317/run005274/event005274.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005206.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0317/run005275/event005275.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005206.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0317/run005276/event005276.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005206.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0317/run005277/event005277.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005206.dat &
wait
