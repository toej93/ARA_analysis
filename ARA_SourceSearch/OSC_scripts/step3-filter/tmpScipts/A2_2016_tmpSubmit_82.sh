#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0606/run007405/event007405.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007365.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0607/run007406/event007406.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007365.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0607/run007407/event007407.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007365.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0607/run007408/event007408.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007365.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0607/run007409/event007409.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007365.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0607/run007410/event007410.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007365.dat &
wait
