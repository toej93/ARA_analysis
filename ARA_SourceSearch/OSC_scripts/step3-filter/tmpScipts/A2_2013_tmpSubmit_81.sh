#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2105/event2105.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002103/pedestalValues.run002103.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2110/event2110.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002103/pedestalValues.run002103.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2116/event2116.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002103/pedestalValues.run002103.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2117/event2117.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002103/pedestalValues.run002103.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2118/event2118.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002103/pedestalValues.run002103.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2119/event2119.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002103/pedestalValues.run002103.dat &
wait
