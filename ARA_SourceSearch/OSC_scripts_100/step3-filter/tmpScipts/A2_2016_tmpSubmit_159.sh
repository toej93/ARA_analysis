#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0929/run008003/event008003.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run007999.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0929/run008005/event008005.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008004.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0930/run008006/event008006.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008004.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0930/run008007/event008007.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008004.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0930/run008008/event008008.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008004.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0930/run008010/event008010.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008009.dat &
wait
