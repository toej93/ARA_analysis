#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0621/run007478/event007478.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007477.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0622/run007479/event007479.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007477.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0622/run007480/event007480.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007477.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0622/run007481/event007481.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007477.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0622/run007483/event007483.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007482.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0623/run007484/event007484.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007482.dat &
wait
