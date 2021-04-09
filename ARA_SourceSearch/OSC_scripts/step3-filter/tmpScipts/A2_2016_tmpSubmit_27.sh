#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0212/run006863/event006863.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006859.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0212/run006865/event006865.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006864.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0212/run006866/event006866.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006864.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0213/run006867/event006867.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006864.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0213/run006868/event006868.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006864.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0213/run006870/event006870.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006869.dat &
wait
