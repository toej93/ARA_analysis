#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0304/run003163/event003163.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003137.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0304/run003164/event003164.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003137.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0304/run003165/event003165.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003137.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0304/run003166/event003166.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003137.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0304/run003167/event003167.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003137.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0304/run003168/event003168.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003137.dat &
wait
