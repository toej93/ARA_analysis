#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1013/run004369/event004369.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004365.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1014/run004371/event004371.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004370.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1014/run004372/event004372.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004370.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1014/run004373/event004373.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004370.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1014/run004374/event004374.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004370.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/1015/run004376/event004376.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004375.dat &
wait
