#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0112/run004832/event004832.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004816.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0112/run004833/event004833.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004816.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0113/run004834/event004834.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004816.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0113/run004835/event004835.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004816.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0113/run004837/event004837.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004836.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0113/run004838/event004838.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run004836.dat &
wait
