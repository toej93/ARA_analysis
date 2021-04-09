#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0324/run003309/event003309.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003285.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0324/run003310/event003310.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003285.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0324/run003311/event003311.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003285.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0324/run003312/event003312.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003285.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0324/run003313/event003313.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003285.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0324/run003315/event003315.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003314.dat &
wait
