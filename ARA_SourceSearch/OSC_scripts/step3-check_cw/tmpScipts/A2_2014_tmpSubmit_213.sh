#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1126/run004583/event004583.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004581.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1127/run004587/event004587.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004581.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1127/run004588/event004588.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004581.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1127/run004589/event004589.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004581.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1127/run004590/event004590.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004581.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1128/run004592/event004592.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004591.dat &
wait
