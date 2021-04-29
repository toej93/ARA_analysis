#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0411/run003402/event003402.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003401.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0411/run003403/event003403.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003401.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0411/run003404/event003404.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003401.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0411/run003405/event003405.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003401.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0412/run003407/event003407.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003406.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0412/run003408/event003408.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003406.dat &
wait
