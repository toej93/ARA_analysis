#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0520/run005600/event005600.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005598.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0520/run005601/event005601.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005598.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0520/run005602/event005602.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005598.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0520/run005604/event005604.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005603.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0521/run005605/event005605.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005603.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0521/run005606/event005606.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005603.dat &
wait
