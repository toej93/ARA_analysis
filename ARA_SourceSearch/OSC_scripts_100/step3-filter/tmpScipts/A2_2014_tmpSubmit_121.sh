#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0625/run003810/event003810.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003807.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0625/run003811/event003811.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003807.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0625/run003813/event003813.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003812.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0626/run003814/event003814.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003812.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0702/run003844/event003844.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003843.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0702/run003845/event003845.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003843.dat &
wait
