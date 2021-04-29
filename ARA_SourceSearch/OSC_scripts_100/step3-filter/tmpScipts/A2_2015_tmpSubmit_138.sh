#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0622/run005765/event005765.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005763.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0622/run005766/event005766.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005763.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0622/run005767/event005767.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005763.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0623/run005769/event005769.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005768.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0623/run005770/event005770.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005768.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0623/run005771/event005771.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005768.dat &
wait
