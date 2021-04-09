#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0425/run005472/event005472.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005468.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0425/run005474/event005474.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005473.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0425/run005475/event005475.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005473.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0425/run005476/event005476.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005473.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0426/run005477/event005477.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005473.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2015/0426/run005479/event005479.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run005478.dat &
wait
