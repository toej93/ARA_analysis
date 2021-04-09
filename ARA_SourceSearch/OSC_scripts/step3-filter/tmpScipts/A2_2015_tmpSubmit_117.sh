#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0521/run005607/event005607.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005603.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0521/run005609/event005609.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005608.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0522/run005610/event005610.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005608.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0522/run005611/event005611.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005608.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0522/run005612/event005612.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005608.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0523/run005614/event005614.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005613.dat &
wait
