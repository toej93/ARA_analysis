#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0304/run003145/event003145.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003137.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0304/run003146/event003146.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003137.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0304/run003147/event003147.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003137.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0304/run003148/event003148.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003137.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0304/run003149/event003149.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003137.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0304/run003150/event003150.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003137.dat &
wait
