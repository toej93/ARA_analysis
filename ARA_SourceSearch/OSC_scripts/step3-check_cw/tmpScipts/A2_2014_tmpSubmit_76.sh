#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0423/run003462/event003462.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003461.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0423/run003463/event003463.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003461.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0423/run003465/event003465.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003461.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0423/run003466/event003466.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003461.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0424/run003467/event003467.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003461.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0424/run003468/event003468.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003461.dat &
wait
