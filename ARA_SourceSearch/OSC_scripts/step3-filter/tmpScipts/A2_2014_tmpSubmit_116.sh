#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0617/run003773/event003773.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003765.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0618/run003774/event003774.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003765.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0618/run003775/event003775.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003765.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0618/run003776/event003776.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003765.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0618/run003778/event003778.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003777.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0619/run003779/event003779.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003777.dat &
wait
