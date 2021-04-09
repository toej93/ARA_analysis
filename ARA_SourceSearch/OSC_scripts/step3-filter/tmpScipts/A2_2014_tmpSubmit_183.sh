#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1022/run004283/event004283.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004280.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1022/run004284/event004284.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004280.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1022/run004286/event004286.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004285.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1022/run004409/event004409.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004405.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1022/run004411/event004411.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004410.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1022/run004412/event004412.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004410.dat &
wait
