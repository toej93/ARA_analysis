#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1208/run006532/event006532.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006528.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1209/run006534/event006534.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006533.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1209/run006535/event006535.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006533.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1209/run006536/event006536.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006533.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1209/run006537/event006537.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006533.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/1209/run006539/event006539.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006538.dat &
wait
