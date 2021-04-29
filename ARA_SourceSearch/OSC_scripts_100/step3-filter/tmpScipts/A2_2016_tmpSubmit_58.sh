#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0430/run007188/event007188.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007185.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0501/run007189/event007189.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007185.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0501/run007191/event007191.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007190.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0501/run007192/event007192.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007190.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0501/run007193/event007193.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007190.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0502/run007194/event007194.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007190.dat &
wait
