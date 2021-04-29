#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2356/event2356.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002310/pedestalValues.run002310.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2357/event2357.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002310/pedestalValues.run002310.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2358/event2358.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002310/pedestalValues.run002310.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2359/event2359.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002310/pedestalValues.run002310.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2361/event2361.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002310/pedestalValues.run002310.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2362/event2362.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002310/pedestalValues.run002310.dat &
wait
