#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2772/event2772.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002753/pedestalValues.run002753.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2774/event2774.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002753/pedestalValues.run002753.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2775/event2775.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002753/pedestalValues.run002753.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2776/event2776.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002753/pedestalValues.run002753.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2777/event2777.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002753/pedestalValues.run002753.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2779/event2779.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002778/pedestalValues.run002778.dat &
wait
