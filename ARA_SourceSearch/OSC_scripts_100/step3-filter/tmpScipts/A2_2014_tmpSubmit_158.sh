#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=02:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0825/run004095/event004095.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004093.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0825/run004101/event004101.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004098.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0826/run004085/event004085.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004080.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0826/run004090/event004090.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004088.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0827/run004086/event004086.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004080.dat &
./v2_analysis_filter ${ISSIM} ${STATION} ${YEAR} ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0827/run004097/event004097.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004093.dat &
wait
