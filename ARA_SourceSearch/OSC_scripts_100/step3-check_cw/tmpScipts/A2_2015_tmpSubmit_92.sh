#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0414/run005420/event005420.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005418.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0414/run005421/event005421.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005418.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0415/run005422/event005422.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005418.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0415/run005424/event005424.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005423.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0415/run005425/event005425.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005423.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0415/run005426/event005426.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005423.dat &
wait
