#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0310/run003217/event003217.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003215.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0310/run003218/event003218.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003215.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0310/run003219/event003219.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003215.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0311/run003221/event003221.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003220.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0311/run003222/event003222.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003220.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0311/run003223/event003223.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003220.dat &
wait
