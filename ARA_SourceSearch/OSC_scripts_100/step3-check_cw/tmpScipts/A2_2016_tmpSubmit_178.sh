#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1029/run008156/event008156.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008155.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1029/run008157/event008157.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008155.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1029/run008158/event008158.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008155.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1029/run008159/event008159.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008155.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1030/run008161/event008161.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008160.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2016/1030/run008162/event008162.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2016/pedestalValues.run008160.dat &
wait
