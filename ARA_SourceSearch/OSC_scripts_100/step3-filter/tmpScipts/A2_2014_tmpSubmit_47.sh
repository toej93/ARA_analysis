#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0316/run003247/event003247.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003245.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0316/run003248/event003248.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003245.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0316/run003249/event003249.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003245.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0316/run003251/event003251.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003250.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0317/run003252/event003252.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003250.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0317/run003253/event003253.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003250.dat &
wait
