#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=06:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0219/run003071/event003071.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003062.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0219/run003073/event003073.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003072.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0221/run003080/event003080.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003072.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0221/run003083/event003083.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003082.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0222/run003084/event003084.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003082.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/scratch/PAS0654/jorge/ARA_data/10pct/A2/2014/0222/run003085/event003085.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003082.dat &
wait
