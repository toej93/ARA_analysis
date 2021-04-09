#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0906/run007882/event007882.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007878.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0906/run007883/event007883.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007878.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0906/run007884/event007884.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007878.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0907/run007885/event007885.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007878.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0907/run007886/event007886.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007878.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0907/run007888/event007888.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007887.dat &
wait
