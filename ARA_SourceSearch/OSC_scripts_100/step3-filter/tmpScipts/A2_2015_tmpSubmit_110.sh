#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0511/run005555/event005555.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005553.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0511/run005556/event005556.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005553.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0512/run005557/event005557.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005553.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0512/run005559/event005559.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005558.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0512/run005560/event005560.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005558.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0512/run005561/event005561.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005558.dat &
wait
