#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0101/run004765/event004765.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004764.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0101/run004766/event004766.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004764.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0101/run004767/event004767.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004764.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0101/run004768/event004768.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004764.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0102/run004769/event004769.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004764.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0102/run004770/event004770.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004764.dat &
wait
