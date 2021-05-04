#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2290/event2290.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002286/pedestalValues.run002286.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2292/event2292.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002286/pedestalValues.run002286.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2293/event2293.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002286/pedestalValues.run002286.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2294/event2294.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002286/pedestalValues.run002286.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2295/event2295.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002286/pedestalValues.run002286.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2303/event2303.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002286/pedestalValues.run002286.dat &
wait