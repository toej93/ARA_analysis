#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0716/run003915/event003915.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003913.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0716/run003916/event003916.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003913.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0717/run003917/event003917.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003913.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0717/run003919/event003919.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003918.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0717/run003920/event003920.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003918.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0717/run003921/event003921.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003918.dat &
wait
