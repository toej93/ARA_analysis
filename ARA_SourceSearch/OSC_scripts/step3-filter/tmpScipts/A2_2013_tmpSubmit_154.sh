#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2756/event2756.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002753/pedestalValues.run002753.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2757/event2757.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002753/pedestalValues.run002753.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2759/event2759.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002753/pedestalValues.run002753.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2760/event2760.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002753/pedestalValues.run002753.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2762/event2762.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002753/pedestalValues.run002753.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2763/event2763.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002753/pedestalValues.run002753.dat &
wait
