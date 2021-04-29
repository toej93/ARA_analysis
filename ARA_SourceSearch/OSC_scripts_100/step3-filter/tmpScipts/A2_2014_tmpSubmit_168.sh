#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0923/run004163/event004163.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004160.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0923/run004187/event004187.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004175.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0923/run004192/event004192.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004175.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0924/run004189/event004189.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004175.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0924/run004204/event004204.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004200.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0925/run004176/event004176.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004175.dat &
wait
