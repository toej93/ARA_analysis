#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1027/run008148/event008148.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008147.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1027/run008150/event008150.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008147.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1028/run008151/event008151.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008147.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1028/run008152/event008152.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008147.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1028/run008153/event008153.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008147.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1028/run008154/event008154.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008147.dat &
wait
