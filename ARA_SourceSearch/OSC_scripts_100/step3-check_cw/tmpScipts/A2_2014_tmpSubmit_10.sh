#!/bin/bash

#SBATCH --mail-type=FAIL
#SBATCH --time=15:10:00

eval 'source /users/PCON0003/cond0068/.bash_profile_pitzer_cvmfs'
date 
cd /users/PAS0654/osu8354/ARA_cvmfs/source/AraRoot/analysis/

./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0127/run002960/event002960.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002951.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0128/run002963/event002963.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002961.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0129/run002967/event002967.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002966.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0129/run002968/event002968.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002966.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0129/run002969/event002969.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002966.dat &
./v2_analysis_CWID ${ISSIM} ${STATION} ${YEAR} 1 ${SUMMARYDIR} ${OUTDIR} /fs/project/PAS0654/ARA_DATA/A23/100pct/RawData/A2/2014/0129/run002970/event002970.root /fs/project/PAS0654/ARA_DATA/A23/peds/A2/2014/pedestalValues.run002966.dat &
wait
date 
