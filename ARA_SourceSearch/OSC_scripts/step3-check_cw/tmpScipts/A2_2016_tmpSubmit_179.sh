#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1030/run008163/event008163.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008160.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1030/run008164/event008164.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008160.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1031/run008166/event008166.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008165.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1031/run008167/event008167.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008165.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1031/run008168/event008168.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008165.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1031/run008169/event008169.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008165.dat &
wait
