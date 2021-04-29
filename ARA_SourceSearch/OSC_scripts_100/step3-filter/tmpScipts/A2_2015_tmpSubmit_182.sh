#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0828/run006100/event006100.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006099.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0829/run006101/event006101.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006099.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0829/run006102/event006102.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006099.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0829/run006103/event006103.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006099.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0829/run006105/event006105.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006104.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0830/run006106/event006106.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006104.dat &
wait
