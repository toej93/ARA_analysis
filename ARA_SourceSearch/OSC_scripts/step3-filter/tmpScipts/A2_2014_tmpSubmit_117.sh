#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0619/run003780/event003780.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003777.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0619/run003781/event003781.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003777.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0619/run003783/event003783.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003782.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0620/run003784/event003784.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003782.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0620/run003785/event003785.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003782.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0620/run003786/event003786.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003782.dat &
wait
