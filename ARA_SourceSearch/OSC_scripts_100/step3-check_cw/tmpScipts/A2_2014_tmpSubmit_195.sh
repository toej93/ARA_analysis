#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1030/run004453/event004453.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004450.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1031/run004454/event004454.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004450.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1031/run004456/event004456.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004455.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1031/run004457/event004457.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004455.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1031/run004458/event004458.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004455.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1101/run004356/event004356.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004355.dat &
wait
