#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0304/run003139/event003139.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003137.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0304/run003140/event003140.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003137.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0304/run003141/event003141.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003137.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0304/run003142/event003142.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003137.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0304/run003143/event003143.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003137.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0304/run003144/event003144.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003137.dat &
wait
