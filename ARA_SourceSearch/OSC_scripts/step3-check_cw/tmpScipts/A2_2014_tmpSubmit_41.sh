#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0307/run003202/event003202.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003200.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0307/run003203/event003203.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003200.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0307/run003204/event003204.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003200.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0308/run003206/event003206.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003205.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0308/run003207/event003207.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003205.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0308/run003208/event003208.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003205.dat &
wait
