#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0221/run006908/event006908.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006906.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0221/run006909/event006909.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006906.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0221/run006910/event006910.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006906.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0221/run006911/event006911.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006906.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0222/run006912/event006912.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006906.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/0222/run006913/event006913.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run006906.dat &
wait
