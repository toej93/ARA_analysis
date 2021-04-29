#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0511/run003558/event003558.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003556.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0512/run003559/event003559.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003556.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0512/run003560/event003560.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003556.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0512/run003562/event003562.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003561.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0512/run003563/event003563.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003561.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0513/run003569/event003569.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003561.dat &
wait
