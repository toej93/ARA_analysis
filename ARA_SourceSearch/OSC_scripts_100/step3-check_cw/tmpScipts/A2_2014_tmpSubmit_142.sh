#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0830/run004151/event004151.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004138.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0830/run004152/event004152.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004138.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0831/run004157/event004157.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004155.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0831/run004158/event004158.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004155.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0901/run004159/event004159.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004155.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0901/run004163/event004163.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run004160.dat &
wait
date 
