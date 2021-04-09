#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0117/run004861/event004861.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004860.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0117/run004862/event004862.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004860.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0117/run004863/event004863.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004860.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0118/run004864/event004864.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004860.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0118/run004866/event004866.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004865.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0118/run004867/event004867.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004865.dat &
wait
