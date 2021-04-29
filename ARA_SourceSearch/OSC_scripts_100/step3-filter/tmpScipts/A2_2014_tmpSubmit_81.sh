#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0503/run003513/event003513.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003511.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0503/run003514/event003514.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003511.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0503/run003515/event003515.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003511.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0503/run003517/event003517.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003516.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0503/run003518/event003518.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003516.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0504/run003519/event003519.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003516.dat &
wait
