#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0427/run003484/event003484.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003480.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0430/run003499/event003499.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003485.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0430/run003501/event003501.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003500.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0430/run003502/event003502.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003500.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0501/run003503/event003503.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003500.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0501/run003504/event003504.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003500.dat &
wait
