#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1208/run004645/event004645.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004643.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1209/run004649/event004649.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004643.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1209/run004650/event004650.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004643.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1210/run004651/event004651.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004643.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1210/run004652/event004652.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004643.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1210/run004653/event004653.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004643.dat &
wait
