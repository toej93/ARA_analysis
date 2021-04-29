#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0331/run003349/event003349.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003346.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0331/run003350/event003350.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003346.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0331/run003352/event003352.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003351.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0401/run003353/event003353.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003351.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0401/run003354/event003354.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003351.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0401/run003355/event003355.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003351.dat &
wait
