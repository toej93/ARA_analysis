#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1001/run004201/event004201.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004200.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1001/run004217/event004217.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004215.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1002/run004216/event004216.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004215.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1002/run004218/event004218.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004215.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1003/run004221/event004221.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004220.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1003/run004302/event004302.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004300.dat &
wait
