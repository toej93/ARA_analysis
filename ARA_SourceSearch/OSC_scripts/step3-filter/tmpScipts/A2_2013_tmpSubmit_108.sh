#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2341/event2341.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002310/pedestalValues.run002310.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2342/event2342.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002310/pedestalValues.run002310.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2343/event2343.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002310/pedestalValues.run002310.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2344/event2344.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002310/pedestalValues.run002310.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2346/event2346.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002310/pedestalValues.run002310.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2347/event2347.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002310/pedestalValues.run002310.dat &
wait
