#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0909/run006156/event006156.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006154.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0909/run006157/event006157.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006154.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0909/run006158/event006158.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006154.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0909/run006160/event006160.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006159.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0910/run006161/event006161.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006159.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2015/0910/run006162/event006162.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2015/pedestalValues.run006159.dat &
wait
date 
