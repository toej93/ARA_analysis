#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1024/run008133/event008133.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008132.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1024/run008134/event008134.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008132.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1024/run008135/event008135.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008132.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1025/run008136/event008136.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008132.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1025/run008138/event008138.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008137.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1025/run008139/event008139.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008137.dat &
wait
