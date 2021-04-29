#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2304/event2304.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002286/pedestalValues.run002286.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2306/event2306.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002286/pedestalValues.run002286.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2307/event2307.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002286/pedestalValues.run002286.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2308/event2308.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002286/pedestalValues.run002286.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2309/event2309.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002286/pedestalValues.run002286.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2311/event2311.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002310/pedestalValues.run002310.dat &
wait
