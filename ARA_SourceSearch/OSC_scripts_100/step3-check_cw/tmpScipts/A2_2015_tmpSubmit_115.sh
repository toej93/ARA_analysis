#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0518/run005592/event005592.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005588.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0518/run005594/event005594.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005593.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0519/run005595/event005595.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005593.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0519/run005596/event005596.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005593.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0519/run005597/event005597.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005593.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0519/run005599/event005599.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005598.dat &
wait
