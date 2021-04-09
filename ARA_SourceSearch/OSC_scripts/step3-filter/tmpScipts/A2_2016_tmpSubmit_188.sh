#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1113/run008232/event008232.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008228.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1113/run008233/event008233.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008228.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1114/run008234/event008234.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008228.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1114/run008236/event008236.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008235.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1114/run008237/event008237.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008235.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1114/run008238/event008238.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008235.dat &
wait
