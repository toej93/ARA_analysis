#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2711/event2711.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002685/pedestalValues.run002685.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2712/event2712.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002685/pedestalValues.run002685.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2713/event2713.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002685/pedestalValues.run002685.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2714/event2714.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002685/pedestalValues.run002685.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2716/event2716.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002715/pedestalValues.run002715.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2013/run2717/event2717.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2013/run_002715/pedestalValues.run002715.dat &
wait
