#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0724/run003952/event003952.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003948.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0724/run003954/event003954.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003953.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0724/run003955/event003955.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003953.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0724/run003956/event003956.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003953.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0725/run003957/event003957.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003953.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0725/run003959/event003959.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003958.dat &
wait
