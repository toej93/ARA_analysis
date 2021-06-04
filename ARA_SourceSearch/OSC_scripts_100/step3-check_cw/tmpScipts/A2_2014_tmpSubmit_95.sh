#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0620/run003786/event003786.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003782.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0620/run003788/event003788.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003787.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0620/run003789/event003789.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003787.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0620/run003790/event003790.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003787.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0621/run003791/event003791.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003787.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0621/run003793/event003793.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run003792.dat &
wait
date 
